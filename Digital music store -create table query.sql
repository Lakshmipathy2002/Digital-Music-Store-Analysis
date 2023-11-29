create database digital_music_store;
show databases;
use digital_music_store;
show tables;
describe employee;
describe customer;
describe invoice;
describe invoice_line;
describe track;
describe media_type;
describe genre;
describe album;
describe artist;
describe playlist_track;
describe playlist;

#EMPLOYEE TABLE
create table employee(
employee_id int,
last_name varchar(50),
first_name varchar(50),
title varchar(50),
reports_to varchar(50),
levels varchar(50),
birthdate date,
hiredate date,
address varchar(50),
city varchar(50),
state varchar(50),
country varchar(50),
postal_code varchar(50),
phone varchar(50),
fax varchar(50),
email varchar(50),primary key(employee_id,reports_to)
);

#CUSTOMER table
create table customer(
customer_id int primary key,
first_name varchar(50),
last_name varchar(50),
company varchar(30),
address varchar(50),
city varchar(30),
state varchar(30),
country varchar(30),
postal_code varchar(50),
phone varchar(50),
fax varchar(30),
email varchar(50),
support_rep_id int,foreign key(support_rep_id) references employee(employee_id)
);

#INVOICE TABLE
create table invoice(
invoice_id int primary key,
customer_id int,foreign key(customer_id) references customer(customer_id),
invoice_date date,
billing_address varchar(50),
billing_city varchar(30),
billing_state varchar(20),
billing_country varchar(20),
billing_postal_code varchar(50),
total float
);

#TRACK TABLE
create table track(
track_id int primary key,
name varchar(50),
album_id int,foreign key(album_id) references album(album_id),
media_type_id int,foreign key(media_type_id) references media_type(media_type_id),
genre_id int,foreign key(genre_id) references genre(genre_id),
composer varchar(50),
milli_seconds int,
bytes int,
unit_price float
);

#INVOICE_LINE TABLE
create table invoice_line(
invoice_line_id int primary key,
invoice_id int,foreign key(invoice_id) references invoice(invoice_id),
track_id int,foreign key(track_id) references track(track_id),
unit_price float,
quantity int
);



#MEDIA_TYPE TABLE
create table media_type(
media_type_id int primary key,
name varchar(30)
);

#GENRE TABLE
create table genre(
genre_id int primary key,
name varchar(30)
);

#ALBUM TABLE
create table album(
album_id int primary key,
title varchar(50),
artist_id int,foreign key(artist_id)references artist(artist_id)
);

#ARTIST TABLE
create table artist(
artist_id int primary key,
name varchar(30)
);

#PLAYLIST_TRACK TABLE
create table playlist_track(
playlist_id int primary key,
track_id int,foreign key(track_id) references track(track_id)
);

#PLAYLIST TABLE
create table playlist(
playlist_id int primary key,foreign key(playlist_id)references playlist_track(playlist_id),
name varchar(30)
);
