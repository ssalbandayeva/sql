CREATE DATABASE StoreDb

USE StoreDb

CREATE TABLE Categories(
Id int primary key identity,
Name nvarchar(50) UNIQUE
)

CREATE TABLE Products(
Id int primary key identity,
Productcode nvarchar(50) UNIQUE,
CategoryId int foreign key references Categories(Id)
)

CREATE TABLE Stock(
Id int primary key identity,
ProductId int foreign key references Products(Id),
CreateDate datetime2 DEFAULT 'GETDATE()',
Count int
)

CREATE TABLE Sizes(
Id int primary key identity,
Letter char(3),
Min int,
Max int
)

ALTER TABLE Stock
ADD Size int

CREATE VIEW prod_view
AS
SELECT Products.Productcode,Categories.Name,Stock.CreateDate, Stock.Count FROM Products
JOIN Categories
ON Products.CategoryId=Categories.Id
JOIN Stock
ON Stock.ProductId=Products.Id





