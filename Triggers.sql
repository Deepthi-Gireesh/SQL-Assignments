
CREATE TABLE Teachers (
    Id INT PRIMARY KEY,  
    Name VARCHAR(50),  
    Subject VARCHAR(50),  
    Experience INT,  
    Salary DECIMAL(10,2)
);
INSERT INTO Teachers (Id, Name, Subject, Experience, Salary)  
VALUES  
(1, 'Alice Johnson', 'Mathematics', 10, 55000.00),  
(2, 'Baby Sam', 'Physics', 8, 60000.00),  
(3, 'Charlie Cris', 'Chemistry', 12, 58000.00),  
(4, 'Diana Samuel', 'Biology', 7, 52000.00),  
(5, 'Priya Nair', 'English', 15, 65000.00),  
(6, 'Divya Rahul', 'History', 9, 57000.00),  
(7, 'George James', 'Computer Science', 11, 62000.00),  
(8, 'Hari Krishnan', 'Economics', 6, 50000.00);
SELECT * FROM Teachers;

DELIMITER $$

CREATE TRIGGER before_insert_teacher  
BEFORE INSERT ON Teachers  
FOR EACH ROW  
BEGIN  
    -- Check if the salary is negative
    IF NEW.Salary < 0 THEN  
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Salary cannot be negative';  
    END IF;  
END $$

DELIMITER ;
INSERT INTO Teachers (Id, Name, Subject, Experience, Salary)  
VALUES (9, 'Isaac Newton', 'Physics', 20, 75000.00);
INSERT INTO Teachers (Id, Name, Subject, Experience, Salary)  
VALUES (10, 'Albert Einstein', 'Physics', 25, -5000.00);

SHOW TRIGGERS LIKE 'Teachers';
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,  
    teacher_id INT,  
    action VARCHAR(50),  
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER after_insert_teacher  
AFTER INSERT ON Teachers  
FOR EACH ROW  
BEGIN  
    INSERT INTO teacher_log (teacher_id, action, timestamp)  
    VALUES (NEW.Id, 'INSERTED', NOW());  
END $$

DELIMITER ;
INSERT INTO Teachers (Id, Name, Subject, Experience, Salary)  
VALUES (11, 'Isaac Newton', 'Physics', 20, 75000.00);
SELECT * FROM teacher_log;
SHOW TRIGGERS LIKE 'Teachers';

DELIMITER $$

CREATE TRIGGER before_delete_teacher  
BEFORE DELETE ON Teachers  
FOR EACH ROW  
BEGIN  
    -- Check if the teacher's experience is greater than 10 years  
    IF OLD.Experience > 10 THEN  
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Error: Cannot delete a teacher with more than 10 years of experience';  
    END IF;  
END $$

DELIMITER ;
DELETE FROM Teachers WHERE Id = 8;
select * from Teachers;
DELETE FROM Teachers WHERE Id = 3;
SHOW TRIGGERS LIKE 'Teachers';
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,  
    teacher_id INT,  
    action VARCHAR(50),  
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER after_delete_teacher  
AFTER DELETE ON Teachers  
FOR EACH ROW  
BEGIN  
    INSERT INTO teacher_log (teacher_id, action, timestamp)  
    VALUES (OLD.Id, 'DELETED', NOW());  
END $$

DELIMITER ;
DELETE FROM Teachers WHERE Id = 5;
select * from teacher_log;

SHOW TRIGGERS LIKE 'Teachers';











