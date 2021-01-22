CREATE DATABASE ArtGalleryProject
USE ArtGalleryProject


CREATE TABLE Customer (
CustomerID VARCHAR(225) NOT NULL PRIMARY KEY ,
CustomerName VARCHAR(225) NOT NULL ,
CustomerLastName VARCHAR(225) NOT NULL ,
CustomerAge int NOT NULL ,
CustomerNation VARCHAR(225) NOT NULL ,
)
CREATE TABLE Artist (
ArtistID VARCHAR(225) NOT NULL PRIMARY KEY ,
ArtistName VARCHAR(225) NOT NULL ,
ArtistStyle VARCHAR(225) NOT NULL ,
ArtistNation VARCHAR(225) NOT NULL ,
)
CREATE TABLE Products (
ProductID VARCHAR(225) NOT NULL PRIMARY KEY ,
ProductName VARCHAR(225) NOT NULL ,
ProductPrice int NOT NULL ,
ProductAge int NOT NULL ,
ProductType VARCHAR(225) NOT NULL ,
ArtistID VARCHAR(225) NOT NULL FOREIGN KEY REFERENCES Artist(ArtistID),
)

CREATE TABLE Orders (
OrderID VARCHAR(225) NOT NULL PRIMARY KEY ,
OrderType VARCHAR(225) NOT NULL ,
OrderCost int NOT NULL ,
CustomerID VARCHAR(225) NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
ProductID VARCHAR(225) NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
)
CREATE TABLE Zones (
RoomNumber int NOT NULL PRIMARY KEY ,
RoomType VARCHAR(225) NOT NULL ,
RoomSize VARCHAR(225) NOT NULL ,
RoomSecurityLevel int NOT NULL ,
ProductID VARCHAR(225) NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
)
CREATE TABLE SecuritySrv (
SecurityGuardID VARCHAR(225) NOT NULL PRIMARY KEY ,
SecurityGuardName VARCHAR(225) NOT NULL ,
SecurityGuardRank VARCHAR(225) NOT NULL ,
RoomNumber int NOT NULL FOREIGN KEY REFERENCES Zones(RoomNumber) ,
)

CREATE TABLE Exhibition (
ExhibitionID VARCHAR(225) NOT NULL ,
ExhibitionStartDate VARCHAR(225) NOT NULL ,
ExhibitionEndDate VARCHAR(225) NOT NULL ,
ExhibitionContent VARCHAR(225) NOT NULL ,
)

CREATE TABLE Auction (
AuctionID VARCHAR(225) NOT NULL PRIMARY KEY ,
AuctionDate VARCHAR(225) NOT NULL ,
ProductID VARCHAR(225) NOT NULL FOREIGN KEY REFERENCES Products(ProductID),
)

CREATE TABLE Guide (
GuideID VARCHAR(225) NOT NULL PRIMARY KEY ,
GuideName VARCHAR(225) NOT NULL ,
GuideProfession VARCHAR(225) NOT NULL ,
GuideGender VARCHAR(225) NOT NULL ,
RoomNumber int NOT NULL FOREIGN KEY REFERENCES Zones(RoomNumber),
)
CREATE TABLE Management (
ManagerID VARCHAR(225) NOT NULL PRIMARY KEY ,
ManagerName VARCHAR(225) NOT NULL ,
ManagerRank VARCHAR(225) NOT NULL ,
ManagerDuty VARCHAR(225) NOT NULL ,
)

INSERT INTO Customer VALUES

('FRE47','Bugra','Ates',20,'Turkey'),
('ZTB54','Batuhan','Ercetin',21,'Turkey'),
('TRB78','Ege','Danaci',20,'Turkey'),
('GRN89','Anna','Schidele',28,'Germany'),
('YTR45','John','Brown',29,'USA'),
('JRS64','Marienne','Dues',36,'France'),
('MBV98','Dimitri','Ivanov',40,'Russia'),
('TCV12','Aida','Nazar',29,'Iran'),
('HBV75','Caner','Kara',22,'Turkey'); 

INSERT INTO Artist VALUES

('P1','Leonardo Da Vinci','Painter','Italy'),
('P2','Vincent Van Gogh','Painter','Netherlands'),
('P3','Michelangelo Buonarroti','Painter','Italy'),
('S1','Michelangelo Buonarroti','Sculptor','Italy'),
('S2','Auguste Rodin','Sculptor','France');

INSERT INTO Products VALUES 

('PR1','Mona Lisa',100000000,500,'Painting','P1'),
('PR2','The Last Supper',500000000,600,'Painting','P1'),
('PR3','Adoration of The Magi',8000000,510,'Painting','P1'),
('PR4','The Starry Night',100000000,250,'Painting','P2'),
('PR5','The Potato Eaters',53000000,270,'Painting','P2'),
('PR6','The Creation of Adem',30000000,500,'Painting','P3'),
('PR7','David',50000000,500,'Statue','S1'),
('PR8','Pieta',30000000,510,'Statue','S1'),
('PR9','Thinking Man',20000000,520,'Statue','S2');


