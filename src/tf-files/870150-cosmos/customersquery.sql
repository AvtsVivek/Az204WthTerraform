SELECT c.orders FROM Customer c

SELECT o.quantity
FROM o in Customer.orders

SELECT SUM(o.quantity) AS Quantity,c.customerName 
FROM Customer c
JOIN o in c.orders
GROUP BY c.customerName