
   CREATE TABLE Users
(
        UserID nvarchar(50) NOT NULL Primary key,
		UserName nvarchar(50) Not null,
		Email nvarchar(50) Not null unique,
		[Password] nvarchar(100) NOT NULL,
		BirthDate date,
		Phone nvarchar(10),
		Gender varchar(5) NOT NULL
)
 CREATE TABLE Publishers(
		 PublisherID  int NOT NULL primary key,
		 PublisherName nvarchar(100) NOT NULL,
		 [Address] nvarchar(200)
)
  Create table Staff(
  StaffID int Primary key,
  FullName nvarchar(100),
  Email nvarchar(255),
  Phone varchar(10),
  Check (len(Phone) = 10)
  )
 CREATE TABLE Authors(
		 AuthorID  int  NOT NULL primary key,
		 [Name] nvarchar(50) NOT NULL,
		 [Description] nvarchar(4000) NOT NULL,
		 BirthDate  date,
)
 
CREATE TABLE  Category(
		 CategoryID int Identity  NOT NULL primary key,
		 CategoryName  nvarchar(100) NOT NULL
)
 
CREATE TABLE  SubCategory (
		 SubcategoryID  int Identity NOT NULL primary key,
		 SubCategoryName   nvarchar(100) NOT NULL,
		 CategoryID   int  NOT NULL  references Category(CategoryID)
)
 
CREATE TABLE Orders(
		 OrderID   int Identity NOT NULL primary key ,
		 OrderDate  date NOT NULL,
		 ShipDate  date NOT NULL,
		 OrderStatus  nvarchar(200) NOT NULL,
		 ShipAddress nvarchar(200) NOT NULL,
		 ShipCity nvarchar(50) NOT NULL,
		 UserID   nvarchar(50)  NOT NULL  References Users(UserID)
)

Create table Stores
(
StoreID int Primary key,
StoreName nvarchar(100),
Phone varchar(10),
Email varchar(255),
City nvarchar(20)
)
 
CREATE TABLE  Books (
		 BookID  int NOT NULL primary key,
		[Name] nvarchar(100) NOT NULL,
		 Price   float  NOT NULL,
		 Stock   int  NOT NULL,
		 SubcategoryID   int  NOT NULL  references SubCategory(SubCategoryID),
		 PublisherID   int  NOT NULL  references Publishers(PublisherID),
		 AuthorID int  NOT NULL References Authors(AuthorID),
		 [Description] nvarchar(4000) not null,
		 Mass float not null,
		 [Format] nvarchar(100) not null,
		 [ReleaseDate] date not null,
		 License nvarchar(100) not null,
		 [Language] nvarchar(50),
		 Size float not null,
		 NumberOfPages int not null,
		 Quanlity varchar(5),
		 StaffID int not null references Staff(StaffID),
		 check (Stock >= 0),
		 check(Price >= 0)
)
 Create table Stock
 (
 AddedDate date not null,
 Quantity int not null,
 BookID int not null references Books(BookID),
 StoreID int not null references Stores(StoreID)
 )

 Create table PublishingCompany
 (
 PublishingID int Primary key,
 [Address] nvarchar(100),
 [Name] nvarchar(100),
 )

 Create table Publishing
(
PublishingID int not null references PublishingCompany(PublishingID),
BookID int not null references Books(BookID)
)


CREATE TABLE OrderDetail
(
		BookID   int NOT NULL  References Books( BookID ) ,
		OrderID   int NOT NULL References  Orders(OrderID),
		Quantity int NOT NULL  default 1,
		Discount int NOT NULL  default 0,
		check(Quantity > 0),
		check(Discount >= 0 AND Discount <= 1),
		primary key(BookID,OrderID)
)
 Create TABLE Reviews
( 
        ReviewID int  identity PRIMARY KEY,
		UserID   nvarchar(50)  NOT NULL  References Users(UserID),
		Content nvarchar(4000) not null,
		CommentDate date not null,
		Stars int not null,
		Title nvarchar(100),
		BookID int not null references Books(BookID)
 )
 Create table viewCart
 (
 [Date] date not null,
  UserID   nvarchar(50)  NOT NULL  References Users(UserID),
  BookID int not null references Books(BookID)
 )

 Create table ViewProduct
 (
 [Date] date not null,
 [Status] bit not null default 0,
  UserID   nvarchar(50)  NOT NULL  References Users(UserID),
  BookID int not null references Books(BookID)
 )

 Create table AccumulatedPoints
 (
 ID int identity Primary key,
 Content nvarchar(255) not null,
 Point int not null
 )

 Create table AddPoint
 (
 [Date] date,
 OrderID int References Orders(OrderID),
 ID int References AccumulatedPoints(ID)
 )

 CREATE TABLE [Favorites list]
