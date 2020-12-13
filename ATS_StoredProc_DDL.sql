
/* STORED PROC for Getting Employees*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_EMPLOYEES;
CREATE PROCEDURE GET_EMPLOYEES
()
	BEGIN
		SELECT * FROM Employee;
    END//
DELIMITER ;  



/* STORED PROC for Getting Active Employees*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_ACTIVE_EMPLOYEES;
CREATE PROCEDURE GET_ACTIVE_EMPLOYEES
()
	BEGIN
		SELECT * FROM Employee WHERE IsArchived = 1;
    END//
DELIMITER;  



/* STORED PROC for Getting Archived Employees*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_ARCHIVED_EMPLOYEES;
CREATE PROCEDURE GET_ARCHIVED_EMPLOYEES
()
	BEGIN
		SELECT * FROM Employee WHERE IsArchived =0;
    END//
DELIMITER;  

/* STORED PROC for ARCHIVING Employees*/
DELIMITER //
DROP PROCEDURE IF EXISTS ARCHIVE_EMPLOYEE;
CREATE PROCEDURE ARCHIVE_EMPLOYEE
(IN employeeID INT, updateDate DATE)
	BEGIN
		UPDATE Employee SET IsArchived = 0, DateCreated = updateDate
        WHERE Employee.EmployeeID = employeeID;
    END//
DELIMITER;  

/* STORED PROC for Getting Deleting Employees*/
DELIMITER //
CREATE PROCEDURE DELETE_EMPLOYEE
(IN empId INT)
	BEGIN
		BEGIN
      DELETE FROM Employee_Skill WHERE Employee_Skill.EmployeeID = empId;
		END;
      DELETE FROM Employee WHERE Employee.EmployeeID = empID;
    END//    
DELIMITER 



/* STORED PROC for RESTORING Employees*/
DELIMITER //
DROP PROCEDURE IF EXISTS RESTORE_ARCHIVED_EMPLOYEE;
CREATE PROCEDURE RESTORE_ARCHIVED_EMPLOYEE
(IN employeeID INT,  updateDate DATE)
	BEGIN
		UPDATE Employee SET IsArchived = 1, DateCreated = updateDate
        WHERE Employee.EmployeeID = employeeID;
    END//
DELIMITER;  


/*STORED PROC to retrieve employee by ID*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_EMPLOYEE_BY_ID;
CREATE PROCEDURE GET_EMPLOYEE_BY_ID
(IN id INT)
	BEGIN
		SELECT * FROM Employee WHERE Employee.EmployeeID = id;
    END//
DELIMITER ;  

/*STORED PROC to search employee SIN*/
DELIMITER //
DROP PROCEDURE IF EXISTS SEARCH_EMPLOYEE_SIN;
CREATE PROCEDURE SEARCH_EMPLOYEE_SIN
(IN sin VARCHAR(9))
	BEGIN
		SELECT Employee.SIN FROM Employee WHERE Employee.SIN = sin;
    END//
DELIMITER ; 


/* STORED PROC for Getting Team*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_TEAMS;
CREATE PROCEDURE GET_TEAMS
()
	BEGIN
		SELECT * FROM Team;
    END//
DELIMITER ;  

/* STORED PROC for Getting Archived Team*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_ARCHIVED_TEAMS;
CREATE PROCEDURE GET_ARCHIVED_TEAMS
()
	BEGIN
		SELECT * FROM Team WHERE Status = 0;
    END//
DELIMITER ;  

/* STORED PROC for Getting Active Team*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_ACTIVE_TEAMS;
CREATE PROCEDURE GET_ACTIVE_TEAMS
()
	BEGIN
		SELECT * FROM Team WHERE Status = 1;
    END//
DELIMITER ;  


/* STORED PROC for Getting Team future job count*/
DELIMITER //
DROP PROCEDURE IF EXISTS COUNT_TEAM_FUTURE_JOB;
CREATE PROCEDURE COUNT_TEAM_FUTURE_JOB
(IN teamID INT)
	BEGIN
		SELECT COUNT(*) AS JOBS FROM team_schedual
		WHERE JobDate > CURDATE() AND team_schedual.TeamID = teamID;
    END//
