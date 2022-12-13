-- EX 1
SELECT CompanyName, ContactName, ContactTitle, Phone
FROM customers
WHERE Country = "France"

-- EX 2
SELECT ProductName, UnitPrice
FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE CompanyName =  "Exotic Liquids"

-- EX 3
SELECT CompanyName, COUNT(ProductID)
FROM products
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE Country = "France" 
GROUP BY CompanyName
ORDER BY  COUNT(ProductID) desc

-- EX 4
SELECT CompanyName, COUNT(OrderID) AS "nombres de commande"
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE country = "France"
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10

--  EX 5
SELECT CompanyName, SUM (Quantity * UnitPrice), Country
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN order_details  ON order_details.OrderID = orders.OrderID
GROUP BY CompanyName
HAVING SUM (Quantity * UnitPrice) > 30000

-- EX 6
SELECT ShipCountry
FROM orders
JOIN orderdetails ON orderdetails.OrderID = orders.OrderID
JOIN products ON  products.ProductID = orderdetails.ProductID
JOIN suppliers ON suppliers.SupplierID = products.SupplierID
WHERE CompanyName = "Exotic Liquids" 
GROUP BY ShipCountry

-- EX 7
SELECT SUM( UnitPrice * Quantity ) as "Chiffre d'affaires"
FROM orderdetails 
JOIN orders ON orders.OrderID = orderdetails.OrderID
WHERE YEAR (OrderDate) = "1997"

-- EX 8
SELECT  MONTH(OrderDate) as " mois 1997 ", SUM( UnitPrice * Quantity ) as "Chiffre d'affaires"
FROM orderdetails
JOIN orders ON orders.OrderID = orderdetails.OrderID
WHERE YEAR (OrderDate) = "1997"
GROUP BY MONTH(OrderDate)

--  EX 9
SELECT MAX(OrderDate) as " dernier achat "
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE CompanyName = "Du monde entier"

-- EX 10
SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
FROM orders