(
		BookID   int NOT NULL   References Books( BookID ) ,
		UserID   nvarchar(50)  NOT NULL  References Users(UserID)
)



Insert Category(CategoryName) Values(N'Sách Kinh Tế')
Insert Category(CategoryName) Values(N'Sách Blockchain')
Insert Category(CategoryName) Values(N'Sách Ngoại Văn')
Insert Category(CategoryName) Values(N'Sách Văn Học Trong Nước')
Insert Category(CategoryName) Values(N'Sách Văn Học Nước Ngoài')
Insert Category(CategoryName) Values(N'Sách Thường Thức - Đời Sống')
Insert Category(CategoryName) Values(N'Sách Thiếu Nhi')
Insert Category(CategoryName) Values(N'Sách Tin Học - Ngoại Ngữ')
Insert Category(CategoryName) Values(N'Sách Chuyên Ngành')
Insert Category(CategoryName) Values(N'Sách Giáo Khoa - Giáo Trình')
Insert Category(CategoryName) Values(N'Tạp Trí - Văn Phòng Phẩm')
 
Insert SubCategory(SubCategoryName,CategoryID) values(N'Marketing - Bán Hàng',1)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Ngoại Thương',1)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Nhân Sự & Việc Làm',1)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Nhân Vật & Bài Học Kinh Doanh',1)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Quản Trị - Lãnh Đạo',1)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Tài Chính - Kế Toán',1)
 
Insert SubCategory(SubCategoryName,CategoryID) values(N'Dến Thế Giới Mới Với Smartphone',2)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Blockchain Và Đầu Tư ICOs Căn',2)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Cách Mạng Công Nghệ 4.0',2)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Blockchain: Bản Chất Của',2)
 
Insert SubCategory(SubCategoryName,CategoryID) values(N'Business&Money',3)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Children Books',3)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Comics&Graphic Novels',3)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Crafts,Hobbies & Home',3)
Insert SubCategory(SubCategoryName,CategoryID) values(N'History',3)
 
Insert SubCategory(SubCategoryName,CategoryID) values(N'Phóng Sự, Ký Sự',4)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Thơ Ca',4)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Tiểu Thuyết',4)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Tiểu Thuyết Lịch Sử',4)

Insert SubCategory(SubCategoryName,CategoryID) values(N'Thơ Ca',5)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Tiểu Thuyết',5)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Phóng Sự, Ký Sự',5)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Tiểu Thuyết Lịch Sử',5)
 
Insert SubCategory(SubCategoryName,CategoryID) values(N'Khoa Học Tự Nhiên',7)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Khoa Học Xã Hội',7)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Mỹ Thuật, Âm Nhạc',7)
Insert SubCategory(SubCategoryName,CategoryID) values(N'Sách Ngoại Ngữ',7)

insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('MinhDuy0203' , 'Nguyen Minh Duy' , 'minhduy0203@gmail.com' , 'duy123456' , '2002-02-10','023456789', 'M')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('duong123' , 'Tuan Duong' , 'TuanDuongabc@gmail.com' , 'duong123' ,'2001-02-10', '0912323221' , 'M')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('hoangdat123' , 'Hoang Dat' , 'hoangdat2323@gmail.com' , 'dat123456' ,'2003-05-01', '099123789' , 'M')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('ATRU' , 'Ana Trujillo' , 'artu123@gmail.com' , 'artu123456' ,'2004-06-10', '092356789' , 'F')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('THOHA' , 'Thomas Hardy' , 'thoha123@gmail.com' , 'thoha123456' ,'2002-07-07', '032456789' , 'M')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('CHRIBERG' , 'Christina Berglund' , 'chriberg321@gmail.com' , 'chriberg123456' ,'2004-03-11', '012456789' , 'F')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('HANMO' , 'Hanna Moos' , 'hanmo232@gmail.com' , 'hanmo123456' ,'2001-02-5', '0933456789' , 'F')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('FRECI' , 'Frédérique Citeaux' , 'freci121@gmail.com' , 'freci123456' ,'2007-03-10', '089456789' , 'M')
insert into Users(UserID , UserName , Email , Password , BirthDate,Phone,Gender)
VALUES
('MASOM' , 'Martín Sommer' , 'masom423@gmail.com' , 'masom123456' ,'2003-03-13', '0947456789' , 'M')


 
 insert into dbo.Authors
