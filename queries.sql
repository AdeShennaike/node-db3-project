-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT productname, categoryname
FROM Product as p
join category as c 
	on p.categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, companyname
FROM 'order' as o
join shipper as s
	on o.shipvia = s.id
    where orderdate < '2012-08-09';
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT productname
FROM orderdetail as od
join product as p
	on od.productid = p.id
join supplier as s
	on p.supplierid = s.id
join 'order' as o
	on od.orderid = o.id
    where o.id = 10251
    group by productname;
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT od.OrderID, CompanyName, LastName
from orderdetail as od
join 'order' as o
 	on o.id = od.orderid
join customer as c
	on o.customerid = c.id
join employee as e
	on e.id = o.employeeid
 group by orderid;