DELIMITER ;  

/* STORED PROC for Getting all Team jobs*/
DELIMITER //
DROP PROCEDURE IF EXISTS COUNT_ALL_TEAM_JOB;
CREATE PROCEDURE COUNT_ALL_TEAM_JOB
(IN teamID INT)
	BEGIN
		SELECT COUNT(*) AS JOBS FROM team_schedual
		WHERE team_schedual.TeamID = teamID;
    END//
DELIMITER ;  

/* STORED PROC for Archiving Team*/
DELIMITER //
DROP PROCEDURE IF EXISTS ARCHIVE_TEAM;
CREATE PROCEDURE ARCHIVE_TEAM
(IN teamID INT)
	BEGIN
		UPDATE TEAM SET Status = 0 WHERE Team.TeamID = teamID;
    END//
DELIMITER ;

/* STORED PROC for deleting Team*/
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_TEAM;
CREATE PROCEDURE DELETE_TEAM
(IN teamID INT)
	BEGIN
		DELETE FROM TeamMember WHERE TeamMember.TeamID = teamID;
        DELETE FROM Team WHERE Team.TeamID = teamID;
    END//
DELIMITER ;

/* STORED PROC for Getting Team jobs*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_TEAM_JOBS;
CREATE PROCEDURE GET_TEAM_JOBS
(IN teamID INT)
	BEGIN
		SELECT * FROM JOB WHERE TeamID = teamID;
    END//
DELIMITER ;


/* STORED PROC for Getting Tasks*/
DROP PROCEDURE IF EXISTS GET_TASKS;
DELIMITER //
CREATE PROCEDURE GET_TASKS
()
	BEGIN
		SELECT * FROM Task;
    END//
DELIMITER ;  

/* STORED PROC for Getting Task BY ID*/
DROP PROCEDURE IF EXISTS GET_TASK_BY_ID;
DELIMITER //
CREATE PROCEDURE GET_TASK_BY_ID
(IN taskId INT)
	BEGIN
		SELECT * FROM Task WHERE Task.TaskID = taskId;
    END//
DELIMITER ; 


/* STORED PROC for creating an Employee*/
DELIMITER //
DROP PROCEDURE IF EXISTS CREATE_EMPLOYEE;
CREATE PROCEDURE CREATE_EMPLOYEE
(IN employeeSIN INT,empFName VARCHAR(255),empLName VARCHAR(255),EmpPayperRate INT,DateCreated DATE,isarchived BIT)
	BEGIN
		INSERT INTO Employee (SIN,firstName,lastName,payRatePerHr,DateCreated,IsArchived)
        VALUES (employeeSIN,empFName,empLName,EmpPayperRate,DateCreated,isarchived);
    END//
DELIMITER ;  
  

 /* STORED PROC for creating a Team*/
 
DELIMITER //
DROP PROCEDURE IF EXISTS CREATE_TEAM; 
CREATE PROCEDURE CREATE_TEAM
(IN teamName VARCHAR(255), onCall bit, DateCreated DATE,status BIT)
	BEGIN
		INSERT INTO Team (TeamName,onCALL,DateCreated,Status)
        VALUES (teamName,onCall,DateCreated,status);
    END//
    
DELIMITER ;    
    
  
  /*STORED PROC for creating a Task*/
  
 DELIMITER //
DROP PROCEDURE IF EXISTS CREATE_TASK; 
CREATE PROCEDURE CREATE_TASK
(IN taskName VARCHAR(255), taskDesc VARCHAR(255), taskDuration INT, DateCreated DATE)
	BEGIN
		INSERT INTO Task (TaskName,Description,Duration,DateCreated)
        VALUES (taskName,taskDesc,taskDuration,DateCreated);
    END//    
DELIMITER ; 


