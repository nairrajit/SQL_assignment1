CREATE DATABASE sales;
USE sales;
CREATE TABLE sales_people(Snum INT, Sname VARCHAR(10), City VARCHAR(10), Comm INT);
INSERT INTO sales_people(Snum, Sname, City, Comm) VALUES(1001, "Peel", "London", 12);
INSERT INTO sales_people(Snum, Sname, City, Comm) VALUES(1002, "Serres", "Sanjose", 13);
INSERT INTO sales_people(Snum, Sname, City, Comm) VALUES(1004, "Motika", "London", 11);
INSERT INTO sales_people(Snum, Sname, City, Comm) VALUES(1007, "Rifkin", "Barcelona", 15);
INSERT INTO sales_people(Snum, Sname, City, Comm) VALUES(1003, "Axelrod", "Newyork", 10);

USE sales;
CREATE TABLE customers(Cnum INT, Cname VARCHAR(10), City VARCHAR(10), Snum INT);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2001, "Hoffman", "London", 1001);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2002, "Giovanni", "Rome", 1003);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2003, "Liu", "Sanjose", 1002);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2004, "Grass", "Berlin", 1002);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2006, "Clemens", "London", 1001);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2008, "Cisneros", "Sanjose", 1007);
INSERT INTO customers(Cnum, Cname, City, Snum) VALUES(2007, "Pereira", "Rome", 1004);

USE sales;
CREATE TABLE orders(Onum INT, Amt FLOAT, Odate DATE, Cnum INT, Snum INT);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3001, 18.69, '1990-10-03', 2008, 1007);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3003, 767.19, '1990-10-03', 2001, 1001);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3002, 1900.10, '1990-10-03', 2007, 1004);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3005,  5160.45, '1990-10-03', 2003, 1002);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3006,  1098.16, '1990-10-03', 2008, 1007);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3009, 1713.23, '1990-10-04', 2002, 1003);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3007,  75.75, '1990-10-04', 2004, 1002);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3008,  4273.00, '1990-10-05', 2006, 1001);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3010,  1309.95, '1990-10-06', 2004, 1002);
INSERT INTO orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3011,  9891.88, '1990-10-06', 2006, 1001);

# to display tables

SELECT * FROM sales_people;
SELECT * FROM customers;
SELECT * FROM orders;

#Count the number of Salesperson whose name begin with ‘a’/’A’.

SELECT COUNT("Number of salesperson with A/a")
FROM sales_people
WHERE Sname LIKE 'a%' OR 'A%';

#Display all the Salesperson whose all orders worth is more than Rs. 2000.

SELECT Onum, Amt, Snum
FROM orders
WHERE Snum IN
    (SELECT Snum 
     FROM sales_people 
     WHERE Amt>2000);

# Count the number of Salesperson belonging to Newyork.

SELECT COUNT("No Of SalesPerson"), City
FROM sales_people
WHERE City LIKE 'Newyork%';

#  Display the number of Salespeople belonging to London and belonging to Paris.

SELECT Snum, Sname, City
FROM sales_people
WHERE Sname IN
    (SELECT Sname 
     FROM sales_people 
     WHERE city='London' or 'Paris');

#Display the number of orders taken by each Salesperson and their date of orders.

SELECT Snum, Odate
FROM orders
WHERE Onum!=0;
