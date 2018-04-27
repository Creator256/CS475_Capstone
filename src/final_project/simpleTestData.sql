

-- INSERT INTO `advising_app`.`person` (`idPerson`, `eNumber`, `password`, `isStudent`, `FirstName`, `LastName`) VALUES ('0', 'e0000000', 'test', '0', 'Andrew', 'D');

-- INSERT INTO `advising_app`.`person` (`idPerson`, `eNumber`, `password`, `isStudent`, `FirstName`, `LastName`) VALUES ('1', 'e0123456', 'test', '1', 'Matt', 'W');

INSERT INTO `advising_app`.`major`
(`idMajor`,
`abbreviation`,
`fullname`,
`required_course_ids`,
`total_courses_reqd`)
VALUES
('1', 'CS', 'Computer Science', NULL, NULL),
('2', 'IS', 'Information Systems and Technology', NULL, NULL),
('3', 'CGE', 'Computer Gaming and Entertainment', NULL, NULL);



INSERT INTO `advising_app`.`person`
(`idPerson`,
`eNumber`,
`password`,
`isStudent`,
`FirstName`,
`LastName`)
VALUES
('1', 'e0000000', '123456', '1', 'Test', 'Test'
'2', 'e0011111', '123456', '0', 'John', 'Jeffrey'
'3', 'e0022222', '123456', '0', 'Kathy', 'Rossi'
'4', 'e0033333', '123456', '0', 'Dean', 'Jensen'
'5', 'e0044444', '123456', '0', 'Gary', 'Smith'
'6', 'e0055555', '123456', '0', 'Ali', 'Ghane'
'7', 'e0999999', '123456', '1', 'John', 'Smith'
'8', 'e0888888', '123456', '1', 'Jane', 'Doe'
'9', 'e0777777', '123456', '1', 'James', 'Henderson'
'10', 'e0666666', '123456', '1', 'Oh', 'Brother'
'11', 'e0555555', '123456', '1', 'Darcy', 'Collins');