/* STORED PROC for dleeting Employee*/
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_EMPLOYEE; 
CREATE PROCEDURE DELETE_EMPLOYEE
(IN sin varchar(255))
	BEGIN
		DELETE FROM Employee WHERE SIN = sin;
    END//    
DELIMITER ; 

/* STORED PROC for updating employee*/
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_EMPLOYEE; 
CREATE PROCEDURE UPDATE_EMPLOYEE
(IN employeeId INT,employeeSIN INT,empFName VARCHAR(255),empLName VARCHAR(255),EmpPayperRate INT,Datecreated DATE)
	BEGIN
		UPDATE Employee SET SIN = employeeSIN, firstName = empFName,lastName = empLName,
        payRatePerHr = EmpPayperRate, DateCreated = Datecreated 
        WHERE Employee.EmployeeID = employeeId;
    END//    
DELIMITER ; 

/* STORED PROC for deleting Task*/
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_TASK; 
CREATE PROCEDURE DELETE_TASK
(IN taskID INT)
	BEGIN
		DELETE FROM Employee_Skill
        WHERE Employee_Skill.TaskID = taskID;
        
        DELETE FROM Task WHERE Task.TaskID = taskID;
    END//    
DELIMITER;

/* STORED PROC for Getting Employee Skills*/
DELIMITER //
DROP PROCEDURE IF EXISTS COUNT_ASSIGNED_EMPLOYEE_SKILL; 
CREATE PROCEDURE COUNT_ASSIGNED_EMPLOYEE_SKILL
(IN taskID INT)
	BEGIN
		SELECT COUNT(*) AS CountRes FROM Employee_Skill
        WHERE Employee_Skill.TaskID = taskID;
    END//    
DELIMITER;


/* STORED PROC for Updating Task*/
DELIMITER //
DROP PROCEDURE IF EXISTS UPDATE_TASK; 
CREATE PROCEDURE UPDATE_TASK
(IN taskID INT,taskName VARCHAR(255),description VARCHAR(255),duration INT,dateCreated DATE)
	BEGIN
        UPDATE TASK SET TaskName = taskName,Description = description,Duration = duration,DateCreated = dateCreated
        WHERE TASK.TaskID = taskID;
    END//    
DELIMITER;


 /* STORED PROC for Getting Team Members*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_TEAM_MEMBERS; 
CREATE PROCEDURE GET_TEAM_MEMBERS
(IN teamID INT)
	BEGIN	
		SELECT Employee.* FROM TeamMember
		RIGHT JOIN Employee ON Employee.EmployeeID = TeamMember.EmployeeID
        WHERE TeamMember.TeamID IN (
			SELECT TeamID FROM Team
            WHERE teamID = teamID
        );

    END//    
DELIMITER ; 

/* STORED PROC for Getting Employee Team*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_EMPLOYEE_ASSIGNED_TEAMS;
CREATE PROCEDURE GET_EMPLOYEE_ASSIGNED_TEAMS
(IN employeeid INT)
	BEGIN	
		SELECT Team.* FROM TeamMember
		RIGHT JOIN Team ON Team.teamID = TeamMember.teamID
        WHERE TeamMember.EmployeeID IN (
			SELECT EmployeeID FROM Employee
            WHERE EmployeeID = employeeid
        ) AND Team.Status =1;

    END//    
DELIMITER ;

/* STORED PROC for Getting Unassigned employees to a team*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_UNASSIGNED_EMPLOYEES;
CREATE PROCEDURE GET_UNASSIGNED_EMPLOYEES
()
	BEGIN	
	SELECT DISTINCT Employee.* FROM Employee
		WHERE Employee.EmployeeID NOT IN
		(
			SELECT Teammember.EMployeeID FROM Teammember
    
		) OR Employee.EmployeeID NOT IN 
        
		(
			SELECT Teammember.EMployeeID FROM Teammember
			INNER JOIN Team ON Team.TeamID = Teammember.TeamID
			AND Team.Status = 1
		) AND Employee.IsArchived =1;
    END//    
DELIMITER;

            


/* STORED PROC for Getting Employee Skills*/
DELIMITER //
 DROP PROCEDURE IF EXISTS GET_EMPLOYEE_SKILLS;
