Create database CountryPersons;
Use CountryPersons;

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population BIGINT,
    Area FLOAT
);
desc Country;

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520),
(2, 'Canada', 38000000, 9984670),
(3, 'UK', 67000000, 243610),
(4, 'India', 1380000000, 3287263),
(5, 'Australia', 25600000, 7692024),
(6, 'Germany', 83000000, 357022),
(7, 'France', 67000000, 551695),
(8, 'Brazil', 213000000, 8515767),
(9, 'Russia', 144000000, 17098246),
(10, 'Japan', 126000000, 377975);

Select * from Country; 

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population BIGINT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100)
);
desc Persons;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331000000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 38000000, 3.8, 2, 'Canada'),
(3, 'Alice', 'Brown', 67000000, 4.2, 3, 'UK'),
(4, 'Ravi', 'Kumar', 1380000000, 4.6, 4, 'India'),
(5, 'Anu', 'Johnson', 25600000, 4.1, 5, 'Australia'),
(6, 'Hansu', 'Müller', 83000000, 3.9, 6, 'Germany'),
(7, 'Sanu', 'Dubois', 67000000, 4.0, 7, 'France'),
(8, 'Christy', 'Silva', 213000000, 4.7, 8, 'Brazil'),
(9, 'Ivan', 'Petrov', 144000000, 4.3, 9, 'Russia'),
(10, 'Bobby', 'Tanaka', 126000000, 4.8, 10, 'Japan');

select * from Persons;

SELECT DISTINCT Country_name FROM Persons;

SELECT Fname AS FirstName, Lname AS LastName FROM Persons;

SELECT * FROM Persons WHERE Rating > 4.0;

SELECT * FROM Country WHERE Population > 1000000;

SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

SELECT * FROM Persons WHERE Country_name IS NULL;

SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';
