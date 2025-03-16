 -- joins--------
 
 CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    City VARCHAR(50)
);


INSERT INTO Customers (CustomerID, Name, Email, City) VALUES
(1, 'Alice Smith', 'alice@email.com', 'New York'),
(2, 'Bob Jones', 'bob@email.com', 'Los Angeles'),
(3, 'Charlie Ray', 'charlie@email.com', 'Chicago'),
(4, 'David Lee', 'david@email.com', 'Miami');

select * from Customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Orders (OrderID, CustomerID, Product, Amount) VALUES
(101, 1, 'Laptop', 1200.00),
(102, 2, 'Phone', 800.00),
(103, 1, 'Tablet', 400.00),
(104, 3, 'Headphones', 200.00);


select * from Orders;


select* from customers;
select* from orders;

select * from customers -- you can also use AS here
inner join orders       -- you can also use AS here
ON customers.customerID = orders.customerID;

SELECT Customers.CustomerID, Customers.Email, Orders.Product 
FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;


-- left outer join------ 
select * from orders AS o
left join customers AS c
on c.CustomerID = o.CustomerID;


-- Right outer join------ 
select * from orders AS c
right join customers AS o
on c.CustomerID = o.CustomerID;

-- Full outer join------ 
-- select * from orders
-- full outer join customers
-- on orders.CustomerID = customers.CustomerID; -- this does not work in mysql although its right


SELECT Customers.CustomerID, Customers.Name, Customers.Email, Customers.City,
       Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT Customers.CustomerID, Customers.Name, Customers.Email, Customers.City,
       Orders.OrderID, Orders.Product, Orders.Amount
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

