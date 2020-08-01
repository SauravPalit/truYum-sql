use truYum
go

insert into menu_Items values
	('1','Sandwich','99.00','Yes','2017-10-15','Main Course','Yes'),
	('2','Burger','129.00','NO','2017-12-23','Main Course','NO'),
	('3','Pizza','149.00','Yes','2017-07-21','Main Course','NO'),
	('4','French Fries','57.00','NO','2017-01-02','Starters','Yes'),
	('5','Chocolate Brownie','32.00','Yes','2022-06-02','Dessert','Yes')
go

--Frame SQL query to get all menu items
select * from menu_Items
go
--Frame SQL query to get all menu items which after launch date and is active.
select * from menu_Items where item_launch_date<=GETDATE() and item_availability='YES'
go
--Frame SQL query to get a menu items based on Menu Item Id
select * from menu_Items where item_id=2
--Frame update SQL menu_items table to update all the columns values based on Menu Item Id
update menu_Items set
item_name='Kebab',item_price='75',item_availability='Yes',item_launch_date=GETDATE(),item_category='Starters',item_delivery='NO'
where item_id=4
go
--Insert scripts for adding data into user and cart tables.In user table create two users. Once user will not have any entries in cart, while the other will have at least 3 items in the cart.
insert into truYumUser values
	('1','Saurav'),
	('2','Gaurav'),
	('3','Pushpak'),
	('4','Raunak')
go
insert into cart_Item values
	('1','1','1'),
	('2','1','2'),
	('3','1','3'),
	('4','1','4'),
	('5','2','5'),
	('6','2','1')
go
--SQL query to get all menu items in a particular user’s cart
select m.item_name, m.item_availability,m.item_price,m.item_category,u.user_name,c.users_id
from menu_Items m inner join cart_Item c
on c.item_id=m.item_id 
inner join truYumUser u on 
u.user_Id=c.users_id
where c.users_id='2'
go
--SQL query to get the total price of all menu items in a particular user’s cart
select sum(m.item_price) as Total_price,u.user_Id,u.user_name
from menu_Items m inner join cart_Item c
on c.item_id=m.item_id 
inner join truYumUser u on 
u.user_Id=c.users_id
where u.user_Id=2
group by u.user_Id,u.user_name
go
--SQL query to remove a menu items from Cart based on User Id and Menu Item Id
delete cart_Item where users_id=2 and item_id=2
go