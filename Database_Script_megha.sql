/* Creating Database */
create database Live_DA_Project;     
use Live_DA_Project; 

/* Creating Table_1 for Business_info */
CREATE TABLE `Table_One` (
	`Business_id` VARCHAR(20) NOT NULL, 
	`Business_Name` VARCHAR(150) NOT NULL, 
	`Contact_person` VARCHAR(100), 
	`Local_Address` VARCHAR(90), 
	`City` VARCHAR(20) NOT NULL, 
	`Pincode` VARCHAR(7) NOT NULL, 
	`State` VARCHAR(20) NOT NULL, 
	`GST_Number` VARCHAR(200) NULL,
    Primary key(Business_id)
);

/* Load data into table_one */

SELECT * FROM table_one;

/* Creating Table_2 for Meeting_details */
CREATE TABLE `Table_Two` (
	`Business_id` VARCHAR(20) NOT NULL, 
	`Telecaller_name` VARCHAR(20) NOT NULL, 
	`BDM_name` VARCHAR(20) NOT NULL, 
	`Calling_Date` VARCHAR(20) NOT NULL, 
	`Meeting_Date` VARCHAR(25) NOT NULL, 
	`Meeting_Time` VARCHAR(15) NOT NULL, 
	`Meeting_Status` VARCHAR(20) NOT NULL,
    Foreign key (Business_id) references Table_One (Business_id)
);

/*Converting Calling_date, Meeting_Date column in proper date format & Converting the data type into date format */ 
UPDATE table_two SET Calling_Date = str_to_date (Calling_Date, '%d-%m-%Y');
ALTER TABLE table_two MODIFY COLUMN `Calling_Date` DATE NOT NULL;

UPDATE table_two SET Meeting_Date = str_to_date (Meeting_Date,'%d-%m-%Y' );
ALTER TABLE table_two MODIFY COLUMN `Meeting_Date` DATE NOT NULL;

/* Converting the data type into time format */ 
ALTER TABLE table_two MODIFY COLUMN `Meeting_Time` TIME NOT NULL;

SELECT * FROM table_two;

/* Creating Table_3 for Business_category */
CREATE TABLE `Table_Three` (
	`Business_id` VARCHAR(20) NOT NULL, 
	`Business_Category` VARCHAR(150) NOT NULL, 
	`Map` VARCHAR(20) NOT NULL, 
	`Product_proposal` VARCHAR(100) NOT NULL,
    Foreign key (Business_id) references Table_One (Business_id)
);

SELECT * FROM table_three;

/* Creating Table_4 for Business_sales */
CREATE TABLE `Table_Four`  (
	`Business_id` VARCHAR(13) NOT NULL, 
	`Login_Date` Varchar(20), 
	`Sales_Amount` DECIMAL(38, 2) NOT NULL, 
	`Advanced_Amount` DECIMAL(38, 2) NOT NULL, 
	`GST_Amount` DECIMAL(38, 2) NOT NULL, 
	`Payment_mode` VARCHAR(20) NOT NULL,
    Foreign key (Business_id) references Table_One (Business_id)
);

/*Converting Login_date column in proper date format & Converting the data type into date format */ 
UPDATE table_four SET Login_Date = str_to_date (Login_Date, '%d-%m-%Y');
Alter table table_four Modify column `Login_Date` Date not null;

/* Creating New column Profit In table_Four */
alter table table_Four add column Profit decimal(38,2);
update table_Four set Profit =0.3 * Sales_Amount;

/* Creating New column Expense In table_Four */
alter table table_Four add column Expense decimal(38,2);
update table_Four set Expense =0.7* Sales_Amount;

SELECT * FROM table_Four;
