USE stock_control;

-- 1 --
SELECT staff_name AS "Name", staff_surname AS "Surname", staff_phone AS "Phone Number"
FROM staff
WHERE staff_name= 'Murat' AND staff_salary>=3500;

-- 2 --
SELECT *
FROM address
ORDER BY addressID DESC;

-- 3 --
SELECT product_name AS "Product", consumption_date AS "Consumption Date", sale_price AS "Sale Price"
FROM product
WHERE consumption_date BETWEEN '2021-06-01' AND '2021-06-30' 
ORDER BY consumption_date;

-- 4 --
SELECT street, neighborhood,  city
FROM address
WHERE street IS NOT NULL;

-- 5 --
SELECT MAX(sale_price) AS "Max Sale Price", MIN(sale_price) AS "Min Sale Price", AVG(sale_price) AS "Avarage Sale Price"
FROM  product;


-- 6 --
SELECT A.city, COUNT(*) AS "Number Of Staff Working", SUM(S.staff_salary) AS "Sum Of Salaries"
FROM address A , staff S
WHERE A.addressID=S.addressID
GROUP BY A.city;
 
 -- 7 -- 
SELECT A.addressID, A.street, A.city, COUNT(*) AS "Number Of Customers"
FROM address A, customer C
WHERE A.addressID=C.addressID
GROUP BY A.addressID;

-- 8 --
SELECT A.addressID, A.street, A.city, COUNT(*) AS "Number Of Customers"
FROM address A, customer C
WHERE A.addressID=C.addressID
GROUP BY A.addressID
HAVING COUNT(*) >= 2;

-- 9 --
SELECT product_name AS "Product", production_date AS "Production Date", sale_price AS "Sale Price"
FROM product
WHERE production_date LIKE "%15%";

-- 10 --
UPDATE customer
SET customer_name = "Halis"
WHERE customerID=4;

-- 11 --
SELECT C.customer_name AS "Customer Name", C.customer_surname AS "Customer Surname", O.order_date AS "Order Date"
FROM customer C
INNER JOIN customerorder O
	     ON C.customerID=O.customerID;

-- 12 --
SELECT P.product_name AS "Product Name", B.brand_name AS "Brand", P.sale_price AS "Sale Price"
FROM product P, brand B
WHERE P.brandID=B.brandID AND sale_price<6;

-- 13 --
SELECT P.product_name AS "Product Name", C.category_name AS "Category", P.sale_price AS "Sale Price"
FROM product P, product_category PC, category C
WHERE P.productID=PC.productID AND PC.categoryID=C.categoryID;

-- 14 -- 
SELECT C.customer_name AS "Customer Name", C.customer_surname AS "Customer Surname", O.order_date AS "Order Date"
FROM customer C
LEFT OUTER JOIN customerorder O
	     ON C.customerID=O.customerID;
         
-- 15 --
SELECT C.customer_name AS "Customer Name", C.customer_surname AS "Customer Surname", O.order_date AS "Order Date"
FROM customer C
RIGHT OUTER JOIN customerorder O
	     ON C.customerID=O.customerID; 
         
-- 16 --
SELECT C.customer_name AS "Customer Name", C.customer_surname AS "Customer Surname", O.order_date AS "Order Date"
FROM customer C
LEFT OUTER JOIN customerorder O
	     ON C.customerID=O.customerID
UNION
SELECT C.customer_name AS "Customer Name", C.customer_surname AS "Customer Surname", O.order_date AS "Order Date"
FROM customer C
RIGHT OUTER JOIN customerorder O
	     ON C.customerID=O.customerID; 

-- 17 --
DELIMITER $$
CREATE PROCEDURE GetStockStatus()
BEGIN
	SELECT P.product_name AS "Product Name", S.stock_status AS "Status", S.numberOf_stock AS "Number of Stock"
	FROM product P, stock S
	WHERE P.stockID=S.stockID;   
END$$
DELIMITER ;

CALL GetStockStatus();

-- 18 --
DELIMITER $$
CREATE PROCEDURE GetCustomer(IN cityName VARCHAR(30))
BEGIN
	SELECT C.customer_name AS "Customer Name", C.customer_surname AS "Customer Surname",
    C.customer_phone AS "Phone Number", A.street, A.neighborhood, A.building_no, A.city, A.post_code
 	FROM address A, customer C
	WHERE A.addressID=C.addressID AND city = cityName;
END $$
DELIMITER ;

CALL GetCustomer("İstanbul");

-- 19 --
CREATE VIEW viewOrder AS 
SELECT C.customer_name AS "Name", C.customer_surname AS "Surname", C.customer_phone AS "Phone Number",
P.product_name AS "Product Name", OD.amount AS "Amount", OD.price AS "Price", CO.order_date AS "Order Date"
FROM customer C, product P, orderdetail OD, customerorder CO
WHERE C.customerID=CO.customerID AND CO.orderID=OD.orderID AND OD.productID=P.productID;

SELECT *
FROM viewOrder;

-- 20 --
CREATE VIEW view_Product_Info(Category_name, Number_of_product, Total_sale_price) AS 
SELECT C.category_name, COUNT(*), SUM(P.sale_price)
FROM product P, product_category PC, category C
WHERE P.productID=PC.productID AND PC.categoryID=C.categoryID
GROUP BY C.category_name;

SELECT *
FROM view_Product_Info;

