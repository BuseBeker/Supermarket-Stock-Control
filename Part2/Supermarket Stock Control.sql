USE stock_control;
-- CREATE TABLE Adress
CREATE TABLE Address(
addressID INT NOT NULL,
street VARCHAR(30),
neighborhood VARCHAR(30) NOT NULL,
building_no VARCHAR(15) NOT NULL,
city VARCHAR(30) NOT NULL,
post_code INT NOT NULL,
country VARCHAR(30) NOT NULL,
PRIMARY KEY(addressID)
);

-- CREATE TABLE Staff
CREATE TABLE staff(
staffID INT NOT NULL,
staff_name VARCHAR(30) NOT NULL,
staff_surname VARCHAR(30) NOT NULL,
staff_phone VARCHAR(10) NOT NULL,
staff_salary DECIMAL(10,2),
addressID INT NOT NULL,
PRIMARY KEY(staffID),
FOREIGN KEY (addressID) REFERENCES address(addressID)
);

-- CREATE TABLE Customer
CREATE TABLE customer(
customerID INT NOT NULL,
customer_name VARCHAR(30) NOT NULL,
customer_surname VARCHAR(30) NOT NULL,
customer_phone VARCHAR(10) NOT NULL,
addressID INT NOT NULL,
PRIMARY KEY(customerID),
FOREIGN KEY (addressID) REFERENCES address(addressID)
);

-- CREATE TABLE User
CREATE TABLE user(
userID INT NOT NULL,
user_password VARCHAR(30) NOT NULL,
staff_name VARCHAR(30) NOT NULL,
PRIMARY KEY(userID)
);

-- CREATE TABLE Order
CREATE TABLE customerOrder(
orderID INT NOT NULL,
order_date DATE NOT NULL,
customerID INT NOT NULL,
PRIMARY KEY(orderID),
FOREIGN KEY (customerID) REFERENCES customer(customerID)
);

-- CREATE TABLE Order Detail
CREATE TABLE orderDetail(
orderdetailID INT NOT NULL,
amount INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
orderID INT NOT NULL,
productID INT NOT NULL,
PRIMARY KEY(orderdetailID),
FOREIGN KEY (orderID) REFERENCES customerorder(orderID),
FOREIGN KEY (productID) REFERENCES product(productID)
);

-- CREATE TABLE Brand
CREATE TABLE brand(
brandID INT NOT NULL,
brand_name VARCHAR(30) NOT NULL,
PRIMARY KEY(brandID)
);

-- CREATE TABLE Stock
CREATE TABLE stock(
stockID INT NOT NULL,
stock_status VARCHAR(30) NOT NULL,
numberOf_stock INT NOT NULL,
PRIMARY KEY(stockID)
);

-- CREATE TABLE Category
CREATE TABLE category(
categoryID INT NOT NULL,
category_name VARCHAR(30) NOT NULL,
PRIMARY KEY(categoryID )
);

-- CREATE TABLE Product
CREATE TABLE product(
productID INT NOT NULL,
product_name VARCHAR(30) NOT NULL,
production_date DATE NOT NULL,
consumption_date DATE NOT NULL,
purchase_price DECIMAL(10,2) NOT NULL,
sale_price DECIMAL(10,2) NOT NULL,
brandID INT NOT NULL,
stockID INT NOT NULL,
PRIMARY KEY(productID),
FOREIGN KEY (brandID) REFERENCES brand(brandID),
FOREIGN KEY (stockID) REFERENCES stock(stockID)
);

-- CREATE TABLE Product Category
CREATE TABLE product_category(
productID INT NOT NULL,
categoryID INT NOT NULL,
PRIMARY KEY(productID,categoryID),
FOREIGN KEY (productID) REFERENCES product(productID),
FOREIGN KEY (categoryID) REFERENCES category(categoryID)
);

-- way1: INSERT INTO table_name(column1,column2,column3,...) VALUES(value1,value2,value3,...);
-- way2: INSERT INTO table_name VALUES(value1,value2,value3);

-- address
INSERT INTO address 
VALUES(1,'Orhangazi','Esentepe','5','Tokat',60100,'Türkiye');