/*('PR10','Kiss',15000000,540,'Statue','S2'),*/
/*('PR11','Hell Gate',15000000,500,'Statue','S2');*/

INSERT INTO Orders VALUES

('OR1','Painting',100000000,'ZTB54','PR1'),
('OR2','Statue',15000000,'FRE47','PR2'),
('OR3','Statue',100000000,'HBV75','PR3'),
('OR4','Painting',53000000,'TCV12','PR4'),
('OR6','Painting',42000000,'YTR45','PR5'),
('OR7','Painting',9000000,'TRB78','PR6'),
('OR8','Painting',8000000,'JRS64','PR7'),
('OR9','Statue',65000000,'HBV75','PR8'),
('OR10','Painting',12000000,'ZTB54','PR9');
/* ('OR11','Painting',5000000,'ZTB54','PR9'); */


INSERT INTO Zones VALUES

(1,'Painting','Small',3,'PR1'),
(2,'Statues','Medium',4,'PR2'),
(3,'Painting','Large',2,'PR3'),
(4,'Statues','Small',5,'PR4'),
(5,'Painting','Medium',1,'PR5'),
(6,'Painting','Large',5,'PR6');

INSERT INTO SecuritySrv VALUES

('YT12','Ahmet','Officer',1),
('ER21','Mert','Officer',2),
('JH76','Osman','Officer',3),
('UT56','Huseyin','Officer',4),
('KJ45','Recep','Officer',5),
('MN89','Hakan','Officer',6);
/*('AS21','Ugur','Chief',1),*/
/*('OP99','Metehan','Chief',4);*/


INSERT INTO Exhibition VALUES

('EX1','10.12.2019','11.12.2019','Painting'),
('EX2','11.12.2019','12.12.2019','Statues');

INSERT INTO Auction VALUES

('AU1','04.02.2020','PR1'),
('AU2','04.02.2020','PR3'),
('AU3','04.02.2020','PR6'),
('AU4','08.10.2020','PR4');


INSERT INTO Guide VALUES

('GU1','Ahmet','Painting','Male',1),
('GU2','Mehmet','Statues','Male',2),
('GU3','Ayse','Painting','Female',3),
('GU4','Nazli','Statues','Female',4),
('GU5','Yaren','Painting','Female',5),
('GU6','Aleyna','Painting','Female',6);

INSERT INTO Management VALUES

('MN1','Mustafa','CEO','All'),
('MN2','Ahmet','HOG','Guide'),
('MN3','Mehmet','HOS','Security');


SELECT * FROM Customer
SELECT * FROM Artist
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM Zones
SELECT * FROM SecuritySrv
SELECT * FROM Exhibition
SELECT * FROM Auction
SELECT * FROM Guide
SELECT * FROM Management


