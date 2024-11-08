drop database LibraryDB;
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE users (
    userID INT PRIMARY KEY AUTO_INCREMENT,
	userName VARCHAR(100) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    # cái này thì tạo 1 ảnh jpg default xong thay path nhé 
    avtImg VARCHAR(255) DEFAULT "https://i.pinimg.com/1200x/bc/43/98/bc439871417621836a0eeea768d60944.jpg", 
    role VARCHAR(20) DEFAULT "CUSTOMER"
);

CREATE TABLE books (
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    publishedDate VARCHAR(50),
    ISBN VARCHAR(20) PRIMARY KEY,
    thumbnail VARCHAR(10000),
    totalNumber INT DEFAULT 1
);

CREATE TABLE transactions (
    transactionID INT PRIMARY KEY AUTO_INCREMENT,
    userID INT,
    ISBN VARCHAR(20),
    borrowDate DATE DEFAULT (DATE(current_timestamp)),
    dueDate DATE,
    returnDate DATE,
    fee DOUBLE default 0,
    FOREIGN KEY (userID) REFERENCES users(userID),
    FOREIGN KEY (ISBN) REFERENCES books(ISBN)
);

CREATE TABLE favoriteBooks (
	userID INT,
    ISBN VARCHAR(20),
    FOREIGN KEY (userID) references users(userID),
    foreign key (ISBN) references books(ISBN)

);

CREATE TABLE requiredBooks (
	userID INT,
    ISBN VARCHAR(20),
    FOREIGN KEY (userID) references users(userID)
    # đối với requiredBooks, isbn sẽ không phải foreign key, vì sẽ gọi đến 1 cuốn sách chưa tồn tại 
    # nếu đặt foreign key, sẽ báo lỗi
);



# mặc định role sẽ là customer, admin thì sẽ được cấp riêng tài khoản 
insert into users (userName,email,password,role) values ("NTAT","ntat@gmail.com","ntat","ADMIN");
insert into users (userName,email,password,role) values ("PHM","phm@gmail.com","phm","ADMIN");
insert into users (userName,email,password) values ("kieuvantuyen01","kieuvantuyen01@gmail.com","misshue");
insert into users (userName,email,password) values ("tester01","tester01@gmail.com","1234");


insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("C++ For Dummies","Stephen R. Davis","John Wiley & Sons","2004-04-19","http://books.google.com/books/content?id=QuluB-uwHkEC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","9780764573941");
insert into books (title,publisher,publishedDate,thumbnail,isbn) values ("C++ GUI Programming with Qt 4","Prentice Hall Professional","2006","http://books.google.com/books/content?id=tSCR_4LH2KsC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",'9780131872493');
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("Symbian OS C++ for Mobile Phones","Richard Harrison, Mark Shackman","John Wiley & Sons","2007-06-29","http://books.google.com/books/content?id=61b46Uti8-UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","9780470066584");
insert into books (title,publisher,publishedDate,thumbnail,isbn) values ("C++ Templates","Addison-Wesley Professional","2002-11-12","http://books.google.com/books/content?id=yQU-NlmQb_UC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",'9780672334054');
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("C++ Pocket Reference","Kyle Loudon","O'Reilly Media, Inc.","2008-08-07","http://books.google.com/books/content?id=cVckX9HtINwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","9781449378943");

insert into transactions (userID,ISBN) values (3,'9780764573941');
insert into transactions (userID,ISBN) values (4,'9781449378943');
insert into transactions (userID,ISBN) values (4,'9780672334054');
insert into transactions (userID,ISBN) values (2,'9780672334054');

insert into favoriteBooks (userID,ISBN) values (2,'9780672334054');
insert into favoriteBooks (userID,ISBN) values (2,'9781449378943');
insert into favoriteBooks (userID,ISBN) values (2,'9780764573941');

insert into requiredBooks (userID,ISBN) values (2,'9780672322242');
insert into requiredBooks (userID,ISBN) values (2,'9780470909508');
insert into requiredBooks (userID,ISBN) values (2,'9780596004194');
insert into requiredBooks (userID,ISBN) values (2,'9780768689976');