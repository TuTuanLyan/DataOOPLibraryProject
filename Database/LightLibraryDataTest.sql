DROP DATABASE IF EXISTS LibraryDB;
#if you had a database with same name, drop it/schemas to use this database

CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;
drop table if exists last_7_days;
CREATE TABLE users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
    fullName VARCHAR(100) NOT NULL,
	username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(15),
    email VARCHAR(100),
    role ENUM('CUSTOMER', 'ADMIN') DEFAULT 'CUSTOMER',
    avatarImage VARCHAR(2000),
    darkMode BOOLEAN DEFAULT FALSE,
    coin INT DEFAULT 0
);

CREATE TABLE books (
	totalNumber INT DEFAULT 1,
    availableNumber INT DEFAULT 1,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    publishedDate VARCHAR(20),
    isbn VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    thumbnail VARCHAR(10000),
    description VARCHAR(1000),
    price DOUBLE default 0.0
);
CREATE TABLE transactions (
    transactionID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    isbn VARCHAR(20),
    borrowDate DATE default (date(current_timestamp)),
    dueDate DATE,
    returnDate DATE,
    borrowFee DOUBLE,
    overdueFee DOUBLE DEFAULT 0,
    totalPrice DOUBLE
);

CREATE TABLE favoriteBooks (
	userID INT,
    ISBN VARCHAR(20),
    #FOREIGN KEY (userID) references users(userID),
    foreign key (ISBN) references books(ISBN)

);

CREATE TABLE requiredBooks (
	userID INT,
    ISBN VARCHAR(20)
    #FOREIGN KEY (userID) references users(userID)
    # đối với requiredBooks, isbn sẽ không phải foreign key, vì sẽ gọi đến 1 cuốn sách chưa tồn tại 
    # nếu đặt foreign key, sẽ báo lỗi
);


#add 2 user, 1 for admin and other for customer
insert into users (fullName, userName, email, password, role) values ("Lyan", "NTAT","ntat@gmail.com","ntat","ADMIN");
insert into users (fullName, userName,email,password,role) values ("Manh Pham","PHM","phm@gmail.com","phm","ADMIN");
insert into users (fullName, userName,email,password) values ("Kieu Van Tuyen","kieuvantuyen01","kieuvantuyen01@gmail.com","misshue");
insert into users (fullName, userName,email,password) values ("tester", "tester01","tester01@gmail.com","1234");
insert into users (fullName, userName,email,password) values ("Quick login", "1","tester01@gmail.com","1");


insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("C++ For Dummies","Stephen R. Davis","John Wiley & Sons","2004-04-19","http://books.google.com/books/content?id=QuluB-uwHkEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","9780764573941");
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("C++ GUI Programming with Qt 4","null","Prentice Hall Professional","2006","http://books.google.com/books/content?id=tSCR_4LH2KsC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",'9780131872493');
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("Symbian OS C++ for Mobile Phones","Richard Harrison, Mark Shackman","John Wiley & Sons","2007-06-29","http://books.google.com/books/content?id=61b46Uti8-UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","9780470066584");
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("C++ Templates","null","Addison-Wesley Professional","2002-11-12","http://books.google.com/books/content?id=yQU-NlmQb_UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",'9780672334054');
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("C++ Pocket Reference","Kyle Loudon","O'Reilly Media, Inc.","2008-08-07","http://books.google.com/books/content?id=cVckX9HtINwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","9781449378943");

insert into transactions (userID,borrowDate,ISBN) values (3,'2024-11-11','9780764573941');
insert into transactions (userID,borrowDate,ISBN) values (4,'2024-11-15','9781449378943');
insert into transactions (userID,ISBN) values (4,'9780672334054');
insert into transactions (userID,ISBN) values (2,'9780672334054');
insert into transactions (userID,returnDate,ISBN) values (1,'2024-11-13','123');
insert into transactions (userID,returnDate,ISBN) values (1,'2024-11-13','123');
insert into transactions (userID,returnDate,ISBN) values (1,'2024-11-13','123');
insert into transactions (userID,returnDate,ISBN) values (1,'2024-11-14','123');
insert into transactions (userID,returnDate,ISBN) values (1,'2024-11-14','123');
insert into transactions (userID,returnDate,ISBN) values (1,'2024-11-16','123');
insert into transactions (userID,borrowDate,ISBN) values (3,'2024-11-14','9780764573941');









insert into favoriteBooks (userID,ISBN) values (2,'9780672334054');
insert into favoriteBooks (userID,ISBN) values (2,'9781449378943');
insert into favoriteBooks (userID,ISBN) values (2,'9780764573941');

insert into requiredBooks (userID,ISBN) values (2,'9780672322242');
insert into requiredBooks (userID,ISBN) values (2,'9780470909508');
insert into requiredBooks (userID,ISBN) values (2,'9780596004194');
insert into requiredBooks (userID,ISBN) values (2,'9780768689976');