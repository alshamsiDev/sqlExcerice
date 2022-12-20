#DDL
create database store;

create table countries(
    code int primary key ,
    name varchar(20) unique,
    continent_name varchar(20) not null
);


create table users (
    id int primary key,
    full_name varchar(20),
    email varchar(20) unique ,
    gender CHAR ,
    date_of_birth varchar(15),
    created_at Date default sysdate,
    country_code int,
    foreign key (country_code) REFERENCES countries(code)
);

create table orders(
    id int primary key ,
    user_id int ,
    status varchar(6) ,
    created_at Date,
    foreign key (user_id) references users(id)
);

create table products(
    id int primary key ,
    name varchar(10) not null ,
    price int default 0,
    status varchar(10) ,
    created_at date default sysdate
);
create table order_products(
    order_id int ,
    product_id int ,
    quantity int default 0,
    primary key (order_id,product_id),
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);




insert into countries value (111, 'Am Algmagm', '3* berrh');
select * from countries;

insert into users value (12,'Ali','gmail','m','2020','20101231',111);
select * from users;

insert into orders value (1,12,'start','2010-12-31 01:15:00');
select * from orders;

insert into products values (3,'phone',2000,'valid',default);
select * from products;

update products set  price = 1000 where id=3;
delete from products where id=3;


drop table order_products;
drop table products;
drop table orders;
drop table users;
drop table countries;
