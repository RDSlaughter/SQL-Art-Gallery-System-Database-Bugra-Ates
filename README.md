# SQL-Art Gallery System Database Example
### Buğra ATEŞ 20.12.2019 

### Database Visualization
##
![databasegraph](https://user-images.githubusercontent.com/49213911/105477272-afe6ba80-5cb2-11eb-92cd-ccb252b372c8.png)
##

### DEPENDENCIES
#### CustomerAuction
(CustomerID, AuctionID, OrderNumber, AttendNumber, CustomerGender)
#### DIVIDED INTO
(CustomerID, AuctionID, OrderNumber, AttendNumber)
(CustomerID, CustomerGender)

#### GuideZone
(RoomNumber, GuideID, GuideShift, RoomShift)
#### DIVIDED INTO
(RoomNumber, GuideID, GuideShift)
(RoomNumber, RoomShift)

#### ArtistExhibition
(ArtistID, ExhibitionID, WorkArtPeriod, ExhibitionAmount, ArtistGender)
#### DIVIDED INTO
(ArtistID, ExhibitionID, WorkArtPeriod)
(ExhibitionID, ExhibitionAmount)
(ArtistID, ArtistGender)

#### SecurityZone
(SecurityGuardID, RoomID, SecurityGuardShift, SecurityGuardDuty)
#### DIVIDED INTO
(SecurityGuardID, RoomID, SecurityGuardShift)
(SecurityGuardID, SecurityGuardDuty)

## Some Query Examples
Query example answers included in .sql file.

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

## Answers

1)
SELECT * FROM Customer WHERE Customer.CustomerAge < 30 ORDER BY Customer.CustomerAge DESC

2)
SELECT * FROM Products WHERE (ProductType = 'Statue') AND ( ProductAge > 200 AND ProductAge < 600 ) AND (ProductPrice > 30000000 AND ProductPrice < 100000000)

3)
SELECT OrderID,OrderType,OrderCost,Orders.CustomerID,Artist.ArtistID FROM Orders INNER JOIN Products ON (Orders.OrderType = 'Statue') AND (Orders.CustomerID = 'FRE47') AND (Orders.ProductID = Products.ProductID) INNER JOIN Artist ON Artist.ArtistID = Products.ArtistID

4)
SELECT * FROM SecuritySrv WHERE SecuritySrv.SecurityGuardRank = 'Officer' 

5)
SELECT Artist.ArtistID,Products.ProductName,Products.ProductType FROM Products,Artist WHERE Products.ProductType = 'Statue' AND Products.ArtistID = Artist.ArtistID AND Products.ProductAge > 120

6)
SELECT * FROM Guide WHERE Guide.GuideGender = 'Male' AND Guide.GuideProfession = 'Painting'

7)
SELECT * FROM Zones WHERE Zones.RoomSize = 'Medium' AND Zones.RoomSecurityLevel > 3

8)
SELECT * FROM Management WHERE (ManagerDuty = 'Guide') AND ( ManagerName = 'Ahmet') AND ( ManagerRank = 'HOG')

9)
SELECT Artist.ArtistName,Artist.ArtistStyle,Products.ProductName FROM Artist INNER JOIN Products ON Products.ArtistID = Artist.ArtistID AND Artist.ArtistStyle = 'Painter'

10)
SELECT * FROM Exhibition WHERE Exhibition.ExhibitionContent = 'Painting' AND Exhibition.ExhibitionStartDate = '10.12.2019'

11)
SELECT * FROM Auction WHERE Auction.AuctionDate = '04.02.2020' AND Auction.ProductID IN (SELECT Products.ProductID FROM Products WHERE Products.ProductType = 'Painting')

12)
SELECT Orders.OrderType,AVG(Orders.OrderCost) FROM Orders GROUP BY Orders.OrderType ORDER BY AVG(Orders.OrderCost DESC/* GROUP BY */

13)
SELECT Customer.CustomerID,Customer.CustomerName,Customer.CustomerLastName,CustomerNation,OrderID,OrderCost,Orders.OrderType FROM Customer,Orders WHERE Customer.CustomerID IN ( SELECT Orders.CustomerID FROM Orders WHERE Orders.CustomerID = Customer.CustomerID AND Customer.CustomerNation = 'Turkey' AND Orders.OrderCost > 10000000)

14)
SELECT Artist.ArtistName,Products.ProductName,ProductPrice FROM Artist INNER JOIN Products ON Products.ArtistID = Artist.ArtistID ORDER BY Products.ProductPrice DESC

15)
SELECT TOP 3 * FROM Products WHERE ProductType = 'Statue' ORDER BY ProductPrice DESC 

16)
SELECT OrderID,OrderType,OrderCost,Orders.CustomerID,Artist.ArtistName,Artist.ArtistNation FROM Orders INNER JOIN Products ON Orders.ProductID = Products.ProductID INNER JOIN Artist ON Artist.ArtistID = Products.ArtistID

17)
SELECT ProductID,ProductName,ProductPrice FROM Products WHERE Products.ProductID IN (SELECT Auction.ProductID FROM Auction WHERE AuctionDate = '04.02.2020') 

18)
SELECT ArtistID,ArtistName,ArtistStyle FROM Artist WHERE Artist.ArtistID IN(SELECT Products.ArtistID FROM Products WHERE ProductName = 'Mona Lisa')

19)
SELECT Products.ProductType , AVG(Products.ProductPrice) FROM Products WHERE ProductType = 'Painting' OR ProductType = 'Statue' GROUP BY ProductType /* GROUP BY */


##
## Buğra ATEŞ 
## https://github.com/RDSlaughter
## https://www.linkedin.com/in/bugraates/


