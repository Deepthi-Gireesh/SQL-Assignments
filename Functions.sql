Use CountryPersons;
ALTER TABLE Persons  
ADD DOB DATE;

DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE)  
RETURNS INT  
DETERMINISTIC  
BEGIN  
    DECLARE age INT;  
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());  
    RETURN age;  
END $$

DELIMITER ;

SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age  
FROM Persons;

SELECT Country_name, LENGTH(Country_name) AS NameLength  
FROM Country;

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars  
FROM Country;

SELECT Country_name,  
       UPPER(Country_name) AS UpperCaseName,  
       LOWER(Country_name) AS LowerCaseName  
FROM Country;