CREATE PROCEDURE GET_EMPLOYEE_SKILLS
(IN employeeid INT)
	BEGIN	
		SELECT Task.TaskID,Task.TaskName,Task.Description,Task.Duration,Task.DateCreated FROM Employee_Skill
		RIGHT JOIN Task ON Task.TaskID = Employee_Skill.TaskID 
        WHERE Employee_Skill.EmployeeID IN (
			SELECT EmployeeID FROM Employee
            WHERE EmployeeID = employeeid
        );

    END//    
DELIMITER ; 


/* STORED PROC for Getting Employee unassigned skills*/
DELIMITER //
 DROP PROCEDURE IF EXISTS GET_EMPLOYEE_UNASSIGNED_SKILLS;
CREATE PROCEDURE GET_EMPLOYEE_UNASSIGNED_SKILLS
(IN employeeid INT)
	BEGIN	
		SELECT Task.* FROM Task
		WHERE Task.TaskID NOT IN (
			SELECT Employee_Skill.TaskID FROM Employee_Skill
			WHERE Employee_Skill.EmployeeID = employeeid
		);
    END//    
DELIMITER ; 




/*STORED PROC TO get all employees that hold that (task/skill)*/
DELIMITER //
 DROP PROCEDURE IF EXISTS GET_EMPLOYEES_TO_TASK;
CREATE PROCEDURE GET_EMPLOYEES_TO_TASK
(IN taskId INT)
	BEGIN	
		SELECT Employee.* FROM EMployee
		LEFT JOIN Employee_Skill ON Employee.EmployeeID = Employee_Skill.EmployeeID
		WHERE Employee_Skill.TASKID = taskId;
    END//    
DELIMITER ; 


/* STORED PROC for Inserting Skill to an employee*/
DELIMITER //
 DROP PROCEDURE IF EXISTS INSERT_EMPLOYEE_SKILL;
CREATE PROCEDURE INSERT_EMPLOYEE_SKILL
(IN employeeid INT,taskID INT)
	BEGIN	
		INSERT INTO Employee_Skill (EmployeeID,TaskID)
        VALUES(employeeid,taskID);
    END//    
DELIMITER ; 



/* STORED PROC for deleting Skill to an employee*/
DELIMITER //
 DROP PROCEDURE IF EXISTS DELETE_EMPLOYEE_SKILL;
CREATE PROCEDURE DELETE_EMPLOYEE_SKILL
(IN employeeid INT,taskID INT)
	BEGIN	
		DELETE FROM Employee_Skill 
        WHERE Employee_Skill.EmployeeID = employeeid AND
        Employee_Skill.TaskID = taskID;
    END//    
DELIMITER ; 


/*STORED PROC to get last inserted team*/
DELIMITER //
 DROP PROCEDURE IF EXISTS GET_LAST_INSERTED_TEAMID;
CREATE PROCEDURE GET_LAST_INSERTED_TEAMID
()
	BEGIN
        SELECT TeamID FROM Team ORDER BY TeamID DESC LIMIT 1;
    END//    
DELIMITER ; 



/*STORED PROC for team members insertion*/
DELIMITER //
 DROP PROCEDURE IF EXISTS INSERT_TEAM_MEMBERS;
CREATE PROCEDURE INSERT_TEAM_MEMBERS
(IN teamID INT, empID INT,  datecreated DATE)
	BEGIN
        INSERT INTO teammember(TeamID,EmployeeID,DateCreated)
        VALUES(teamID , empID, datecreated );
    END//    
DELIMITER ; 


