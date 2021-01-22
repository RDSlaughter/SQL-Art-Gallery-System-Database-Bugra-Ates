# SQL-Art Gallery System Database Example
### Buğra ATEŞ 20.12.2019 

### Database Visualization

![databasegraph](https://user-images.githubusercontent.com/49213911/105476000-21be0480-5cb1-11eb-95ed-4a4bd04089a3.png)


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

##
## Buğra ATEŞ 
## https://github.com/RDSlaughter
## https://www.linkedin.com/in/bugraates/


