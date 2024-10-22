#if you had a database with same name, drop it/schemas to use this database
drop database LibraryDB;
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL
);

CREATE TABLE books (
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100) NOT NULL,
    publishedDate VARCHAR(50),
    isbn VARCHAR(20) NOT NULL PRIMARY KEY UNIQUE,
    thumbnail VARCHAR(10000),
    total_number INT DEFAULT 1
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    isbn VARCHAR(20),
    borrow_date DATETIME,
    due_date DATETIME,
    return_date DATETIME,
    fee DOUBLE default 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (isbn) REFERENCES books(isbn)
);
#add 2 user, 1 for admin and other for customer
insert into users (username,email,password,role) values ('maomao','maomao@email.com','maomaone','admin');
insert into users (username,email,password,role) values ('1','1@email.com','1','customer');

#add 4 books for test
#insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("blacktuyet","woker","hoolishit","2024-10-16","https://kenh14cdn.com/thumb_w/620/203336854389633024/2022/9/17/photo-12-1663394501769503174426.jpg","12345");
#insert into books (title,publisher,publishedDate,thumbnail,isbn) values ("DiddyVsKitty","hoolishit","2024-10-16","https://hips.hearstapps.com/hmg-prod/images/sean-diddy-combs-on-friday-september-15-2023-news-photo-1711468298.jpg",'1234566');
#insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("maomao","kitty","mangaku","2024-10-18","data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIALcAfgMBIgACEQEDEQH/xAAbAAEAAQUBAAAAAAAAAAAAAAAAAwECBAUGB//EAEMQAAEDAgMFBQQFCAsBAAAAAAEAAgMEEQUSIQYxMlFxBxMiQZEUYaGxFVJzgcEWQmJygpTR4hcjJDM0U1WSsuHwNf/EABkBAQEBAQEBAAAAAAAAAAAAAAABAgMEBv/EACcRAQACAgEEAQMFAQAAAAAAAAABEQIxAxITIVFhBBRSMkFCkbEF/9oADAMBAAIRAxEAPwDzxjW5RoN3JVyt5D0RvCOgReF9XERSlm8h6Ktm8h6IiFQWbyHoqWbyHoqohUKWbyHolm8h6KqIVClm8h6Ktm8h6IiFQpZvIeiWbyHoqohUKWbyHolm8h6KqIVBlbyHoopwMg0G/kpVHPwDqrG2c4jpSN4R0CI3hHQIo1Gk9HSz1s3c0rM8mQvte2g/98QpKXD5qqAzRvgazP3YMs7Y8zrXsMxF9CFkYbU01HSPkkMpqXzMLRC4BzGMIcLkg73W/wBiyqtlHVUsraSrpoI31ZqAydxBY18bbtsAb5TmbpyUuWJym6ampo6ilaw1EToy8uaGu33abEW57vUKSXDqqKKeV8do6eXuZHZho/zH3fiFtxidHLVSyyOLm0pjmpXSN1leyMMI92YtY6x+qo6erw9jIaCeSd7TA6OafOCwyP8AEXkEXJa4NF7/AJiWnXl6a36Nq+/poDERJVMD4QTo8EXGqQ4bUzQNlZ3d3sMkcTpAJJGi+rWbyND1totzQ4lSHE6aOqlaIYY4nxS2uGSNiDXt6G1uoHvWvmZBWR0s/tsMQipY45GOJ7wOY21mt/OBsLHdqb2slykZ5XUsWWglip2TySU4D42yNj9obnLXC4OW99xV9VhNXStlc8RP7k2mbFM17otbeIA3GuizcQkjnoKbupMMd3dHCx13nvw5rQCPUFSV0lNDiWKVra2nmFSyZkUULi5xz6eLSzQN+/yCWdeTQIqlUS3YREVBRz8A6qRRz8A6qxtnLSRvCOgRG8I6BFFjTptk9kzj9BX1slWYIKS4LWMzOc7LmtqdNLKSr2Ww92yv0/heKvmjABdBNEGOGoBGh3hdJ2VnPs1jsLfFKXuIY3eQYgB8VyX5Gzw7JOx+qm9nmZ4W0stMWvccwaBmJ/BcuqZmbeTuT3JvKvLZ4FsRDiWB0eJVWJPpjVzd1HGIQ7UuIBuT7lhx7Ig7bu2bfVPa0C7ajuxct7vODlv92/yXc439HYPh2y2FYhWS0TYnskZI1oIzRgcd9wJdvU+LUfc9puB1waS2opZ2kgXvkYbfByx15OXfzuZv3Ty3GcGdh20cmDRTd65kzImyOGXMXAbx5cS6ap2Ew6ixqjwmtxidlRVRGSOQU7TGXA8O+49fJY2PYdik2178amwurpqA1kTzLOwANaC0XOum5dF2jYFU4/tRg9NEx7IZYXNdUdyZGR6313fNanKbh0y5Znpjqrx5aSh7PRUV2LU78Ut7BlyvjhBEgLc2ovpyWrwrZZtfsZV7RGscx1OHkU/dgh2X9K/4Lt9gMKZgtVtDg0VXHUyx5NWNyXuw+VzbfbetdhEEuG9k2M0tew087O+Y5kmhzEDRTqn/ABmebPV/vDmtqNlG4Dg2HYg2sdOawgFhjDQy7M2++vJKXZRtRsVUbR+2Oa6IvHs/dgg2dl4r/guo26pcRxbAcEosNwyrqTExkr5WM8I8FrX8zqrsBoqmq7K8Sw2GJzq1kkzXU44g4Pvbqr1zGML3su3E35tzU+xwZs3hWLMrS6TEZYYmwmOwYZDbeDr6LYS7C4ZBjzcEqsbmjrZIBNG72Yd2/UgtHi3jLfotpjLXN7ONm6YzCmnfUUzWueNY3AnxEfo7z0WwmpMWdjuHYdtLR4djFBUMLRWeyZS1wBNjqbbr/f7lOqa/tiebP37eV4zQOwrFqqgfK2U078veNGjtAb/Fa+fgHVb3a+io8O2mr6TDWhtLG8BjWm4abAkDobrRT8A6rvjN09t3haRvCOgRG8I6BEbjS+KWWF+eGWSJ/wBaN5afUK6aoqJyDUVE0pG4ySOdb1KiV8LxHLG8i4a8OI52O5KJrdD5ZZ7GaWSW2gL3l1vUqpqJyWu9omJbwHvXXHTVdBWY/htY4zT4JC6VxN3Z7eRy/G1+YuOSsdi+DPzukwNrnvAu4ye83PWxHW1tEqHPry/FonVU0jcj6mZ7SLlrpXEH4q9lbVtjEcdZVNj3ZGzvy+gK3o2hoi+US4cCx1U6cRgi2oGUHyNrfFUmx7C57d5gzDaxNnAXIvqdORt7huVqE6p/FzzJJI5A+KR7Hjc5jyD6hXzVFRUD+0VE0v2kjnfMqfE6imqqgSUdI2ljy2MbTpvOvpYfcsNSnSKmLpKKqqAAbVVAA3ASu/iqRzzxPMkNRNG93E5kjmk9SCo0SlqF8s0s7s080krucjy4/FXtq6psfdtq6kR/UE7g30uoUSioPxUc/AOqkUc/AOqQmWkjeEdAiN4R0CIsaEREUREQEREBERAREQEREBRz8A6qRRz8A6qxtnLSRvCOgRG8I6BFFjQpKdjZKiKN5s18jWuPIEgEqNXRBrpGh17Ei9t9lJVmfRxbA2SaZsbnC4YRqefnpqN6uZQ04qHxyVjcrXNAeG77uLTz5KV+H0peB7WGHdZxBy6acra+XxUTaCEkA1rGnTe0aXF7HxeVrdbIxfyqcMYAwe1sJeAcobcj4qj6CJj6e0+ZsssTDa1mh182t/K3xCU1FTvkkZLLbLls+7RYEXN9+vlvt71SSggYLurGai5s253E8/dbqhfyR4bmja6SoaxxGrC3UG/Xy8/xVWYdC4ke2NJH6Hne3PXcquwyCxIrI22aDqAbnKDca7r6a7veoaqjbBEJGy94wuyg2Fjv95+r8QhfyxXDK5zeRsqIEVhsREQFHPwDqpFHPwDqrG2ctJG8I6BEbwjoEUWNCIiKDTciIgJu3IiBYclUucWhpcS0bhfQKiICIiAiIgKOfgHVSKOfgHVWNs5aSN4R0CI3hHQIosaEREUREQEREBERAREQEREBRz8A6qRRz8A6qxtnLSRvCOgRG8I6BFFjQiIiiIiAiIgIiICIiAiIgKOfgHVSKyceD71Y2zlpe3hHQIjeEdAiixoRERRERAREQEQkN3kBSQQTVBy00MsxO4RMLvkhcI0W6pNlcdqyO6w2VoPnIWs+ZXQYf2YYxUWNTNHCOUbC8/GwWoxmXLLn48dy4VXRsfK8MhjfI87msaXH0C9gwvspoobGrEtQfPvpcrfRv8V1+G7KUWHsDIGRwsH5sMYb8VqOKZ28uf8A0OPH9Pl4phew+MVpa+oYyjhO90x8X3NGvrZdSNgqCjoGvdDLWSF4Bkl0buPCB/2vWIMPpYP7uFt/rO1KxNpNKCP7UfIrrHFEPBy/X8mevDzSm7HpJqaKT6caM7Gut7LuuP1lJ/QzL/rrf3X+ZeqYb/8APpfsWf8AELJV7ePpj77n9vI/6GZP9dH7r/MqjsZd544fupv5l62idvH0ffc/t5QzsZh/PxuY/qwNH8VkxdjuHNP9ZilW/wDZaF6bZVV7ePpJ+t55/k89i7JNn2/3s1ZIPfIR8lnU/ZjsvAb+xuk+0lc75ldoivRj6Yn6nmneTQUux2z9KP6nDKcfsBbSLDaKJoaymYAPKyy1wfbBhUtbs/BW0wk76jmF+7vmDH+EnTkcrv2VahznPKdy7lkUbD4I2t6NsrrLzXs/G0k7a6qYTFSyiVzY5y0MNQX38LbZmjiuSTe4IXWM/KZsYa8UD3tykuBIzbr6eXn8FWG/si0LvyjDvD7I4GBoN9MsmU3PvGa3Qc1Y78qHQ+FuHxyEHcXGxtpv96DoVqdpf8Az7UfIrKw723uj9ICISB1gY9xHNYu0v+AZ9qPkUGbht/o+lv8A5LPkFkoiAiIgIiICIiAqEX80RAsiIgr6IqIgLVbSn+wM+1HyKIg//9k=","123");
#insert into books (title,publisher,publishedDate,thumbnail,isbn) values ("Furina","fotaine","2024-10-22","https://assetsio.gnwcdn.com/Genshin-Impact-Furina-splash-art-1.jpg?width=1200&height=1200&fit=bounds&quality=70&format=jpg&auto=webp",'666');

insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("blacktuyet","woker","hoolishit","2024-10-16","http://books.google.com/books/content?id=igvwDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","12345");
insert into books (title,publisher,publishedDate,thumbnail,isbn) values ("Springer Science & Business Media","hoolishit","2024-10-16","http://books.google.com/books/content?id=HAMBEQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",'1234566');
insert into books (title,author,publisher,publishedDate,thumbnail,isbn) values ("maomao","kitty","mangaku","2024-10-18","http://books.google.com/books/content?id=-qXyDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","123");
insert into books (title,publisher,publishedDate,thumbnail,isbn) values ("Furina","fotaine","2024-10-22","http://books.google.com/books/content?id=YpfwDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",'666');

#add transaction 
insert into transactions (user_id,isbn,borrow_date,due_date) values (1,'12345','2024-10-16','2024-12-31');
insert into transactions (user_id,isbn,borrow_date,due_date) values (2,'12345','2024-10-16','2024-12-31');
insert into transactions (user_id,isbn,borrow_date,due_date) values (2,'12345','2024-10-16','2024-12-31');
insert into transactions (user_id,isbn,borrow_date,due_date) values (2,'1234566','2024-10-16','2024-12-31');
insert into transactions (user_id,isbn,borrow_date,due_date) values (1,'123','2024-10-19','2024-12-29');

