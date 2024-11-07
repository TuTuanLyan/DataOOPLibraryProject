use LibraryDB;

# top books
SELECT COUNT(b.title AND t.ISBN) AS readed, b.title, t.ISBN,b.thumbnail FROM transactions t
JOIN books b ON t.ISBN = b.ISBN
GROUP BY t.ISBN
ORDER BY readed DESC LIMIT 3; 

# hiển thị favoriteList với từng user
select f.*,b.title,b.author,b.publisher,b.publishedDate,b.thumbnail from favoriteBooks f
left join books b on b.isbn = f.isbn;

#delete from favoriteBooks where userID = ? and ISBN = ?; :> dùng để remove khỏi favoriteBooks

select * from requiredBooks;

select * from users;
select * from books;
select * from transactions;