INSERT INTO address 
VALUES(2,'Sivas','Kemer','34','Tokat',60100,'Türkiye');

INSERT INTO address 
VALUES(3,null,'Evrenköy','21','Tokat',60400,'Türkiye');

INSERT INTO address 
VALUES(4,null,'Cumhuriyet','56','Tokat',60300,'Türkiye');

INSERT INTO address 
VALUES(5,'Atatürk','Barbaros','142','İstanbul',34200,'Türkiye');

INSERT INTO address 
VALUES(6,'C.Gürsel','Tuna','65','İzmir',35600,'Türkiye');

INSERT INTO address 
VALUES(7,'Sipahi','Şamlar','85','Amasya',05200,'Türkiye');

INSERT INTO address 
VALUES(8,null,'Kızılay','114','Ankara',06400,'Türkiye');

INSERT INTO address 
VALUES(9,'Ata','Hatay','10','İzmir',35150,'Türkiye');

INSERT INTO address 
VALUES(10,'Bilgen','Poligon','4','İzmir',35140,'Türkiye');

INSERT INTO address 
VALUES(11,'Bilgen','Poligon','9','İzmir',35140,'Türkiye');

INSERT INTO address 
VALUES(12,'Zafer','Efeler','19','Aydın',09630,'Türkiye');

INSERT INTO address 
VALUES(13,'Cumhuriyet','Levent','2','İstanbul',34520,'Türkiye');

INSERT INTO address 
VALUES(14,'Turan','Bayraklı','10','İzmir',35535,'Türkiye');

INSERT INTO address 
VALUES(15,null,'Efeler','7','Aydın',09630,'Türkiye');

-- staff
INSERT INTO staff 
VALUES(1,'Ayşe','Kara','03561234556',3800,1);

INSERT INTO staff 
VALUES(2,'Ali','Uçar','03562345667',4000,3);

INSERT INTO staff 
VALUES(3,'Ahmet','Davut','03563456778',4500,2);

INSERT INTO staff 
VALUES(4,'Murat','Sönmez','03564566789',3500,1);

INSERT INTO staff 
VALUES(5,'Burak','Torun','03565678997',3800,7);

INSERT INTO staff 
VALUES(6,'Ayla','Yılmaz','05111254584',4200,5);

INSERT INTO staff 
VALUES(7,'Mustafa','Demir','04441257898',5000,6);

INSERT INTO staff 
VALUES(8,'Turgut','Özseven','03584587125',3500,4);

INSERT INTO staff 
VALUES(9,'Elif','Uymaz','03124789520',4000,8);

INSERT INTO staff 
VALUES(10,'Murat','Aydın','05144799721',3300,3);

INSERT INTO staff
VALUES(11,'Ali','Ak','05511111111',3950,1);

INSERT INTO staff
VALUES(12,'Aylin','Pınar','05511111112',3700,4);

INSERT INTO staff
VALUES(13,'Burak','Han','05511111114',4125,2);

INSERT INTO staff
VALUES(14,'Ceyda','Ak','05511111115',6770,1);

INSERT INTO staff
VALUES(15,'Ferda','Timur','05511111116',5453,8);

INSERT INTO staff
VALUES(16,'Aykut','Ok','05511111118',4530,1);

INSERT INTO staff
VALUES(17,'Oktay','Aslan','05511111119',8967,10);

-- customer
INSERT INTO customer 
VALUES(1,'Deniz','Güner','3563459873',2);

INSERT INTO customer 
VALUES(2,'Kaan','Aydın','3556667890',3);

INSERT INTO customer 
VALUES(3,'Beyza','Ölmez','3126782345',7);

INSERT INTO customer 
VALUES(4,'Halil','Kartal','3589435676',1);

INSERT INTO customer 
VALUES(5,'Selçuk','Akbulut','3557892132',5);

INSERT INTO customer 
VALUES(6,'Eslem','Cerit','3125673454',8);

INSERT INTO customer 
VALUES(7,'Zeynep','Ak','3114569823',1);

