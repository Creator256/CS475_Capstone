-- NOTICE: please run the create_sql_tables_vX if you want to reset the values for simpleTestData_vX!

-- INSERT INTO `advising_app`.`person` (`idPerson`, `eNumber`, `password`, `isStudent`, `FirstName`, `LastName`) VALUES ('0', 'e0000000', 'test', '0', 'Andrew', 'D');

-- INSERT INTO `advising_app`.`person` (`idPerson`, `eNumber`, `password`, `isStudent`, `FirstName`, `LastName`) VALUES ('1', 'e0123456', 'test', '1', 'Matt', 'W');

INSERT INTO `advising_app`.`person`
(`eNumber`,
`password`,
`isStudent`,
`FirstName`,
`LastName`)
VALUES
('e0000000', '123456', '1', 'Test', 'Test'),
('e0011111', '123456', '0', 'John', 'Jeffrey'),
('e0022222', '123456', '0', 'Kathy', 'Rossi'),
('e0033333', '123456', '0', 'Dean', 'Jensen'),
('e0044444', '123456', '0', 'Gary', 'Smith'),
('e0055555', '123456', '0', 'Ali', 'Ghane'),
('e0999999', '123456', '1', 'John', 'Smith'),
('e0888888', '123456', '1', 'Jane', 'Doe'),
('e0777777', '123456', '1', 'James', 'Henderson'),
('e0666666', '123456', '1', 'Oh', 'Brother'),
('e0555555', '123456', '1', 'Darcy', 'Collins');


