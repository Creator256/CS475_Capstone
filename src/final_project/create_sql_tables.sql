DROP TABLE IF EXISTS `advising_app`.`new_table`;
CREATE TABLE `advising_app`.`new_table` (
  `idnew_table` INT NOT NULL,
  `new_tablecol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idnew_table`));





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
  `idPerson` INT NOT NULL,
  `eNumber` CHAR(8) NOT NULL,
  `password` CHAR(16) NOT NULL,
  `isStudent` BOOL NOT NULL, -- isStudent == !isAdvisor
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`idPerson`),
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
  
 -- UNIQUE INDEX `eNumber_UNIQUE` (`eNumber` ASC));
);

CREATE TABLE `advising_app`.`advisor` (
  `eNumberAdvisor` CHAR(8) NOT NULL,
  PRIMARY KEY (`eNumberAdvisor`),
  FOREIGN KEY (`eNumberAdvisor`)  REFERENCES `advising_app`.person(`eNumber`) ON DELETE CASCADE
);

CREATE TABLE `advising_app`.`advisors_students` (
  `eNumberAdvisor` CHAR(8) NOT NULL,
  `eNumberStudent` CHAR(8) NOT NULL,
  PRIMARY KEY (`eNumberAdvisor`, `eNumberStudent`),
  FOREIGN KEY (`eNumberAdvisor`)  REFERENCES `advising_app`.advisor(`eNumberAdvisor`) ON DELETE CASCADE,
  FOREIGN KEY (`eNumberStudent`)  REFERENCES `advising_app`.student(`eNumberStudent`) ON DELETE CASCADE
);



CREATE TABLE `advising_app`.`course` (
  `idcourse` CHAR(8) NOT NULL,
  `idMajor` int NOT NULL,
  `coursename` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  `credit` int NOT NULL,
  
  `tags` VARCHAR(100) NULL,
  `aoks` VARCHAR(100) NULL,
  `prequisites` VARCHAR(100) NULL,
  `corequisites` VARCHAR(100) NULL,
  
  
  `notes` VARCHAR(100) NULL,
  `offerings` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idcourse`),
  FOREIGN KEY (`idMajor`) REFERENCES `advising_app`.major(`idMajor`)
);


CREATE TABLE `advising_app`.`graduationrequirement` (
  `idgradrequirement` int NOT NULL, -- 1
  
  `majorcredits` INT NOT NULL, -- 32
  `graduationcredits` INT NOT NULL, -- 128
  `UpperLevelcredits` INT NOT NULL, -- 40
  `AoksTagsProficiencyAndOther` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`idgradrequirement`)
);

CREATE TABLE `advising_app`.`schedule` (
  `eNumberStudent` CHAR(8) NOT NULL,
  `time` CHAR(50) NOT NULL, -- Year, Semester, 1st/2nd half, duration...
  `slot` int NOT NULL, -- AUTOGEN PER KEY, -- or slot 1 through 8
  `idcourse` CHAR(8) NULL,
  PRIMARY KEY (`eNumberStudent`, `time`),
  FOREIGN KEY (`eNumberStudent`) REFERENCES `advising_app`.student(`eNumberStudent`)
);