INSERT INTO customer 
VALUES(8,'Ravza','Açıkgöz','3556734567',3);

INSERT INTO customer 
VALUES(9,'Emrah','Günaydın','3542357887',4);

INSERT INTO customer 
VALUES(10,'Salih','Şen','3567893327',6);

INSERT INTO customer
VALUES(11,'Sena','Kaya','5311111121',9);

INSERT INTO customer
VALUES(12,'Erdem','Ay','5311114111',11);

INSERT INTO customer
VALUES(13,'Ebru','Dere','5311151111',13);

INSERT INTO customer
VALUES(14,'Mehmet','Ertan','5317111111',14);

INSERT INTO customer
VALUES(15,'Elif','Ceylan','5381111111',15);

INSERT INTO customer
VALUES(16,'Emre','Pınar','5381111111',4);

-- user
INSERT INTO user 
VALUES(1,'Kara4556','Ayşe');

INSERT INTO user 
VALUES(2,'Uçar5667','Ali');

INSERT INTO user 
VALUES(3,'Davut6778','Ahmet');

INSERT INTO user 
VALUES(4,'Sönmez6789','Murat');

INSERT INTO user 
VALUES(5,'Torun8997','Burak');

INSERT INTO user 
VALUES(6,'Yılmaz4584','Ayla');

INSERT INTO user 
VALUES(7,'Demir7898','Mustafa');

INSERT INTO user 
VALUES(8,'Özseven7125','Turgut');

INSERT INTO user 
VALUES(9,'Uymaz9520','Elif');

INSERT INTO user
VALUES(10,'sifre123','Ali');

INSERT INTO user
VALUES(11,'12345','Aylin');

INSERT INTO user
VALUES(12,'98745','Burak');

INSERT INTO user
VALUES(13,'45645','Ceyda');

INSERT INTO user
VALUES(14,'asdfeQ','Ferda');

INSERT INTO user
VALUES(15,'357491','Aykut');

INSERT INTO user
VALUES(16,'95175','Oktay');

INSERT INTO user
VALUES(17,'MA1345d.','Murat');

-- customerorder
INSERT INTO customerorder 
VALUES(1,'2021-05-12',1);

INSERT INTO customerorder 
VALUES(2,'2021-05-21',8);

INSERT INTO customerorder 
VALUES(3,'2021-05-18',3);

INSERT INTO customerorder 
VALUES(4,'2021-05-18',5);

INSERT INTO customerorder 
VALUES(5,'2021-05-20',3);

INSERT INTO customerorder 
VALUES(6,'2021-05-31',7);

INSERT INTO customerorder 
VALUES(7,'2021-05-29',10);

INSERT INTO customerOrder
VALUES(8,'2020-01-10',15);

INSERT INTO customerOrder
VALUES(9,'2021-06-01',13);

INSERT INTO customerOrder
VALUES(10,'2021-03-24',4);

INSERT INTO customerOrder
VALUES(11,'2021-02-01',15);

INSERT INTO customerOrder
VALUES(12,'2021-06-04',2);

INSERT INTO customerOrder
VALUES(13,'2021-04-06',11);

INSERT INTO customerOrder
VALUES(14,'2021-06-01',5); 

INSERT INTO customerOrder
VALUES(15,'2021-06-01',4);

INSERT INTO customerOrder
VALUES(16,'2021-06-11',6);

INSERT INTO customerOrder
VALUES(17,'2021-01-20',9);

INSERT INTO customerOrder
VALUES(18,'2021-05-01',9); 

INSERT INTO customerOrder
VALUES(19,'2021-04-22',10);

INSERT INTO customerOrder
VALUES(20,'2021-06-15',9); 

-- brand
INSERT INTO brand 
VALUES(1,'İçim');

INSERT INTO brand 
VALUES(2,'Sütaş');

INSERT INTO brand 
VALUES(3,'CocaCola');

INSERT INTO brand 
VALUES(4,'Çaykur');

INSERT INTO brand 
VALUES(5,'Bal Küpü');

INSERT INTO brand 
VALUES(6,'Filiz');

INSERT INTO brand 
VALUES(7,'Arbella');

