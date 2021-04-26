use master;
drop database Sandwiches;

go
create database Sandwiches;
go

use Sandwiches;

Create table Employee(
empID int identity primary key not null,
waitress nvarchar(50) not null,
DeliveryDriver nvarchar(50) not null,

Constraint check_employee_id
check (empID between 1 and 10000)
)

Create table Customer(
TableNo int Identity Primary Key not null,
Addr nvarchar(150) null,
City nvarchar(150) null,
State nvarchar(150) null,
Zip nvarchar(150) null
)

create table Orders(
OrderNo int identity Primary Key,
Price nvarchar(150),
Details nvarchar(150),
Tip nvarchar(150),
Delivery nvarchar(150),
DineIn nvarchar(150),
empID int references  Employee(empID),
TableNo int references Customer(TableNo)
)

insert into Employee(waitress,DeliveryDriver) values ('Yes','No')
insert into Employee(waitress,DeliveryDriver) values ('Yes','No')
insert into Employee(waitress,DeliveryDriver) values ('No','Yes')

insert into Customer(addr,City,State,Zip) values ('2620 Brick Chimney Rd','Bradford','PA','16701')
insert into Customer(addr,City,state,zip) values ('9545 Rose Lake Ct','Bradford','PA','16701')
insert into Customer(addr,City,State,Zip) values ('3345 blue bird Rd','Bradford','PA','16701')


insert into Orders (Price,Details,Tip,Delivery,DineIn) values ('$2','Grilled Cheese','$1','No','Yes')
insert into Orders (Price,Details,Tip,Delivery,DineIn) values ('$3','Hamburger','$4','No','Yes')
insert into Orders (Price,Details,Tip,Delivery,DineIn) values ('$3','CheeseBurger','$5','Yes','No')
insert into Orders (Price,Details,Tip,Delivery,DineIn) values ('$5','Bacon CheeseBurger','$3','No','Yes')
insert into Orders (Price,Details,Tip,Delivery,DineIn) values ('$4','Grilled Chicken','$3','Yes','No')

go 
create procedure AddEmployee
@waitress nvarchar(5),
@Delivery nvarchar(5)

As
Begin
insert into Employee(waitress,DeliveryDriver)
values ('Yes','No')
End
go
exec AddEmployee 1,2;



go
create procedure getDetails
As
Begin
select O.Price,O.Details,O.Tip,O.Delivery,O.DineIn,C.TableNo 
from Orders O
inner join Customer C on O.Details=str(C.TableNo)
where C.TableNo='2'
End
go
exec getDetails;



go
Create procedure detailsWithParameters
(@OrderNo int)
As
Begin
Select O.Details
from Orders O
where OrderNo=@OrderNo
End
go
exec detailsWithParameters 3; 



go
create view[OrderPrice] AS
Select Details
from Orders
where Price ='$3';
go
Select*from OrderPrice;

go
create view[Tip] AS
Select Tip,Details
from Orders
where Delivery='Yes';
go
Select*from Tip;

go
create view[getAddress] AS
Select Addr,City,State,Zip
from Customer
where TableNo='3'
go
Select*from getAddress;