/*STORED PROC for getting team by id*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_TEAM_ByID;
CREATE PROCEDURE GET_TEAM_ByID
(IN teamId INT)
	BEGIN
       SELECT * FROM Team WHERE Team.TeamID = teamId;
    END//    
DELIMITER ; 



/*STORED PROC to search employees by sin number*/
DELIMITER //
DROP PROCEDURE IF EXISTS SEARCH_EMPLOYEES_BY_SIN;
CREATE PROCEDURE SEARCH_EMPLOYEES_BY_SIN
(IN sinSearch VARCHAR(250))
	BEGIN
       SELECT * FROM Employee WHERE Employee.SIN LIKE CONCAT('%',sinSearch,'%');
    END//    
DELIMITER ; 


/*STORED PROC to search employees by last name */
DELIMITER //
DROP PROCEDURE IF EXISTS SEARCH_EMPLOYEES_BY_LNAME;
CREATE PROCEDURE SEARCH_EMPLOYEES_BY_LNAME
(IN lName VARCHAR(250))
	BEGIN
       SELECT * FROM Employee WHERE Employee.lastName LIKE CONCAT('%',lName,'%');
    END//    
DELIMITER ; 


/* a fucntion to chec if a team has jobs on that specific date*/
CREATE FUNCTION CHECK_TEAM_DATE (jobDate DATE,teamID INT)
RETURNS INT
RETURN (SELECT COUNT(*) AS RESULT FROM team_schedual 
WHERE team_schedual.JobDate =jobDate AND team_schedual.TeamID = teamID);


/*STORED PROC to get available teams by checking if they have a job on that day if not then return if yes
 check if the job date fits the schedule */
DELIMITER //
CREATE PROCEDURE GET_AVAILABLE_TEAM
(IN jobDate DATE, jobStartTime TIME, jobEndTime TIME,teamID int)
	BEGIN
      IF(SELECT CHECK_TEAM_DATE(jobDate,teamID) > 0)
      THEN
			SELECT Team.* FROM Team
			LEFT JOIN team_schedual ON 1=1
			WHERE ((team_schedual.startTime > jobEndTime OR team_schedual.startTime IS NULL)
				OR 
			team_schedual.EndTime < jobStartTime)
			AND (team_schedual.jobDate = jobDate) AND Team.TeamID = teamID;
        END IF;
        
	   IF(SELECT CHECK_TEAM_DATE(jobDate,teamID) = 0)
		THEN
			SELECT Team.* FROM Team WHERE Team.TeamID = teamID;
        END IF;
    END//    
DELIMITER 


/*STORED PROC to to insert job*/
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_JOB;
CREATE PROCEDURE INSERT_JOB
(IN description VARCHAR(255), clientName VARCHAR(255),teamid INT, datecreated DATE,emergencyJob BIT)
	BEGIN
       INSERT INTO Job (Description,Clientname,teamID,dateCreated,IsEmergencyBooking)
       VALUES(description,clientName,teamid,datecreated,emergencyJob);
    END//    
DELIMITER 

/*STORED PROC to add the job time to the team schedule */
DELIMITER //
DROP PROCEDURE IF EXISTS SCHEDULE_TEAM_JOB;
CREATE PROCEDURE SCHEDULE_TEAM_JOB
(IN teamid INT,jobId INT, jobdate DATE,jobstartTime TIME,jobEndTime TIME)
	BEGIN
       INSERT INTO team_schedual (teamID,jobID,jobDate,startTime,endTime)
       VALUES(teamid,jobId,jobdate,jobstartTime,jobEndTime);
    END//    
DELIMITER 

/*STORED PROC to Set team on call */
DELIMITER //
DROP PROCEDURE IF EXISTS SET_TEAM_ON_CALL;
CREATE PROCEDURE SET_TEAM_ON_CALL
(IN teamId INT)
	BEGIN
      UPDATE Team SET OnCall = 1 WHERE Team.TeamID = teamId;
    END//    
DELIMITER 

/*STORED PROC to remove team on call*/
DELIMITER //
DROP PROCEDURE IF EXISTS DISCARD_TEAM_ON_CALL;
CREATE PROCEDURE DISCARD_TEAM_ON_CALL
(IN teamId INT)
	BEGIN
      UPDATE Team SET OnCall = 0 WHERE Team.TeamID = teamId;
    END//    
