DROP TABLE IF EXISTS `advising_app`.`new_table`;





-- order of dropping tables matters b/c otherwise it wont work due to foreign key constraints
DROP TABLE IF EXISTS `advising_app`.`schedule`;
DROP TABLE IF EXISTS `advising_app`.`graduationrequirement`;
DROP TABLE IF EXISTS `advising_app`.`course`;
DROP TABLE IF EXISTS `advising_app`.`advisors_students`;
DROP TABLE IF EXISTS `advising_app`.`advisor`;
DROP TABLE IF EXISTS `advising_app`.`student`;
DROP TABLE IF EXISTS `advising_app`.`major`;
DROP TABLE IF EXISTS `advising_app`.`person`;

-- comment here
CREATE TABLE `advising_app`.`person` (
  -- `idPerson` INT NOT NULL, -- we will not have a person id in version 2.
  `eNumber` CHAR(8) NOT NULL,
  `password` CHAR(16) NOT NULL,
  `isStudent` BOOL NOT NULL, -- isStudent == !isAdvisor
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`eNumber`),
  UNIQUE INDEX `eNumber_UNIQUE` (`eNumber` ASC)
);


CREATE TABLE `advising_app`.`major` (
  `idMajor` int NOT NULL,
  `abbreviation` VARCHAR(4)  NOT NULL,
  `fullname` VARCHAR(45)  NOT NULL,
  `required_course_ids` VARCHAR(250) NULL,
  `total_courses_reqd` int NULL,
  PRIMARY KEY (`idMajor`)
  -- UNIQUE INDEX `eNumber_UNIQUE` (`eNumber` ASC));
);


CREATE TABLE `advising_app`.`student` (
  `eNumberStudent` CHAR(8) NOT NULL,
  `idMajor` int NOT NULL,
  PRIMARY KEY (`eNumberStudent`),
  FOREIGN KEY (`eNumberStudent`) REFERENCES `advising_app`.person(`eNumber`) ON DELETE CASCADE,
  FOREIGN KEY (`idMajor`) REFERENCES `advising_app`.major(`idMajor`) ON DELETE CASCADE
        
  -- // derived values...
  -- total credits
  
  -- UNIQUE INDEX `eNumber_UNIQUE` (`eNumber` ASC)
);

CREATE TABLE `advising_app`.`advisor` (
  `eNumberAdvisor` CHAR(8) NOT NULL,
  `adviseeList` VARCHAR(200) NULL, 
  PRIMARY KEY (`eNumberAdvisor`),
  FOREIGN KEY (`eNumberAdvisor`)  REFERENCES `advising_app`.person(`eNumber`) ON DELETE CASCADE
);

-- we will store a list of student eNumbers for each advisor instead of having an advisor table. 
-- question: how will student know their advisor?
-- CREATE TABLE `advising_app`.`advisors_students` (
  -- `eNumberAdvisor` CHAR(8) NOT NULL,
  -- `eNumberStudent` CHAR(8) NOT NULL,
  -- PRIMARY KEY (`eNumberAdvisor`, `eNumberStudent`),
  -- FOREIGN KEY (`eNumberAdvisor`)  REFERENCES `advising_app`.advisor(`eNumberAdvisor`) ON DELETE CASCADE,
  -- FOREIGN KEY (`eNumberStudent`)  REFERENCES `advising_app`.student(`eNumberStudent`) ON DELETE CASCADE
-- );


CREATE TABLE `advising_app`.`course` (
  `idcourse` CHAR(8) NOT NULL,
  `idMajor` int NOT NULL,
  `coursename` VARCHAR(45) NOT NULL,
  `description` VARCHAR(700) NULL,
  `credit` DECIMAL(4,2) NOT NULL,

  `aoks` VARCHAR(100) NULL,
  `tags` VARCHAR(100) NULL,
  `other` VARCHAR(100) NULL,

  `prequisites` VARCHAR(100) NULL,
  -- `corequisites` VARCHAR(100) NULL,  -- not needed anymore
  
  
  -- `notes` VARCHAR(100) NULL, -- not needed anymore
  -- `offerings` VARCHAR(100) NOT NULL, -- not needed anymore
  PRIMARY KEY (`idcourse`),
  FOREIGN KEY (`idMajor`) REFERENCES `advising_app`.major(`idMajor`)
);


CREATE TABLE `advising_app`.`graduationrequirement` (
  `idgradrequirement` int NOT NULL, -- 1
  
  -- `majorcredits` decimal NOT NULL, -- 32 -- not needed anymore
  `graduationcredits` DECIMAL(4,2) NOT NULL, -- 128
  `UpperLevelcredits` DECIMAL(4,2) NOT NULL, -- 40
  `AoksTagsProficiencyAndOther` VARCHAR(550) NOT NULL,
  PRIMARY KEY (`idgradrequirement`)
);

-- our schedule is simpler, and is one per student.
CREATE TABLE `advising_app`.`schedule` (
  `eNumberStudent` CHAR(8) NOT NULL,
  `time` CHAR(50) NOT NULL, -- Year, Semester, 1st/2nd half, duration...
  `courses` VARCHAR(150) NULL, -- holds the former, "`idcourse` CHAR(8) NULL,".
  PRIMARY KEY (`eNumberStudent`, `time`),
  FOREIGN KEY (`eNumberStudent`) REFERENCES `advising_app`.student(`eNumberStudent`)
);
-- CREATE TABLE `advising_app`.`schedule` (
  -- `eNumberStudent` CHAR(8) NOT NULL,
  -- `time` CHAR(50) NOT NULL, -- Year, Semester, 1st/2nd half, duration...
  -- `slot` int NOT NULL, -- AUTOGEN PER KEY, -- or slot 1 through 8
  -- `idcourse` CHAR(8) NULL,
  -- PRIMARY KEY (`eNumberStudent`, `time`),
  -- FOREIGN KEY (`eNumberStudent`) REFERENCES `advising_app`.student(`eNumberStudent`)
-- );