INSERT INTO `advising_app`.`major`
(`idMajor`,
`abbreviation`,
`fullname`,
`required_course_ids`,
`total_courses_reqd`)
VALUES
('0', 'NA', 'Non-Major Course', NULL, NULL),
('1', 'CS', 'Computer Science', 
'CS-220, CS-255, CS-310, 
CS-315, CS-318, CS-320, CS-360, CS-419, CS-420, CS-435, CS-475, 
MTH-151, MTH-152, MTH-301', 11.00),
('2', 'IS', 'Information Systems and Technology', NULL, NULL),
('3', 'CGE', 'Computer Gaming and Entertainment', NULL, NULL),
('4', 'MTH', 'Mathematics', NULL, NULL),
('5', 'ENG', 'English', NULL, NULL);


INSERT INTO `advising_app`.`student`
(`eNumberStudent`,
`idMajor`)
VALUES
('e0000000', 1), -- 1 is CS, 2 is IS, 3 is CGE
('e0999999', 1),
('e0888888', 1),
('e0777777', 2),
('e0666666', 3); 


INSERT INTO `advising_app`.`advisor`
(`eNumberAdvisor`,
`adviseeList`)
VALUES
('e0011111', 'e0000000, e0999999, e0666666'), 
('e0022222', NULL),
('e0033333', NULL),
('e0044444', 'e0777777'),
('e0055555', 'e0888888'); 


INSERT INTO `advising_app`.`course`
(`idcourse`,
`idMajor`,
`coursename`,
`description`,
`credit`,
`aoks`,
`tags`,
`other`,
`prequisites`)
VALUES
('CS-220', 1, 'Computer Science I', 'Covers machine organization, flow chart methodology, algorithm development, looping structures, problem formulation, and decomposition. During the laboratory portion, students use the computer facility to solve problems. This course is required for IS and CS majors and is recommended for majors in science and business seeking an in-depth introduction to the computer and computer programming. Fall Term, Spring Term.',
1.00, NULL, NULL, NULL, NULL), 
('CS-255', 1, 'Computer Science II', 'An in-depth study of computer hardware, from the logic gate level up through registers, and CPU devices. Primary and secondary memory and input/output, interrupts, and multiprocessor systems are discussed. Programming hardware using an assembler language is also present, and assembler features such as interrupts, internal and external subroutines, conditional assembly, real-time programming, and the macro language are covered. Prerequisite: CS 220.', 
1.00, NULL, NULL, NULL, '{ p: CS-220 }'),
('CS-315', 1, 'Web Design & Programming', 'Covers design of web sites using HTML, CGI, and script programming, including JavaScript, Perl, etc. Prerequisite: CS 220', 
1.00, NULL, NULL, NULL, '{ p: CS-220 }'),
('CS-318', 1, 'Obj-Orient Desgn & Prog in C++', 'C++ programming language, including extensions of the C language, operator overloading, function overloading, global scope resolution, references, the 145this146 pointer, classes and class inheritance, constructors and destructors, and input/output streams. Prerequisite: CS 255', 
1.00, NULL, NULL, NULL, '{ p: CS-255 }'),
('CS-420', 1, 'Operating Systems', 'Concepts include tasks and process representations, process coordination and synchronization, concurrent constructs in programming languages, process and job scheduling, performance and monitoring mathematical tools, virtual and physical memory management schemes, file management organization, device management, issues in real-time and distributed operating systems, security issues, and communications and networks. Prerequisites: CS 310 and CS 360. It is highly recommended, although not required, that the student also take CS 205 before taking CS 420.', 
1.00, NULL, NULL, NULL, '{ p: CS-310 } && { p: CS-360 }'),

('CGE-350', 3, 'Adv Computer Graphics', 'Emphasis is placed on 3-D graphics and various 145toolkits146 used to create this type of graphics such as Direct-X. Rendering of solid objects, life forms, fractal scenes and objects, terrains, 3-D modeling, lighting and shadowing, texturing, and other topics are discussed. Prerequisite: CS 220.', 
1.00, NULL, NULL, NULL, 'p: CS-220'),
('CGE-405', 3, 'Digital Cinema', 'This course applies the topics of computer animation, computer modeling and simulation, artificial intelligence, and computer graphics to the design of computer generated film. Using appropriate software packages such as those from Macromedia, the student learns how develop a script and then apply it to create scenes that go into the design of a computer-generated film. Prerequisites: CGE 350 and CGE 355.', 
1.00, NULL, NULL, NULL, '{ p: CGE-350 } && { p: CGE-355 }'),


('IS-424', 2, '^Intro System Analysis&Desgn', 'A study of the phases of analysis, design, and implementation of information systems. Topics include fact-gathering techniques, design of output, input, files, presentation techniques, system processing, project management, system testing, and documentation. A structured approach to system design and development is emphasized. Prerequisite: A course covering a high-level programming language.', 
1.00, NULL, NULL, NULL, '{ p: CS-220 } || { p: high-level-language } '),

('MTH-151', 4, 'Calculus I', 'Rate of change of a function, limits, continuity, derivatives of algebraic and trigonometric functions, applications of the derivative, and introduction to integration and applications. Prerequisite: MTH 132 or equivalent. Fall Term, Spring Term.', 
1.00, NULL, NULL, NULL, '{ p: MTH-132 } || { p: equivalent }'),
('MTH-152', 4, 'Calculus II', 'The definite integral with applications, transcendental functions, methods of integration, polar coordinates, and infinite series. Prerequisite: MTH 151 with a grade of C or better. Fall Term, Spring Term.', 
1.00, NULL, NULL, NULL, 'p: MTH-151'),
('MTH-301', 4, 'Discrete Mathmatics', 'Sets, logic, functions, graph theory, trees, counting, Boolean Algebra, vectors, and matrices. Prerequisite: MTH 151. Fall Term, Spring Term.', 
1.00, NULL, NULL, NULL, '{ p: MTH-151 } || { c: MTH-151 }'),

('FYS-100', 0, 'FYS Course Name', NULL, 
1.00, NULL, NULL, NULL, NULL),

('ENG-105', 5, 'Composition I', 'A two-part sequence of introductory courses, offering instruction and guidance designed to develop college-level writing and reading skills. ENG 105 focuses on increasing students\' written fluency; their ability to use the writing process as a means of discovering ideas; to see revision as a necessary and recursive part of the writing process; to see good writing as dependent on its context; and to create relationships between reading and writing. Fall Term, Spring Term.', 
1.00, NULL, NULL, NULL, NULL),
('ENG-106', 5, 'Composition II', 'ENG 106 focuses on increasing students\' scholarly literacy; their ability to manage written assignments that derive content from extensive reading; to rework drafts that, in logically complex ways, quote or paraphrase other texts; and to understand the varieties of purpose, especially persuasive, that different kinds of academic assignments based on reading might have. In-class introduction to the College\'s library and writing technology resources. Prerequisite: ENG 105, the equivalent, or acceptable score on the Writing Placement Test. Fall Term, Spring Term.', 
1.00, NULL, NULL, NULL, '{ p: ENG-105 } || { p: Writing-Placement-Test'),

('CS-205', 1, 'Linux', 'Half course Core topics include LINUX shell commands, shell scripts and related file systems. Several related topics such as file permission, process handling, sysadin tools, and the access of LINUX resources via application programs. Prequisite: CS 220 or one course covering a high-level programming language.', 
0.50, NULL, NULL, NULL, '{ p: CS-220 } || { p: IT-232 } || { p: high-level-language }'),
('CS-320', 1, 'Data Struct & Algorithmc Anlys', 'A coverage in great depth and detail of data structure concepts: stacks, queues, linked lists, binary and general trees, game trees, B trees, graphs, and sorting and searching techniques. Algorithms for developing and applying these structures are discussed in a systematic and logical manner. Other topics are abstract data types, information hiding, and object-oriented programming. Prerequisites: CS 255, CS 318, and MTH 301 or concurrent enrollment.', 
1.00, NULL, 'QuantitativeReasoning', NULL, '{ p: CS-255 && CS-318, && MTH-301 } || { c: CS-255 && CS-318, && MTH-301 }'), -- Take CS-255 && CS-318 previously, and MTH-301 previously or concurrently
('CS-360', 1, 'Computer Network Systems', 'Theory of a computer network is presented and various types of networks, including local area, wide area, and global networks, are discussed. Theory topics include network architecture, data transmission techniques, network topologies, network media, and network security. In addition, the student learns how to use network operating systems and how to generate programs for a system such as the Internet using JAVA and HTML programming tools. Case studies of Windows NT, Novell, the Internet, and intranet systems are given. Prerequisite: CS 220 or IT 228.', 
1.00, NULL, 'InformationLiteracy', NULL, '{ p: CS-220 && IT-228 }'),
('CS-418', 1, 'Artificial Intelligence', 'An introduction to fundamentals of artificial intelligence, including problem-solving techniques, search strategies and heuristics, and knowledge representation. First order logic, normal forms, unification, and resolution principles are introduced with applications to problem solving, theorem proving, logic, and database theory. Prerequisite: CS 255. Upon request.', 
1.00, NULL, NULL, NULL, '{ p: CS-255 }'),
('CS-419', 1, 'Java Programming and Web Development', 'Java syntax and semantics and implementation pragmatics for expressing object-oriented design patterns. Java implementation strategies for webbased applications using event-driven programming, concurrent threads, file I/O and database applications are studied. Documentation and debugging tools are introduced through various Integrated Development environments. ', 
1.00, NULL, NULL, NULL, '{ p:  CS -318 || CS-320 }'),
('CS-435', 1, 'Concepts of Program Languages', 'A comparative study of programming languages from perspectives of the designer, implementor, and user is central to this course. Regular grammars, regular expressions, finite state automata, context free grammars, and push-down automata are studied in the context of building programming language translators. Imperative, object-oriented, functional, and logic language classes are studied. Concepts covered include data and control abstractions, strong and weak typing, static and dynamic scoping, parameter passing and concurrency. Formal specifications and implementation strategies of the concepts are studied. Prerequisites: CS 310 and MTH 301.', 
1.00, NULL, NULL, NULL, '{ p: CS-310 } && { p: MTH-301 }'),
('CS-440', 1, 'Web Based Applications', 'This course covers ways to create dynamic Web applications using both server side and client side programming. In this course students will learn web application basics, ASP.NET application fundamentals, validation, basic forms authentication for web-based security, databinding from a datasource, creating and consuming web services, session state configuration, and application data caching. In addition, students will also learn how to embed maps into their web pages using the Google Maps API and the ArcGIS API. Prerequisites: CS 220, or IS 100.', 
1.00, NULL, NULL, NULL, '{ p: CS-220 } || { p: IS-100 }'),
('CS-460', 1, 'Computer Graphics', 'Features of graphics programs are considered, including two-and three-dimensional coordinate systems, transformations, perspectives, hidden-line algorithms and polygon filling (graphics), and boundary recognition, template matching, surface and edge enhancement (image processing). Prerequisites: MTH 152 and CS 220. Upon request.', 
1.00, NULL, NULL, NULL, '{ p: CS-220 } && { p: MTH-152 }'), -- #TAKE CS-220;
('CS-475', 1, 'Software Engineering', 'An introduction to the concepts of design, development, and maintenance of large-scale software systems. Chief programmer teams, the software life cycle, and underlying related topics are covered, including requirement analysis, implementation techniques, validation, verification, maintenance, documentation, user interfaces, reliability, software development tools, and programming environments. Various cost-estimation models are also introduced. Prerequisites: CS 420 and CS 435 or consent of the department. Annually.', 
1.00, NULL, 'Writing300/400, OralCommunication', 'Capstone', '{ p: CS-420 } && { p: CS-435 }'); -- #TAKE CS-420
INSERT INTO `advising_app`.`course`
(`idcourse`,
`idMajor`,
`coursename`,
`description`,
`credit`,
`aoks`,
`tags`,
`other`,
`prequisites`)
VALUES
('CGE-401', 3, '3 Dimensnl Comptr Game Dsgn', 'The main thrust is concerned with the application of concepts learned earlier, such as animation and simulation techniques, three dimensional graphics, and the incorporation of media components such as video, music, and sound in a highly interactive game. Students also learn how to develop story lines, scripting techniques, aspects of game theory, and infuse their games with simulated cognition and artificial intelligence. Prerequisites: CGE 350, CGE 355, CGE 357, and CS 418.', 
1.00, NULL, NULL, NULL, '{ p: CGE-303 }'),
('CGE-477', 3, 'CmptrGame&Entrtnmt Prjct Dev', 'This is the capstone course for the student majoring in computer game and entertainment technology. The student in this course applies all of the concepts and skills learned in previous CGE courses to produce a significant project. This activity will preferably be performed at a company as part of a project development for that company. Prerequisites: CGE 401, CGE 405, CGE 425.', 
1.00, NULL, 'Writing300/400, OralCommunication', 'Capstone', '{ p: CGE-401 && CGE-405 && CGE-425 }'), -- #TAKE CGE-401 CGE-405 CGE-425;

('IS-423', 2, '!Database Management Systems', 'Topics include defining data requirements and modeling those requirements using Entity Relationship Diagrams, creating physical databases using Microsoft SQL Server, and SQL coding for simple queries, complex queries, stored procedures, and triggers. Additional topics include data quality, data warehouses, data security and distributed databases. Prerequisite: CS 220.', 
1.00, NULL, NULL, NULL, '{p: CS-220}'),
('IS-425', 2, 'ManagementInformationSystems', 'Fundamentals of information systems in organizations, with a focus on the impact of information systems on organizational behavior, communications and managerial style. The use, misuse, and management of computer-based systems and their integration with organizational goals are emphasized. Information systems in the functional areas of marketing, production and finance are studied. The case study method is used. Prerequisite: CS 220 or IT 228', 
1.00, NULL, 'Writing300/400, SocialRspnsblty300/400', NULL, '{ p: CS-220 } || { p: IT-228 }'), -- Take CS-220(848) or IT-228(3541)
('IT-232', 2, '^Intro Programming Java', 'Full course The use of JAVA in performing object-oriented programming (OOP) is discussed, with emphasis on coding algorithms that solve business-world problems. Features of the JAVA language such as classes, objects, variables, control constructs, applets, and so on is covered in this course.', 
1.00, NULL, NULL, NULL, NULL),
('IT-228', 2, 'Computer Org & Architecture', 'Discusses the organization and architecture of the computer, including the functioning of the CPU, RAM, ROM< and I/O. Issues related to interfacing the computer to a network are also discussed, as is the role played by the operating system in controlling the hardware. Installation and use of operating systems is also considered.', 
1.00, NULL, NULL, NULL, NULL),

('BID-322', 0, 'EDU/PHL Phil Human Abilities', 'An examination of human ability and the social, cultural, philosophical, and political influences on interactions with those having differing abilities. What is normal? What is a disability? What is it like to have a disability? How does our conception of human nature influence how we see and treat those with disabilities? How are disabilities right movements attemping to alter our perception of disabilities? Why are looks so important to us and how do they influence out judgments? How do we perceive the bodies and faces of others? This course will address these questions and others by bringing philosophical inquiry and analysis to issues surrounding those with disabilities.', 
1.00, 'InquiryEthics&Justice, Social&PoliticalAnalysis', NULL, NULL, NULL);
-- ('CS-310', 1, 'Computer Org & Prog in Assembly', NULL, 1.00, NULL, NULL, 'p: CS-220'),
-- ('CS-310', 1, 'Computer Org & Prog in Assembly', NULL, 1.00, NULL, NULL, 'p: CS-220'),

-- ('CS-310', 1, 'Computer Org & Prog in Assembly', NULL, 1.00, NULL, NULL, 'p: CS-220');

INSERT INTO `advising_app`.`graduationrequirement`
(`idgradrequirement`,
`graduationcredits`,
`UpperLevelcredits`,
`AoksTagsProficiencyAndOther`)
VALUES
(1,
32.00,
10.00,
'experiential learning, Inquiry&EthicJustice, ReligiousStudiesContext, Literature, FineArts, HistoricalAnalysis, Social&PoliticalAnalysis, Cognitive&BehavioralSci, PhysicalScience, LifeScience, OralCommunication, QuantitativeReasoning, Writing300/400, InformationLiteracy, InterculturalGlobal, InterculturalDomestic, SocialRspnblty300/400, FYS-100, ENG-106, Capstone, experiential learning, mathematics proficiency, foreign language proficiency, writing proficiency, computer technology proficiency'
);

INSERT INTO `advising_app`.`schedule`
(`eNumberStudent`,
`time`,
`courses`)
VALUES
('e0000000',
'2018/2019',
'FYS-100, ENG-105, CS220, MTH-151, CS-315, ENG-106, CS-255, MTH-152'),
('e0000000',
'20189/2020',
'CS-318, MTH-301, CS-310, BID-322, CS-320, CS-360');