DELIMITER 


/*STORED PROC to get team on call  */
DELIMITER //
DROP PROCEDURE IF EXISTS GET_TEAM_ON_CALL;
CREATE PROCEDURE GET_TEAM_ON_CALL
()
	BEGIN
      SELECT * FROM Team WHERE TEam.OnCall = 1;
    END//    
DELIMITER 


/*STORED PROC to insert job tasks*/
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_JOB_TASKS;
CREATE PROCEDURE INSERT_JOB_TASKS
(IN Jobid INT, taskId INT)
	BEGIN
       INSERT INTO Job_Task(JobID,TaskID)
       VALUES(Jobid,taskId);
    END//    
DELIMITER 

/*STORED PROC to insert job financials*/
DELIMITER //
DROP PROCEDURE IF EXISTS INSERT_JOB_FINANCIALS;
CREATE PROCEDURE INSERT_JOB_FINANCIALS
(IN Jobid INT, jobCost DECIMAL, jobRevenue DECIMAL)
	BEGIN
       INSERT INTO Job_Financials(JobID,Cost,Revenue)
       VALUES(Jobid,jobCost,jobRevenue);
    END//    
DELIMITER 

/*STORED PROC to get the last job createc id*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_LAST_INSERTED_JOBID;
CREATE PROCEDURE GET_LAST_INSERTED_JOBID
()
	BEGIN
       SELECT jobID FROM JOB ORDER BY jobID DESC LIMIT 1; 
    END//    
DELIMITER 

/*STORED PROC to get all jobs*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_JOBS;
CREATE PROCEDURE GET_JOBS
()
	BEGIN
		SELECT Job.*,Job_Financials.Cost,Job_Financials.Revenue,
		team_schedual.jobDate,team_schedual.startTime,team_schedual.endTime
			FROM team_schedual
		INNER JOIN Job ON job.JobID = team_schedual.JobID
		INNER JOIN Job_Financials ON Job_Financials.JobID = Job.JobID
        ORDER BY team_schedual.jobDate DESC;
    END//    
DELIMITER 

/*STORED PROC to get jobs by date*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_JOBS_BY_DATE;
CREATE PROCEDURE GET_JOBS_BY_DATE
(IN targetDate DATE)
	BEGIN
       SELECT Job.*,Job_Financials.Cost,Job_Financials.Revenue,
		team_schedual.jobDate,team_schedual.startTime,team_schedual.endTime
			FROM team_schedual
		INNER JOIN Job ON job.JobID = team_schedual.JobID
		INNER JOIN Job_Financials ON Job_Financials.JobID = Job.JobID
		WHERE jobDate = targetDate;
    END//    
DELIMITER 



/*STORED PROC to get a job by id*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_JOB_BY_ID;
CREATE PROCEDURE GET_JOB_BY_ID
(IN jobId INT)
	BEGIN
       SELECT Job.*,Job_Financials.Cost,Job_Financials.Revenue,
		team_schedual.jobDate,team_schedual.startTime,team_schedual.endTime
			FROM team_schedual
		INNER JOIN Job ON job.JobID = team_schedual.JobID
		INNER JOIN Job_Financials ON Job_Financials.JobID = Job.JobID
		WHERE Job.JobID = jobId;
    END//    
DELIMITER 


/*STORED PROC to get job related tasks*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_JOB_TASKS;
CREATE PROCEDURE GET_JOB_TASKS
(IN jobId INT)
	BEGIN
      SELECT Task.* FROM Job_Task
	  LEFT JOIN Task ON Task.TaskID = Job_Task.TaskID
	  WHERE Job_Task.JobID =jobId;
    END//    
DELIMITER 


/*STORED PROC to get jobs related to a team*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_TEAM_JOBS;
CREATE PROCEDURE GET_TEAM_JOBS
(IN teamId INT)
	BEGIN
		SELECT Job.*,Job_Financials.Cost,Job_Financials.Revenue,
		team_schedual.jobDate,team_schedual.startTime,team_schedual.endTime
			FROM team_schedual
		INNER JOIN Job ON job.JobID = team_schedual.JobID
		INNER JOIN Job_Financials ON Job_Financials.JobID = Job.JobID
		WHERE team_schedual.teamID = teamId;
    END//    
DELIMITER 



/*STORED PROC to delete a job*/
DELIMITER //
DROP PROCEDURE IF EXISTS DELETE_JOB;
CREATE PROCEDURE DELETE_JOB
(IN jobId INT)
	BEGIN
		DELETE FROM Job_Task WHERE Job_Task.JobID = jobId;
        DELETE FROM team_schedual WHERE team_schedual.jobID = jobId;
        DELETE FROM Job_Financials WHERE Job_Financials.JobID = jobId;
        DELETE FROM Job WHERE JOb.JobID = jobId;
    END//    
