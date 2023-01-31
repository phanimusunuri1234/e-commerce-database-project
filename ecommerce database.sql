create database ecommerce;
use ecommerce;
drop table products;
show tables;
create table customer(
customer_id int primary key ,
customer_firstname varchar(255) not null,
customer_lastname varchar(255) not null,
age int,
gender varchar(11),
address varchar(255) not null,
city varchar(15),
contactno varchar(50),
email_id varchar(255)
);
create table products(
product_id int primary key ,
product_name varchar(255) NOT NULL,
category varchar(100),
available_sizes varchar(155),
colour varchar(155),
price varchar(255) Not null,
quantity_available int
);
alter table products modify column price decimal;
show tables;
create table orders(
order_id int primary key,
product_id int,
customer_id int,
price int,
discount float,
total_amount int,
size varchar(50),
quantity_ordered int,
colour varchar(50),
modeofpayment varchar(20),
paymentstatus varchar(20),
bill_date date,
ship_date date,
delivery_status varchar(100)
);
show tables;
insert into products
(product_id,product_name,category,available_sizes,colour,price,quantity_available)
values
(1,"denim-jacket","fashion","s m l","blue,red,black",500,50),
(2,"rain_jacket","fashion"," m l xl","red,green,yellow",300,30),
(3,"hoodie","fashion","s m l","black,white,green",450,40),
(4,"trousers","fashion","_","black,blue",800,50),
(5,"saree","fashion","_","blue",1300,30),
(6,"t-shirt","fashion","s m l","brown,violet",250,40),
(7,"iphone","mobiles","pro,mini","white",150000,20),
(8,"nokia","mobiles","_","blue",3000,60),
(9,"rc car","toys","_","red",1150,100),
(10,"pressure-cooker","utilities","_","_",950,25),
(11,"tp_link-wifi","electronic_gadegets","_","_",3599,100),
(12,"samsung-television","electronics","22,32,40","black",21999,89),
(13,"tcl-television","electronics","22,32,45,50","black",25999,35),
(14,"samsung_6.5kg_washingmachine","home_appliances","6.5","white",14590,72),
(15,"boat-earpods","electronic_gadgets","_","black,white",5999,35),
(16,"noise-smartwatch","electronic_gadgets","_","blue,black,white",3999,15),
(17,"dove_hairfall_shampoo","fresh","_","_",849,100),
(18,"militaryjogger_shoes","fashion"," 7,8,9,10","brown,black,white",999,15),
(19,"usha_ironbox","home_appliances","_","black,white",1999,45),
(20,"prestige_rapidmixer","home_appliances","_","white",2499,15);
select * from products;
insert into customer
(customer_id,customer_firstname,customer_lastname,age,gender,address,city,contactno,email_id)
values
(0201,"ruchitha","vollala",22,"female","41/a","tadicherla","+917780542508","vollalaruchitha@gmail.com"),
(0202,"keerthana","tiruvuru",21,"female","plotno:107,kothapet","hyderabad","+919866515009","tiruvurukeerthana@gmail.com"), 
(0203,"anusha","madella",21,"female","banjarahills","hyderabad","+91987653210","madellaanusha@gmail.com"), 
(0204,"hemanth","pusa",23,"male","2-5-301","edulabad","+919182300921","pusahemanth@gmail.com"),
(0205,"sindhu","rudra",24,"female","2-6-212,near saibabatemple","shadnagar","+919493633695","rudrasindhu@gmail.com"), 
(0206,"vyshnavi","mankala",25,"female","4-5-123/a","mahabubnagar","+919542977047","vollalaruchitha@gmail.com"), 
(0207,"satyanarayana","musunuri",55,"male","3-5-303/2","khammam","+919014734469","musunurisatyanarayana@gmail.com"), 
(0208,"anjaneyulu","putta",48,"male","plotno62,lbnagar","hyderabad","+919524872365","puttaanjaneyulu@gmail.com"),
(0209,"saikiran","sattenapalli",35,"male","plotno:102,domalguda","tirupathi","+917093027714","sattenapallisaikiran@gmail.com"),
(0210,"srinidhi","arkatala",60,"female","houseno:9,attapur","hyderabad","+918341226505","arkatalasrinidhi@gmail.com");
select * from customer;
drop table orders;
insert into orders
(order_id,product_id,customer_id,price,discount,total_amount,size,quantity_ordered ,colour,modeofpayment,paymentstatus,bill_date,ship_date,delivery_status)
values
(0101,9,0209,4750,900,3850,"_",5,"red","debitcard","completed","2022-10-21","2022-10-25","delivered"),
(0102,5,0203,5200,1450,3750,"_",4,"blue","cod","completed","2022-11-01","2022-11-15","delivered"),
(0103,11,0207,3599,0,3599,"-",1,"_","creditcard","completed","2022-11-05","2022-11-12","delivered"),
(0104,16,0204,19995,3999,15996,"_",5,"white","upi","completed","2022-12-05","2022-12-11","delivered"),
(0105,7,0201,150000,15000,135000,"pro",1,"white","debitcard","completed","2022-11-21","2022-11-25","delivered"),
(0106,7,0202,150000,15000,135000,"pro",1,"white","debitcard","completed","2022-11-14","2022-11-19","delivered");
select * from orders;
show tables;
#To display male customer list 
select * from product
where 
product.product_name="rain_jacket";
#using multiple clause To calculate no of males & age >25 using logical operators 
select * from customer
where 
customer.gender="male" and customer.age>23 order by age;
# to show both male and female
select * from customer
where 
customer.gender="male"or customer.gender="female" and customer.age>23 order by age;
# to find null values
select * from orders
where orders.size is null;
select customer_lastname, customer_id from customer
where
customer_lastname like "vol%";
# using distict
select
distinct city
from
customer;
#to segment particular coloumns
select * from orders;
select customer_id, customer_firstname,age,
case 
when age between 20 and 30 then "youth"
when age between 30 and 50 then "middle age"
else "oldage"
end 
as customer_segment
from customer;
# time related information
select
year(bill_date) as year,
month(bill_date)as month
from
orders;
# to find the information which is not available in the data
select datediff(ship_date,bill_date) as deliverytime
from orders;
# join operation
select orders.order_id,orders.product_id,orders.total_amount,orders.delivery_status,product_name
from 
orders  
join
 products on orders.product_id=products.product_id;
 select * from products;
update products set quantity_available= 20 where product_id=9;
update products set quantity_available=26, quantity_available=99, quantity_available=10, quantity_available=19 where product_id in (5, 11, 16, 7);
select orders.order_id,orders.product_id,orders.customer_id,orders.total_amount,orders.delivery_status,customer_firstname
from 
orders  
left join customer on orders.customer_id=customer.customer_id;
 ## total amount
select orders.customer_id,sum(orders.quantity_ordered*orders.total_amount) as total
from customer
join orders on customer.customer_id=orders.customer_id
group by orders.customer_id;