( AuthorID,[Name],[Description],BirthDate)values(1, 'Dao Duy Tu','hoc gioi','1995/7/24')
insert into dbo.Authors
( AuthorID,[Name],[Description],BirthDate)values(2, 'Vu Van Quy','hoc dot','1996/8/25')
insert into dbo.Authors
( AuthorID,[Name],[Description],BirthDate)values(3, 'Ho Van Son','dep trai','2000/7/4')
insert into dbo.Authors
( AuthorID,[Name],[Description],BirthDate)values(4, 'Le Van Bang','hoc gioi','1999/7/2')
insert into dbo.Authors
( AuthorID,[Name],[Description],BirthDate)values(5, 'Dao Quy Dao','xau trai','1895/9/6')

insert into dbo.Publishers
( PublisherID, PublisherName, [Address]) values (1, 'Hoa Hoc', 'Ha Noi')
insert into dbo.Publishers
( PublisherID, PublisherName, [Address]) values (2, 'Van Hoc', 'Ha Dong')
insert into dbo.Publishers
( PublisherID, PublisherName, [Address]) values (3, 'Li Hoc', 'Ha Van')
insert into dbo.Publishers
( PublisherID, PublisherName, [Address]) values (4, 'Khoa Hoc', 'Ha Bac')
insert into dbo.Publishers
( PublisherID, PublisherName, [Address]) values (5, 'Toan Hoc', 'Ha Nam')


select * from Category
select * from SubCategory
select * from Users
select * from Publishers
select * from Authors
select * from Books

Insert Books(BookID,Name,Price,Stock,SubcategoryID,PublisherID,AuthorID)
Values(1,N'Sinh Vật Học Kỳ Thú - Bọ Cánh', 165.000,32,24,1,1)
Insert Books(BookID,Name,Price,Stock,SubcategoryID,PublisherID,AuthorID)
Values(2,N'Dkfindout Những Điều Sách', 93.000,20,24,2,3)
select * from Books

