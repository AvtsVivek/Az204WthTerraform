SELECT * FROM grocerysource g

SELECT g.sourceName FROM grocerysource g

SELECT gg.quantity
FROM gg in grocerysource.groceries


SELECT SUM(gg.quantity) AS Quantity, g.customerName 
FROM grocerysource g
JOIN gg in g.groceries
GROUP BY g.customerName


