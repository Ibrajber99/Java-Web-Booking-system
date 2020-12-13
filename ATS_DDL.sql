create DATABASE if not exists ATS;
use ATS;

/*Employee Table DDL*/
CREATE TABLE IF NOT exists Employee
(
	EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
	SIN VARCHAR(9) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    payRatePerHr INT NOT NULL,
    DateCreated DATE NOT NULL,
    IsArchived BIT
);


/*Team Table DDL*/
CREATE TABLE IF NOT EXISTS Team
(
	TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(255) NOT NULL,
    OnCALL   bit NOT NULL,
    DateCreated DATE NOT NULL,
    Status BIT
);



/*Teammember Table DDL*/
CREATE TABLE IF NOT EXISTS TeamMember
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT NOT NULL,
    TeamID INT NOT NULL,
    DateCreated DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TeamID)  REFERENCES Team(TeamID)
);

/*Task Table DDL*/
CREATE TABLE IF NOT EXISTS Task
(
	TaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskName VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Duration INT NOT NULL,
    DateCreated DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS Employee_Skill
(
	EmpTaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskID INT,
    EmployeeID INT,
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE IF NOT EXISTS Job
(
	JobID INT PRIMARY KEY AUTO_INCREMENT,
    Description VARCHAR(255),
    Clientname VARCHAR(255) NOT NULL,
    teamID INT NOT NULL,
	dateCreated DATE NOT NULL,
    IsEmergencyBooking BIT,
	FOREIGN KEY (teamID) REFERENCES Team(TeamID)	
);



CREATE TABLE IF NOT EXISTS Job_Task
(
	jobTaskID INT PRIMARY KEY AUTO_INCREMENT,
    JobID INT,
    TaskID INT,
    FOREIGN KEY (JobID) REFERENCES Job(JobID),
    FOREIGN KEY (TaskID) REFERENCES Task(TaskID)
);

CREATE TABLE IF NOT EXISTS team_schedual
(
	schedualID INT PRIMARY KEY AUTO_INCREMENT,
    teamID INT NOT NULL,
    jobID  INT NOT NULL,
    jobDate DATE NOT NULL,
    startTime Time NOT NULL,
    endTime Time NOT NULL,
    FOREIGN KEY(teamID) REFERENCES Team(TeamID),
    FOREIGN KEY(jobID) REFERENCES Job(JobID)
);



CREATE TABLE IF NOT EXISTS Job_Financials
(
	jobFinancialsID INT PRIMARY KEY AUTO_INCREMENT,
    JobID INT NOT NULL,
    Cost DOUBLE NOT NULL,
    Revenue DOUBLE NOT NULL,
    FOREIGN KEY(JobID) REFERENCES Job(JobID)
);

























