DELIMITER 


/*STORED PROC to get the current day job count*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_CURR_DAY_JOB_COUNT;
CREATE PROCEDURE GET_CURR_DAY_JOB_COUNT
()
	BEGIN
		SELECT COUNT(*) AS RESULT FROM team_schedual WHERE jobDate = CURDATE();
    END//    
DELIMITER 



/*STORED PROC to get the current  month cost*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_CURR_MONTH_COST;
CREATE PROCEDURE GET_CURR_MONTH_COST
()
	BEGIN
		SELECT SUM(Cost) AS CurrMonthCost FROM Job_Financials
		INNER JOIN team_schedual ON team_schedual.JobID = Job_Financials.JobID
		WHERE MONTH(team_schedual.jobDate) = MONTH(CURDATE());
    END//    
DELIMITER 

/*STORED PROC to get the current  month revenue*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_CURR_MONTH_REVENUE;
CREATE PROCEDURE GET_CURR_MONTH_REVENUE
()
	BEGIN
		SELECT SUM(Revenue) AS CurrMonthRevenue FROM Job_Financials
		INNER JOIN team_schedual ON team_schedual.JobID = Job_Financials.JobID
		WHERE MONTH(team_schedual.jobDate) = MONTH(CURDATE());
    END//    
DELIMITER 


/*STORED PROC to get the financial details by year*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_YEAR_COST;
CREATE PROCEDURE GET_YEAR_COST
(IN reportYear YEAR)
	BEGIN
		SELECT COALESCE(SUM(Cost),0) AS yearlyCost FROM Job_Financials
		INNER JOIN team_schedual ON team_schedual.JobID = Job_Financials.JobID
		WHERE YEAR(team_schedual.jobDate) = reportYear;
    END//    
DELIMITER 


/*STORED PROC to get the year revenue*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_YEAR_REVENUE;
CREATE PROCEDURE GET_YEAR_REVENUE
(IN reportYear YEAR)
	BEGIN
		SELECT COALESCE(SUM(Revenue),0) AS yearlyRevenue FROM Job_Financials
		INNER JOIN team_schedual ON team_schedual.JobID = Job_Financials.JobID
		WHERE YEAR(team_schedual.jobDate) = reportYear;
    END//    
DELIMITER 

/*STORED PROC to get the annual report by year*/
DELIMITER //
DROP PROCEDURE IF EXISTS GET_ANNUAL_REPORT;
CREATE PROCEDURE GET_ANNUAL_REPORT
(IN reportYear YEAR)
	BEGIN
		SELECT COALESCE(SUM(Revenue),0) AS monthRevenue,COALESCE(SUM(Cost),0) AS monthCost,
		MONTH(team_schedual.jobDate) AS Month FROM Job_Financials
		INNER JOIN team_schedual ON team_schedual.JobID = Job_Financials.JobID
		WHERE YEAR(team_schedual.jobDate) = reportYear
		GROUP BY MONTH(team_schedual.jobDate);
    END//    
DELIMITER 
