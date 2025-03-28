CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,  
    FirstName CHAR(25),  
    LastName CHAR(25),  
    Salary INT,  
    JoiningDate DATETIME,  
    Department CHAR(25)
);
desc Worker;
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)  
VALUES  
(1, 'John', 'Dole', 50000, '2020-06-15 09:00:00', 'HR'),  
(2, 'Alice', 'Smith', 70000, '2018-09-23 10:30:00', 'Finance'),  
(3, 'Bob', 'White', 60000, '2019-12-01 08:45:00', 'IT'),  
(4, 'Arun', 'Johnson', 75000, '2021-01-10 11:15:00', 'HR'),  
(5, 'Michael', 'Luece', 80000, '2017-05-05 14:00:00', 'IT');

DELIMITER $$

CREATE PROCEDURE AddWorker(  
    IN p_Worker_Id INT,  
    IN p_FirstName CHAR(25),  
    IN p_LastName CHAR(25),  
    IN p_Salary INT(15),  
    IN p_JoiningDate DATETIME,  
    IN p_Department CHAR(25)  
)  
BEGIN  
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)  
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);  
END $$

DELIMITER ;
CALL AddWorker(6, 'Sophia', 'Taylor', 65000, '2022-03-15 09:30:00', 'Finance');
SELECT * FROM Worker;

DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(  
    IN p_Worker_Id INT,  
    OUT p_Salary INT  
)  
BEGIN  
    -- Retrieve salary for the given Worker_Id  
    SELECT Salary INTO p_Salary  
    FROM Worker  
    WHERE Worker_Id = p_Worker_Id;  
END $$

DELIMITER ;

SET @salary = 0;  


CALL GetWorkerSalary(3, @salary);  


SELECT @salary AS WorkerSalary;

DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(  
    IN p_Worker_Id INT,  
    IN p_Department CHAR(25)  
)  
BEGIN  
     
    UPDATE Worker  
    SET Department = p_Department  
    WHERE Worker_Id = p_Worker_Id;  
END $$

DELIMITER ;
CALL UpdateWorkerDepartment(3, 'HR');
SELECT * FROM Worker WHERE Worker_Id = 3;

DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(  
    IN p_Department CHAR(25),  
    OUT p_WorkerCount INT  
)  
BEGIN  
     
    SELECT COUNT(*) INTO p_WorkerCount  
    FROM Worker  
    WHERE Department = p_Department;  
END $$

DELIMITER ;
 
SET @workerCount = 0;  

CALL GetWorkerCountByDepartment('IT', @workerCount);  
  
SELECT @workerCount AS WorkerCount;
DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(  
    IN p_Department CHAR(25),  
    OUT p_AvgSalary DECIMAL(10,2)  
)  
BEGIN  
     
    SELECT AVG(Salary) INTO p_AvgSalary  
    FROM Worker  
    WHERE Department = p_Department;  
END $$

DELIMITER ;
  
SET @avgSalary = 0;  
 
CALL GetAverageSalaryByDepartment('IT', @avgSalary);  

SELECT @avgSalary AS AverageSalary;







