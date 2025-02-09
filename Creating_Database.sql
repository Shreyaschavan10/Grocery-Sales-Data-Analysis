CREATE DATABASE Grocery_Store;

USE Grocery_Store;

-- Create Countries first
CREATE TABLE countries (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(45),
    CountryCode VARCHAR(2)
);

-- Now create Cities since it references Countries
CREATE TABLE cities (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(45),
    Zipcode VARCHAR(10), -- Changed from DECIMAL to VARCHAR
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES countries(CountryID)
);

-- Categories should be created before Products
CREATE TABLE categories (
    CategoryId INT PRIMARY KEY,
    CategoryName VARCHAR(45)
);


CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45)
);

-- Employees table
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(45),
    MiddleInitial VARCHAR(1),
    LastName VARCHAR(45),
    BirthDate DATE,
    Gender CHAR(1),
    CityID INT,
    HireDate DATE,
    FOREIGN KEY (CityID) REFERENCES cities(CityID)
);

-- Products table
CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(45),
    Price DECIMAL(10,2),
    CategoryID INT,
    Class VARCHAR(15),
    ModifyDate DATETIME, 
    Resistant VARCHAR(15),
    IsAllergic VARCHAR(45),
    VitalityDays INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

-- Sales table (last because it references multiple tables)
CREATE TABLE sales (
    SalesID INT PRIMARY KEY,
    SalesPersonID INT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(10,2),
    TotalPrice DECIMAL(10,2),
    SalesDate DATETIME,
    TransactionNumber VARCHAR(25),
    FOREIGN KEY (SalesPersonID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);