INSERT INTO brand 
VALUES(8,'Dr.Oetker');

INSERT INTO brand 
VALUES(9,'Indomie');

INSERT INTO brand 
VALUES(10,'Söke');

INSERT INTO brand 
VALUES(11,'Sinangil');

INSERT INTO brand 
VALUES(12,'ETİ');

INSERT INTO brand 
VALUES(13,'Billur');

INSERT INTO brand 
VALUES(14,'Keskinoğlu');

INSERT INTO brand 
VALUES(15,'Çamlıca');

INSERT INTO brand 
VALUES(16,'Loréal Paris Elseve');

INSERT INTO brand 
VALUES(17,'Tadım');

INSERT INTO brand 
VALUES(18,'Şenpiliç');

INSERT INTO brand 
VALUES(19,'Ülker');

INSERT INTO brand 
VALUES(20,'Bizim');

INSERT INTO brand 
VALUES(21,'Pınar');

INSERT INTO brand 
VALUES(22,'Doğuş');

INSERT INTO brand
VALUES(23,'Ace');

INSERT INTO brand
VALUES(24,'Banvit');

INSERT INTO brand
VALUES(25,'Barilla');

INSERT INTO brand
VALUES(26,'Domestos');

INSERT INTO brand
VALUES(27,'Fairy');

 INSERT INTO brand
VALUES(28,'Johnsons');

INSERT INTO brand
VALUES(29,'Minies');

INSERT INTO brand
VALUES(30,'Namet');

INSERT INTO brand
VALUES(31,'Pedigree');

INSERT INTO brand
VALUES(32,'Sırma');

INSERT INTO brand
VALUES(33,'Whiskas');

-- stock
INSERT INTO stock 
VALUES(1,'Available',1);

INSERT INTO stock 
VALUES(2,'Available',15);

INSERT INTO stock 
VALUES(3,'Available',10);

INSERT INTO stock 
VALUES(4,'Available',5);

INSERT INTO stock 
VALUES(5,'Available',18);

INSERT INTO stock 
VALUES(6,'Available',20);

INSERT INTO stock 
VALUES(7,'Available',25);

INSERT INTO stock 
VALUES(8,'Available',30);

INSERT INTO stock 
VALUES(9,'Available',37);

INSERT INTO stock 
VALUES(10,'Available',50);

INSERT INTO stock 
VALUES(11,'Available',40);

INSERT INTO stock 
VALUES(12,'Available',45);

INSERT INTO stock 
VALUES(13,'Available',55);

INSERT INTO stock 
VALUES(14,'Available',60);

INSERT INTO stock 
VALUES(15,'Available',10);

INSERT INTO stock 
VALUES(16,'Available',35);

INSERT INTO stock 
VALUES(17,'Available',53);

INSERT INTO stock 
VALUES(18,'Available',27);

INSERT INTO stock 
VALUES(19,'Available',7);

INSERT INTO stock 
VALUES(20,'NOT Available',0);

INSERT INTO stock
VALUES(21,'Available',72);

INSERT INTO stock
VALUES(22,'Available',103);

INSERT INTO stock
VALUES(23,'Available',54);

INSERT INTO stock
VALUES(24,'To be ordered',12);

INSERT INTO stock
VALUES(25,'Available',200);

INSERT INTO stock
VALUES(26,'Available',70);

INSERT INTO stock
VALUES(27,'Available',63);

INSERT INTO stock
VALUES(28,'To be ordered',7);

INSERT INTO stock
VALUES(29,'Available',54);

INSERT INTO stock
VALUES(30,'Available',62);

INSERT INTO stock
VALUES(31,'To be ordered',16);

INSERT INTO stock
VALUES(32,'Available',34);

INSERT INTO stock
VALUES(33,'To be ordered',14);

INSERT INTO stock
VALUES(34,'Available',67);

INSERT INTO stock
VALUES(35,'Available',42);

INSERT INTO stock
VALUES(36,'Available',38);

-- category
INSERT INTO category 
VALUES(1,'İçecek');

INSERT INTO category 
VALUES(2,'Et ve Et Ürünleri');