/* 1 */
SELECT * FROM Customer WHERE Customer.CustomerAge < 30 ORDER BY Customer.CustomerAge DESC
/* 2 */
SELECT * FROM Products WHERE (ProductType = 'Statue') AND ( ProductAge > 200 AND ProductAge < 600 ) AND (ProductPrice > 30000000 AND ProductPrice < 100000000)
/* 3 */
SELECT OrderID,OrderType,OrderCost,Orders.CustomerID,Artist.ArtistID FROM Orders INNER JOIN Products ON (Orders.OrderType = 'Statue') AND (Orders.CustomerID = 'FRE47') AND (Orders.ProductID = Products.ProductID) INNER JOIN Artist ON Artist.ArtistID = Products.ArtistID
/* 4 */
SELECT * FROM SecuritySrv WHERE SecuritySrv.SecurityGuardRank = 'Officer' 
/* 5 */
SELECT Artist.ArtistID,Products.ProductName,Products.ProductType FROM Products,Artist WHERE Products.ProductType = 'Statue' AND Products.ArtistID = Artist.ArtistID AND Products.ProductAge > 120
/* 6 */
SELECT * FROM Guide WHERE Guide.GuideGender = 'Male' AND Guide.GuideProfession = 'Painting'
/* 7 */
SELECT * FROM Zones WHERE Zones.RoomSize = 'Medium' AND Zones.RoomSecurityLevel > 3
/* 8 */
SELECT * FROM Management WHERE (ManagerDuty = 'Guide') AND ( ManagerName = 'Ahmet') AND ( ManagerRank = 'HOG')
/* 9 */
SELECT Artist.ArtistName,Artist.ArtistStyle,Products.ProductName FROM Artist INNER JOIN Products ON Products.ArtistID = Artist.ArtistID AND Artist.ArtistStyle = 'Painter'
/* 10 */
SELECT * FROM Exhibition WHERE Exhibition.ExhibitionContent = 'Painting' AND Exhibition.ExhibitionStartDate = '10.12.2019'
/* 11 */
SELECT * FROM Auction WHERE Auction.AuctionDate = '04.02.2020' AND Auction.ProductID IN (SELECT Products.ProductID FROM Products WHERE Products.ProductType = 'Painting')
/* 12 */
SELECT Orders.OrderType,AVG(Orders.OrderCost) FROM Orders GROUP BY Orders.OrderType ORDER BY AVG(Orders.OrderCost DESC/* GROUP BY */
/* 13 */
SELECT Customer.CustomerID,Customer.CustomerName,Customer.CustomerLastName,CustomerNation,OrderID,OrderCost,Orders.OrderType FROM Customer,Orders WHERE Customer.CustomerID IN ( SELECT Orders.CustomerID FROM Orders WHERE Orders.CustomerID = Customer.CustomerID AND Customer.CustomerNation = 'Turkey' AND Orders.OrderCost > 10000000)
/* 14 */
SELECT Artist.ArtistName,Products.ProductName,ProductPrice FROM Artist INNER JOIN Products ON Products.ArtistID = Artist.ArtistID ORDER BY Products.ProductPrice DESC
/* 15 */
SELECT TOP 3 * FROM Products WHERE ProductType = 'Statue' ORDER BY ProductPrice DESC 
/* 16 */
SELECT OrderID,OrderType,OrderCost,Orders.CustomerID,Artist.ArtistName,Artist.ArtistNation FROM Orders INNER JOIN Products ON Orders.ProductID = Products.ProductID INNER JOIN Artist ON Artist.ArtistID = Products.ArtistID
/* 17 */
SELECT ProductID,ProductName,ProductPrice FROM Products WHERE Products.ProductID IN (SELECT Auction.ProductID FROM Auction WHERE AuctionDate = '04.02.2020') 
/* 18 */
SELECT ArtistID,ArtistName,ArtistStyle FROM Artist WHERE Artist.ArtistID IN(SELECT Products.ArtistID FROM Products WHERE ProductName = 'Mona Lisa')
/* 19 */
SELECT Products.ProductType , AVG(Products.ProductPrice) FROM Products WHERE ProductType = 'Painting' OR ProductType = 'Statue' GROUP BY ProductType /* GROUP BY */



/*
1) ALL CUSTOMERS THAT YOUNGER THAN 30 USING ORDERBY @@

2) ALL STATUES BETWEEN 200-600 YEARS OLD AND BETWEEN 300K-1000K @@ 

3) ALL ORDERS THAT ORDERED BY SPECIFIC CUSTOMER(DEPENDS ON CUSTOMERID) AND TYPE AS A STATUE AND  MADE BY SPECIFIC ARTIST (JOIN) @@

4) ALL SECURITY GUARDS SPECIFICILY RANKED AS A OFFICIER @@ 

5) ALL STATUES DONE BY SPECIFIC ARTIST AND AGE MORE THAN 120 @@

6) ALL GUIDES THAT MALE AND PAINTING AS A PROFESSION

7) ALL ZONES THAT MEDIUM AND SECURITY LEVEL MORE THAN 3

8) ALL MANAGERS THAT RESPONSIBLE FOR GUIDES, RANKED AS A TEAM LEADER AND NAME CALLED AHMET

9) ALL ARTISTS THAT FROM FRANCE AND STYLIST AS A PAINTER AND HIS OR HER PAINTINGS (INNER JOIN)

10) ALL EXHIBITIONS THAT WAR AS A CONTENT AND STARTS AT 02.02.2020

11) ALL AUCTIONS THAT PAINTINGS AS A PRODUCT TYPE AND 26.05.2020 AS A DATE

12) ALL ORDERS SORTED FROM MOST EXPENSIVE 

13) ALL CUSTOMERS THAT NATION AS TURKEY AND ORDERS THAT ORDER COST MORE THAN 100K

14) ALL PAINTINGS THAT MADE BY SPECIFIC ARTIST AND COSTS MORE THAN 150K SORTED FROM CHEAPEST

15) 3 STATUES SORTED FROM MOST EXPENSIVE

16) ALL ORDERED ITEMS AND THEIR ARTIST'S NAMES AND NATIONS ORDER BY NAMES DESC

17) WRITE A SUBQUERY TO FIND ID, PRODUCT NAME AND PRODUCT PRICE WHICH WILL BE SELL ON " 04.02.2020"

18) WRITE A SUBQUERY TO FIND ID, NAME AND STYLE OF ARTIST WHO PAINTED "MONA LISA"

19) WRITE ALL THE PRODUCT TYPES WITH THEIR AVERAGE PRICES - GROUP BY 
 */