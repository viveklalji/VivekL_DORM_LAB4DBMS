create database ecommerce;
use ecommerce;

create table if not exists supplier(
supp_id int unsigned primary key,
supp_name varchar(50) not null,
supp_city varchar(50) not null,
supp_phone varchar(50) not null
);

create table if not exists customer(
cus_id int unsigned primary key,
cus_name varchar(50) not null,
cus_phone varchar(12) not null,
cus_city varchar(50) not null,
cus_gender enum('M', 'F') not null ,
cus_email varchar(50) not null unique
);

create table if not exists category(
cat_id int unsigned primary key,
cat_name varchar(50) not null,
parent_cat_id int unsigned,
foreign key(parent_cat_id) references category(cat_id)
);

create table if not exists product(
pro_id int unsigned primary key,
pro_name varchar(50) not null default "dummy",
por_desc varchar(50) not null,
cat_id int unsigned not null,
foreign key (cat_id) references category(cat_id)
);

create table if not exists supplier_pricing(
pricing_id int unsigned primary key,
pro_id int unsigned,
supp_id int unsigned,
supp_price int default 0,
foreign key (pro_id) references product(pro_id),
foreign key(supp_id) references supplier(supp_id)
);



create table if not exists `order`(
order_id int unsigned primary key,
amount int unsigned not null,
ord_date date not null,
cus_id int unsigned,
pricing_id int unsigned,
foreign key (cus_id) references customer(cus_id),
foreign key(pricing_id) references supplier_pricing(pricing_id)
);

create table if not exists rating(
rating_id int unsigned primary key,
order_id int unsigned,
rat_ratstars int unsigned not null,
foreign key (order_id) references `order`(order_id)
);


INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M','aakash@gmail.com');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M', 'aman@gmail.com');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F', 'neha@gmail.com');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F', 'megha@gmail.com');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M', 'pulkit@gmail.com');

INSERT INTO category VALUES( 1,"BOOKS", 1);
INSERT INTO category VALUES(2,"GAMES", 2);
INSERT INTO category VALUES(3,"GROCERIES", 3);
INSERT INTO category VALUES (4,"ELECTRONICS", 4);
INSERT INTO category VALUES(5,"CLOTHES", 5);

INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen i7 processor 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with varioussizesandcolor",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


select * from supplier;
select * from customer;
select * from category;
select * from product;
select * from supplier_pricing;
select * from `order`;
select * from rating;


-- querry 1 , question 3 --
-- question :	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. --

-- solution --

select  c.cus_gender as Customer_Gender, count(*) as Order_Count, sum(o.amount) as Order_amount from customer 
as c inner join `order` as o on o.cus_id = c.cus_id where amount >= 3000 group by c.cus_gender;

--  querry 2 , question 4 --
-- question : 	Display all the orders along with product name ordered by a customer having Customer_Id=2 --

-- solution --

select  `order`.* ,product.pro_name from product, supplier_pricing, `order`
 where `order`.pricing_id = supplier_pricing.pricing_id and supplier_pricing.pro_id = product.pro_id and `order`.cus_id = 2;
 
 
-- querry 3 , question 5 --
-- question : 	Display the Supplier details who can supply more than one product --

-- solution --

 select supplier.* from supplier where supplier.supp_id in
(select supp_id from supplier_pricing group by supp_id having count(supp_id)>1) group by supplier.supp_id;

-- querry 4 , question 6--
-- question : Find the least expensive product from each category and print the table  --
             --  with category id, name, product name and price of the product --

-- solution --

select category.cat_id as category_id, category.cat_name as category_name, product.pro_name as product_name, 
 min(supplier_pricing.supp_price) as price_of_product
from  supplier_pricing  left join product on supplier_pricing.pro_id = product.pro_id
left join category on product.cat_id = category.cat_id group by  category.cat_id order by category.cat_id asc ; 

-- query 5, question 7 --
-- question : 	Display the Id and Name of the Product ordered after “2021-10-05” --

-- solution --

select product.pro_id as product_id, product.pro_name as product_name, `order`.ord_date as order_date
from product, `order`, supplier_pricing
where supplier_pricing.pro_id = product.pro_id and `order`.pricing_id = supplier_pricing.pricing_id
and `order`.ord_date >'2021-10-05';

-- querry 6 , question 8 --
-- question : Display customer name and gender whose names start or end with character 'A' --

-- solution --

select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- query 7 , question 9 --
-- question : 	Create a stored procedure to display supplier id, name, rating and Type_of_Service -- 
               -- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, --
               -- If rating >2 print “Average Service” else print “Poor Service” --
 
-- solution --

-- creating the stored procedure--

DELIMITER &&
create procedure TypeOfServiceForSupplier()
BEGIN
select supplier.supp_id as supplier_id, supplier.supp_name as supplier_name, avg(rating.rat_ratstars) as average_rating,
case
when avg(rating.rat_ratstars) = 5 then 'EXCELLENT SERVICE'
when avg(rating.rat_ratstars) > 4 then 'GOOD SERVICE'
when avg(rating.rat_ratstars) > 2 then 'AVERAGE SERVICE'
else 'POOR SERVICE'
end as Type_Of_Service
from supplier, rating, supplier_pricing, `order`
where rating.order_id = `order`.order_id and `order`.pricing_id = supplier_pricing.pricing_id
and supplier_pricing.supp_id = supplier.supp_id
group by supplier.supp_id
order by supplier.supp_id asc;
END&&
DELIMITER ;


-- CALLING THE STORED PROCEDURE --
  
  call TypeOfServiceForSupplier();
  
  
  