--order detail
insert into dbo.OrderDetail
(BookID, OrderID, Quantity, Discount) values (1, 1, 5, 1)
insert into dbo.OrderDetail
(BookID, OrderID, Quantity, Discount) values (2, 2, 3, 0)
insert into dbo.OrderDetail
(BookID, OrderID, Quantity, Discount) values (3, 3, 59, 1)
insert into dbo.OrderDetail
(BookID, OrderID, Quantity, Discount) values (4, 4, 34, 1)
insert into dbo.OrderDetail
(BookID, OrderID, Quantity, Discount) values (5, 5, 64, 0)
select * from SubCategory
select * from Books
--books
insert into dbo.Books
(BookID, [Name], Price, Stock, SubcategoryID, PublisherID, AuthorID) values (1,'Alibaba va 50 ten cuop', 20, 18, 18, 1, 3)
insert into dbo.Books
(BookID, [Name], Price, Stock, SubcategoryID, PublisherID, AuthorID) values (2, 'Doan thuyen danh ca', 50, 65, 17, 2, 2)
insert into dbo.Books
(BookID, [Name], Price, Stock, SubcategoryID, PublisherID, AuthorID) values (3, 'Phi long tai thien', 35, 35, 16, 2, 4)
insert into dbo.Books
(BookID, [Name], Price, Stock, SubcategoryID, PublisherID, AuthorID) values (4, 'Chiec but vang', 29, 42, 13, 4, 2)
insert into dbo.Books
(BookID, [Name], Price, Stock, SubcategoryID, PublisherID, AuthorID) values (5, 'Qua bong bac', 26, 45, 3, 5, 5)
select * from Users
select * from Orders
-- order
select * from Orders
insert into dbo.Orders
(OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values (  '2021/8/9', '2022/8/9', 'Done', 'Viet Nam', 'Ha Noi', 'CHRIBERG')
insert into dbo.Orders
( OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values ( '2020/3/7', '2021/3/7', 'Wait', 'Viet Nam', 'Hai Duong', 'FRECI')
insert into dbo.Orders
(  OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values ( '2019/8/3', '2019/8/3', 'Done', 'Han Quoc', 'Seoul', 'ATRU')
insert into dbo.Orders
(  OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values ('2017/10/5', '2017/10/5', 'Done', 'Trung Quoc', 'Bac Kinh', 'MASOM')
insert into dbo.Orders
(  OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values (  '2013/11/8', '2016/11/8', 'Wait', 'Viet Nam', 'Ca Mau', 'MinhDuy0203')
insert into dbo.Orders
(OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values (  '2021/11/9', '2022/10/9', 'Done', 'Viet Nam', 'Ha Noi', 'CHRIBERG')
insert into dbo.Orders
(OrderDate, ShipDate, OrderStatus, ShipAddress, ShipCity, UserID) values (  '2021/12/2', '2022/12/9', 'Done', 'Viet Nam', 'Ha Noi', 'CHRIBERG')
select * from Comments
insert into Comments
(BookID, UserID, Comment, Vote) values (1, 'MinhDuy0203', 'Sach hay qua', 3)
insert into Comments
(BookID, UserID, Comment, Vote) values (2, 'CHRIBERG', 'Sach khong hay roi', 4)
insert into Comments
(BookID, UserID, Comment, Vote) values (3, 'ATRU', 'Nhan vat khong tot', 3)
insert into Comments
(BookID, UserID, Comment, Vote) values (4, 'MASOM', 'Khong thich nhan vat A', 4)
insert into Comments
(BookID, UserID, Comment, Vote) values (5, 'FRECI', 'Rat co ich cho viec kinh doanh', 5)

insert into [Favorites list] 
(BookID, UserID) values (2 ,'MinhDuy0203')
insert into [Favorites list] 
(BookID, UserID) values (3 ,'CHRIBERG')
insert into [Favorites list] 
(BookID, UserID) values (1 ,'MASOM')
insert into [Favorites list] 
(BookID, UserID) values (4 ,'ATRU')
insert into [Favorites list] 
(BookID, UserID) values (2 ,'ATRU')

insert into Comments(BookID , UserID , Comment) values(1,'duong123','Amazing good chop') 
insert into Comments(BookID , UserID , Comment) values(2,'hoangdat123','rat tuyet voi') 
insert into Comments(BookID , UserID , Comment) values(4,'MinhDuy0203','Sugoi')
insert into Comments(BookID , UserID , Comment) values(3,'MASOM ','Sugoi')


select * from Authors
select * from Books
select * from Orders
select * from OrderDetail
select * from Publishers
select * from Category
select * from SubCategory
select * from Category
select * from Users
select * from Comments



CREATE TRIGGER UpdateStock
ON OrderDetail
FOR INSERT
AS
BEGIN
IF (SELECT stock from Books b , inserted i WHERE b.BookID = i.BookID ) < (select Quantity from inserted) 
BEGIN
PRINT('So luong sach trong kho khong du')
ROLLBACK TRAN
END
ELSE
BEGIN
UPDATE Books 
SET Stock =  Stock - i.Quantity
FROM Books b , inserted i
WHERE b.BookID = i.BookID
END
END




 
CREATE TRIGGER UpdateStock
ON OrderDetail
FOR INSERT
AS
BEGIN
IF (SELECT stock from Books b , inserted i WHERE b.BookID = i.BookID ) < (select Quantity from inserted) 
BEGIN
PRINT('So luong sach trong kho khong du')
ROLLBACK TRAN
END
ELSE
BEGIN
UPDATE Books 
SET Stock =  Stock - i.Quantity
FROM Books b , inserted i
WHERE b.BookID = i.BookID
print('Them don hang thanh cong')
END
END
  
select * from Books
select * from Orders
select * from OrderDetail
Insert OrderDetail(BookID,OrderID,Quantity, Discount)
Values(5,6,2,0.2)
Insert OrderDetail(BookID,OrderID,Quantity, Discount)
Values(5,8,3,0.2)
 Insert Orders(OrderDate,ShipDate,OrderStatus,ShipAddress,ShipCity,UserID) 
Values('2022-11-06','2022-12-12','Wait',N'Thạch Thất',N'Hà Nội','HANMO')
Insert OrderDetail(BookID,OrderID,Quantity, Discount)
Values(5,9,3,0.2)
 
 


  
Create PROC TopBookSeller @t int
AS
BEGIN 
SELECT TOP (@t) a.BookID, b.Name, SUM(Quantity) as 'TotalQuantity' 
FROM OrderDetail a, Books b
WHERE a.BookID = b.BookID
GROUP BY a.BookID , Name
ORDER BY SUM(Quantity) DESC
END

 exec TopBookSeller 5

 select * from  Books
 select * from OrderDetail o join Orders p 
 on o.OrderID = p.OrderID
 