INSERT INTO category 
VALUES(3,'Temizlik Ürünleri');

INSERT INTO category 
VALUES(4,'Meyve ve Sebze');

INSERT INTO category 
VALUES(5,'Süt ve Kahvaltılık');

INSERT INTO category 
VALUES(6,'Temel Gıda');

INSERT INTO category 
VALUES(7,'Atıştırmalıklar');

INSERT INTO category 
VALUES(8,'Kozmetik ve Kişisel Bakım');

INSERT INTO category 
VALUES(9,'Ev Eşyaları');

INSERT INTO category 
VALUES(10,'Pet Shop');

INSERT INTO category 
VALUES(11,'Elektronik');

INSERT INTO category 
VALUES(12,'Bebek Bakımı');

INSERT INTO category
VALUES(13,'Petshop');

-- product
INSERT INTO product 
VALUES(1,'Süt','2021-05-18','2021-06-18',1.50,1.75,1,6);

INSERT INTO product 
VALUES(2,'Yoğurt','2021-05-28','2021-06-10',5.75,6.25,2,3);

INSERT INTO product 
VALUES(3,'Kola','2021-05-14','2021-06-25',5.75,6.25,3,15);

INSERT INTO product 
VALUES(4,'didi Soğuk Çay','2021-05-13','2021-06-25',4.75,5.25,4,14);

INSERT INTO product 
VALUES(5,'Toz Şeker','2021-05-15','2022-07-25',5.75,6,5,4);

INSERT INTO product 
VALUES(6,'Şehriye','2021-04-17','2022-06-30',2.25,3.25,6,17);

INSERT INTO product 
VALUES(7,'Makarna','2021-04-15','2022-06-25',1,1.25,7,20);

INSERT INTO product 
VALUES(8,'Puding','2021-05-15','2021-08-25',2.50,3.75,8,16);

INSERT INTO product 
VALUES(9,'Noodle','2021-05-14','2021-06-14',1.50,1.75,9,13);

INSERT INTO product 
VALUES(10,'Un','2021-03-17','2022-05-27',6.25,7,10,11);

INSERT INTO product 
VALUES(11,'Yumurta','2021-01-09','2021-04-09',21.25,22,14,18);

INSERT INTO product 
VALUES(12,'CRAX','2021-05-08','2021-06-05',1,1.25,12,10);

INSERT INTO product 
VALUES(13,'Tuz','2021-05-13','2022-07-11',2,2.25,13,8);

INSERT INTO product 
VALUES(14,'Gazoz','2021-04-03','2022-05-13',5.75,6.25,15,5);

INSERT INTO product 
VALUES(15,'Şampuan','2021-05-15','2021-09-25',13,13.99,16,2);

INSERT INTO product 
VALUES(16,'Ay Çekirdeği','2021-05-21','2021-08-22',6.25,7,17,7);

INSERT INTO product 
VALUES(17,'Bütün Piliç','2021-05-11','2021-05-23',18.25,19.55,18,17);

INSERT INTO product 
VALUES(18,'Çikolatalı Gofret','2021-04-26','2021-05-25',1.75,2.25,19,13);

INSERT INTO product 
VALUES(19,'Margarin','2021-05-15','2022-05-25',2.75,3.25,20,6);

INSERT INTO product 
VALUES(20,'Krema','2021-05-18','2021-06-18',3,4.99,21,8);

INSERT INTO product 
VALUES(21,'Çay','2021-09-06','2022-10-25',25.75,27.99,22,10);

INSERT INTO product
VALUES(22,'Hindi Füme','2021-03-25','2022-09-14',1.25,3.25,30,2);

INSERT INTO product
VALUES(23,'Piliç pirzola','2021-03-21','2021-06-14',21.71,28.95,24,3);

INSERT INTO product
VALUES(24,'Çamaşır Suyu','2020-11-27','2025-07-07',7.35,9.95,26,4);

INSERT INTO product
VALUES(25,'Bulaşık deterjanı','2020-12-13','2025-02-03',8.37,9.25,27,5);

INSERT INTO product
VALUES(26,'Makarna','2021-06-11','2025-02-18',3.45,5.75,25,9);

