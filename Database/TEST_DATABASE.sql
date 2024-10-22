use LibraryDB;
select * from users;
select * from books; #before adding book 
select * from transactions;


#count number of readed books
select isbn,count(isbn) as readed from transactions group by isbn;

#sort readed books desc . You can copy and paste this code for loading top readed book 
select count(b.title and t.isbn) as readed, b.title, t.isbn,b.thumbnail from transactions t
join books b on t.isbn = b.isbn 
group by t.isbn
order by readed desc limit 3; #i have litmit it in 3.

#using this code in models for update number when adding book, change the number and isbn to "?"
update books
set total_number = total_number + 1 
where isbn = "123";

select * from books; #select table books after added book
