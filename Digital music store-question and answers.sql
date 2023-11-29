create database digital_music_store_analysis;
show databases;
use digital_music_store_analysis;


/*   Question set1-easy   */
/*   Q1:--Who is the senior most employee based on job title?   */

select title,first_name,last_name from employee
order by levels desc limit 1;

/*Q2:--Which countries have the most Invoices?   */

select billing_country,count(*) from invoice
group by billing_country
order by count(*) desc;

/*    Q3:--What are top 3 values of total invoice?   */

select * from invoice
order by total desc limit 3;

/*    Q4:--Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. Write a query that returns one city that 
has the highest sum of invoice totals. Return both the city name & sum of all invoice 
totals   */

select billing_city,sum(total) from invoice
group by billing_city
order by sum(total) desc limit 1;

/*  Q5:--Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money    */

select customer.customer_id,first_name,last_name,sum(total) from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id,first_name,last_name
order by sum(total) desc limit 1;

/*    Question Set 2 – Moderate & advance   */
/*Q1:--Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A     */

select distinct(email),first_name,last_name,genre.name from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
join track on track.track_id=invoice_line.track_id
join genre on track.genre_id=genre.genre_id
where genre.name like "rock"
order by email;

/*    Q2:--Let's invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands    */

select artist.artist_id,artist.name,count(artist.artist_id) from artist
join album2 on artist.artist_id=album2.artist_id
join track on track.album_id=album2.album_id
join genre on genre.genre_id=track.genre_id
where genre.name like "rock"
group by artist.artist_id,artist.name
order by count(artist.artist_id) desc limit 10;

/*    Q3:--Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first    */

select name ,milliseconds from track
where milliseconds>(
select avg(milliseconds) from track
)
order by milliseconds desc;

/*   Q4:--Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent    */ 

select customer.customer_id,customer.first_name,customer.last_name,artist.name,sum(invoice_line.unit_price * invoice_line.quantity) from customer
join invoice on customer.customer_id=invoice.customer_id
join invoice_line on invoice.invoice_id=invoice_line.invoice_id
join track on invoice_line.track_id=track.track_id
join album2 on track.album_id=album2.album_id
join artist on album2.artist_id=artist.artist_id
group by 1,2,3,4
order by 5 desc
;