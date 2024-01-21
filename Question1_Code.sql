create database ecommerce;

use ecommerce;

show tables;

create table supplier(SUPP_ID INT primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL
);

create table customer(CUS_ID INT primary key,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY VARCHAR(30) NOT NULL,
CUS_GENDER CHAR
);

create table category(CAT_ID INT primary key,
CAT_NAME VARCHAR(20) NOT NULL);

create table product(PRO_ID INT primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT ,
foreign key (CAT_ID) references category(CAT_ID)
);

create table supplier_pricing(PRICING_ID INT Primary key,
PRO_ID INT, 
SUPP_ID INT, 
SUPP_PRICE INT DEFAULT 0,
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier(SUPP_ID)
);

desc order1;
select*from order1;
create table order1(ORD_ID INT Primary key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT, 
PRICING_ID INT, 
foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)

);

create table rating(RAT_ID INT primary key,
ORD_ID INT , 
RAT_RATSTARS INT NOT NULL,
foreign key(ORD_ID) references order1(ORD_ID)
);


insert into supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values
   ( 1, 'Rajesh Retails', 'Delhi', '1234567890'),
	(2, 'Appario Ltd.',' Mumbai',' 2589631470'),
   (3 ,'Knome products',' Banglore',' 9785462315'),
	(4,' Bansal Retails',' Kochi',' 8975463285'),
	(5,' Mittal Ltd.',' Lucknow ','7898456532');
    
insert into customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values
	(1, 'AAKASH','9999999999','DELHI', 'M'),
(2,' AMAN','9785463215',' NOIDA', 'M'),
(3,' NEHA','9999999999',' MUMBAI', 'F'),
(4, 'MEGHA','9994562399',' KOLKATA' ,'F'),
(5, 'PULKIT','7895999999',' LUCKNOW', 'M');
desc customer;

select count(*) from customer where CUS_GENDER='F';


insert into category(CAT_ID,CAT_NAME) values
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4,'ELECTRONICS'),
(5, 'CLOTHES');

insert into product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values
(1 ,'GTA V',' Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT',' SIZE-L with Black, Blue and White variations', 5),
(3,'ROG LAPTOP',' Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4,'OATS','Highly Nutritious from Nestle',3),
(5,'HARRY POTTER',' Best Collection of all time by J.K Rowling', 1),
(6,'MILK','1L Toned MIlk' ,3),
(7,'Boat Earphones',' 1.5Meter long Dolby Atmos' ,4),
(8 ,'Jeans','Stretchable Denim Jeans with various sizes and color', 5),
(9,'Project IGI',' compatible with windows 7 and above' ,2),
(10,'Hoodie','Black GUCCI for 13 yrs and above' ,5),
(11,'Rich Dad Poor Dad',' Written by RObert Kiyosaki', 1),
(12,'Train Your Brain','By Shireen Stephen',1);

insert into supplier_pricing(PRICING_ID,PRO_ID ,SUPP_ID ,SUPP_PRICE) values
(1 ,1 ,2, 1500),
(2 ,3, 5, 30000),
(3 ,5, 1 ,3000),
(4 ,2, 3, 2500),
(5 ,4, 1, 1000),
(6, 12 ,2, 780),
(7 ,12, 4 ,789),
(8 ,3 ,1, 31000),
(9 ,1 ,5 ,1450),
(10 ,4 ,2 ,999),
(11 ,7, 3, 549),
(12 ,7, 4 ,529),
(13 ,6, 2 ,105),
(14 ,6, 1 ,99),
(15 ,2 ,5, 2999),
(16 ,5 ,2,2999);

insert into order1(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values 
(101 ,1500, '2021-10-06', 2, 1),
(102 ,1000 ,'2021-10-12', 3 ,5),
(103, 30000 ,'2021-09-16' ,5 ,2),
(104 ,1500 ,'2021-10-05', 1, 1),
(105 ,3000,'2021-08-16', 4, 3),
(106, 1450, '2021-08-18' ,1, 9),
(107, 789 ,'2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-01-10', 5, 3),
(110, 2500,'2021-09-10', 2, 4),
(111, 1000,'2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000,'2021-09-16', 1, 8),
(114, 1000,'2021-09-16', 3, 5),
(115 ,3000, '2021-09-16',5 ,3),
(116 ,99 ,'2021-09-17', 2, 14);

insert into rating(RAT_ID,ORD_ID,RAT_RATSTARS) values 
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6 ,106 ,3),
(7, 107, 4),
(8 ,108, 4),
(9 ,109, 3),
(10, 110, 5),
(11 ,111, 3),
(12 ,112, 4),
(13, 113, 2),
(14 ,114, 1),
(15 ,115 ,1),
(16 ,116, 0);

/*3.Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.*/
select CUS_GENDER,count(distinct customer.CUS_ID) as total_customers from customer join order1 on customer.CUS_ID=order1.CUS_ID where ORD_AMOUNT>=3000 group by CUS_GENDER;


select customer.* ,order1.ORD_AMOUNT from customer inner join order1  on customer.CUS_ID=order1.CUS_ID where ORD_AMOUNT>=3000 and CUS_GENDER='F';

/*4) Display all the orders along with product name ordered by a customer having Customer_Id=2*/
select order1.ORD_ID,product.PRO_NAME,order1.ORD_AMOUNT from order1 join supplier_pricing on order1.PRICING_ID=supplier_pricing.PRICING_ID join product on supplier_pricing.PRO_ID=product.PRO_ID where order1.CUS_ID=2;


/*5) Display the Supplier details who can supply more than one product*/
select supplier.* from supplier join supplier_pricing on supplier.SUPP_ID=supplier_pricing.SUPP_ID group by supplier.SUPP_ID having count(distinct supplier_pricing.PRO_ID)>1;

/*6) Create a view as lowest_expensive_product and display the least expensive product from each category and print the table
with category id, name, product name and price of the product.
*/
create or replace view lowestexp_product as select category.CAT_ID, category.CAT_NAME, MIN(product.PRO_NAME) as product_name, MIN(supplier_pricing.SUPP_PRICE) as min_price from category join product on category.CAT_ID = product.CAT_ID join supplier_pricing on product.PRO_ID = supplier_pricing.PRO_ID group by category.CAT_ID order by category.CAT_ID;

select*from lowestexp_product;

/*7) Display the Id and Name of the Product ordered after “2021-10-05”.*/
select distinct product.pro_id, product.pro_name from product join supplier_pricing on product.pro_id = supplier_pricing.pro_id join order1 on supplier_pricing.pricing_id = order1.pricing_id where order1.ord_date > '2021-10-05';

/*8)Display customer name and gender whose names start or end with character 'A'*/
select customer.CUS_NAME,CUS_GENDER from customer where CUS_NAME  like '%A%';