INSERT INTO product
VALUES(27,'Balık Kraker','2021-01-14','2023-01-01',1.05,2.00,12,12);

INSERT INTO product
VALUES(28,'Çubuk Kraker','2021-01-14','2023-01-01',0.35,0.80,12,13);

INSERT INTO product
VALUES(29,'Whiskas	Biftekli Kuru mama','2021-06-21','2024-05-14',9.75,12.50,33,14);

INSERT INTO product
VALUES(30,'Pedigree Biftekli Kuru mama','2021-05-24','2023-12-01',10.35,15.50,31,16);

INSERT INTO product
VALUES(31,'Whiskas Ton balıklı kuru mama','2021-06-17','2024-05-04',9.65,12.50,33,15);

INSERT INTO product
VALUES(32,'Bebek Şampuanı','2021-04-24','2025-05-04',14.85,25.95,28,18);

INSERT INTO product
VALUES(33,'Bebek Şampuanı','2021-04-07','2025-05-14',8.25,11.90,29,17);

INSERT INTO product
VALUES(34,'Çubuk Kraker','2021-04-12','2024-01-08',0.45,1.25,19,19);

INSERT INTO product
VALUES(35,'Çamaşır Suyu','2020-04-12','2025-01-14',31.75,38.95,23,20);

-- orderdetail
INSERT INTO orderdetail 
VALUES(1,2,4.50,2,18);

INSERT INTO orderdetail 
VALUES(2,1,27.99,7,21);

INSERT INTO orderdetail 
VALUES(3,5,6.25,4,12);

INSERT INTO orderdetail 
VALUES(4,3,18.75,6,3);

INSERT INTO orderdetail 
VALUES(5,1,13.99,1,15);

INSERT INTO orderdetail 
VALUES(6,4,88,5,11);

INSERT INTO orderdetail 
VALUES(7,2,12,3,5);

INSERT INTO orderDetail
VALUES(8,5,8.75,1,1);

INSERT INTO orderDetail
VALUES(9,1,25.95,2,32);

INSERT INTO orderDetail
VALUES(10,1,9.25,3,25);

INSERT INTO orderDetail
VALUES(11,1,12.50,11,29);

INSERT INTO orderDetail
VALUES(12,1,12.50,11,31);

INSERT INTO orderDetail
VALUES(13,2,11.50,12,26);

INSERT INTO orderDetail
VALUES(14,1,9.25,13,25);

INSERT INTO orderDetail
VALUES(15,2,57.9,7,23);

INSERT INTO orderDetail
VALUES(16,1,3.25,8,22);

INSERT INTO orderDetail
VALUES(17,1,1.75,6,1);

INSERT INTO orderDetail
VALUES(18,1,38.95,5,24);

-- product_category
INSERT INTO product_category 
VALUES(7,6);

INSERT INTO product_category 
VALUES(11,5);

INSERT INTO product_category 
VALUES(2,5);

INSERT INTO product_category 
VALUES(14,1);

INSERT INTO product_category 
VALUES(5,6);

INSERT INTO product_category 
VALUES(17,2);

INSERT INTO product_category 
VALUES(10,6);

INSERT INTO product_category 
VALUES(12,7);

INSERT INTO product_category 
VALUES(3,1);

INSERT INTO product_category 
VALUES(15,8);

INSERT INTO product_category
VALUES(22,2);

INSERT INTO product_category
VALUES(23,2);

INSERT INTO product_category
VALUES(24,3);

INSERT INTO product_category
VALUES(25,3);

INSERT INTO product_category
VALUES(26,6);

INSERT INTO product_category
VALUES(27,7);

INSERT INTO product_category
VALUES(28,7);

INSERT INTO product_category
VALUES(29,13);

INSERT INTO product_category
VALUES(30,13);

INSERT INTO product_category
VALUES(31,13);

INSERT INTO product_category
VALUES(32,12);

INSERT INTO product_category
VALUES(33,12);

INSERT INTO product_category
VALUES(34,7);

INSERT INTO product_category
VALUES(35,3);

