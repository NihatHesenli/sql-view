CREATE TABLE Authors (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50)
);

CREATE TABLE Books (
    Id INT PRIMARY KEY,
    Name VARCHAR(100) CHECK (LENGTH(Name) >= 2),
    AuthorId INT,
    PageCount INT CHECK (PageCount >= 10),
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
);

CREATE VIEW BookAuthorsInfo AS
SELECT 
    b.Id AS BookId,
    b.Name AS BookName,
    b.PageCount,
    CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName
FROM 
    Books b
JOIN 
    Authors a ON b.AuthorId = a.Id;