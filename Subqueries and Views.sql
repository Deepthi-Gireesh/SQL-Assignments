Use CountryPersons;

SELECT C.Country_name, COUNT(P.Id) AS TotalPersons  
FROM Persons P  
JOIN Country C ON P.Id = C.Id  
GROUP BY C.Country_name;


SELECT C.Country_name, COUNT(P.Id) AS TotalPersons  
FROM Persons P  
JOIN Country C ON P.Id = C.Id 
GROUP BY C.Country_name  
ORDER BY TotalPersons DESC;


SELECT C.Country_name, AVG(P.Rating) AS AvgRating  
FROM Persons P  
JOIN Country C ON P.Id = C.Id  
GROUP BY C.Country_name  
HAVING AvgRating > 3.0  
ORDER BY AvgRating DESC;


SELECT C.Country_name, AVG(P.Rating) AS AvgRating  
FROM Persons P  
JOIN Country C ON P.Id = C.Id  
GROUP BY C.Country_name  
HAVING AvgRating = (
    SELECT AVG(P.Rating)  
    FROM Persons P  
    JOIN Country C ON P.Id = C.Id
    WHERE C.Country_name = 'USA'
);


SELECT Country_name, Population  
FROM Country  
WHERE Population > (  
    SELECT AVG(Population)  
    FROM Country  
);

CREATE DATABASE Product;
Use Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,  
    First_name VARCHAR(50) NOT NULL,  
    Last_name VARCHAR(50) NOT NULL,  
    Email VARCHAR(100) UNIQUE,  
    Phone_no VARCHAR(20),  
    Address VARCHAR(255),  
    City VARCHAR(50),  
    State VARCHAR(50),  
    Zip_code VARCHAR(10),
    Country VARCHAR(50)  
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)  
VALUES  
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'New York', 'NY', '10001', 'USA'),  
(2, 'Alice', 'Smith', 'alice.smith@example.com', '987-654-3210', '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),  
(3, 'Bob', 'Brown', 'bob.brown@example.com', '555-123-7890', '789 Pine St', 'Chicago', 'IL', '60601', 'USA'),  
(4, 'Emma', 'Johnson', 'emma.johnson@example.com', '444-555-6666', '321 Oak St', 'Houston', 'TX', '77002', 'USA'),  
(5, 'Michael', 'Williams', 'michael.williams@example.com', '222-333-4444', '654 Cedar St', 'Phoenix', 'AZ', '85001', 'USA'),  
(6, 'Sophia', 'Miller', 'sophia.miller@example.com', '111-222-3333', '987 Birch St', 'San Diego', 'CA', '92101', 'USA'),  
(7, 'James', 'Anderson', 'james.anderson@example.com', '666-777-8888', '741 Maple St', 'Dallas', 'TX', '75201', 'USA'),  
(8, 'Olivia', 'Taylor', 'olivia.taylor@example.com', '999-000-1111', '852 Walnut St', 'San Francisco', 'CA', '94102', 'USA'),  
(9, 'William', 'Thomas', 'william.thomas@example.com', '333-444-5555', '963 Chestnut St', 'Seattle', 'WA', '98101', 'USA'),  
(10, 'Isa', 'White', 'isa.white@example.com', '777-888-9999', '159 Redwood St', 'Boston', 'MA', '02108', 'USA');


CREATE VIEW Customer_info AS  
SELECT  
    CONCAT(First_name, ' ', Last_name) AS Full_name,  
    Email  
FROM Customer;

SELECT * FROM Customer_info;

CREATE VIEW US_Customers AS  
SELECT *  
FROM Customer  
WHERE Country = 'USA';

SHOW FULL TABLES WHERE Table_type = 'VIEW';

SELECT * FROM US_Customers;

CREATE VIEW Customer_details AS  
SELECT  
    CONCAT(First_name, ' ', Last_name) AS Full_Name,  
    Email,  
    Phone_no,  
    State  
FROM Customer;

UPDATE Customer  
SET Phone_no = '999-888-7777'    
WHERE State = 'CA';
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer  
SET Phone_no = '999-888-7777'  
WHERE State = 'CA';
SET SQL_SAFE_UPDATES = 1;

SELECT State, COUNT(*) AS Customer_Count  
FROM Customer  
GROUP BY State  
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Customer_Count  
FROM Customer_details  
GROUP BY State;

SELECT *  
FROM Customer_details  
ORDER BY State ASC;










