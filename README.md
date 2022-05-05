# ued-code-submissions-cake-order-shopping-online
ued-code-submissions-cake-order-shopping-online created by GitHub Classroom
-------------------------------------------------------
User Experience Design Report On - "Cake Order Shopping Online"

Developed By: -
Prajapati Yash P. (20162121023)
Guided By: -
Prof. Bhavesh Jain (Internal)

Abstract: -
Buy a Cake is a portal which allows admin in developing counters to advertise and sell their cake. This would permit rural communities to make their wares available to the rest of the world. The objective of this project is to create a portal which would allow product information to be updated securely using a mobile device and will allow users to buy cake from the admin. The main concern is given to the village women to explore their talents and to enhance our traditional Indian culture. Cake Order Shopping Online – Web App. In future the internet become whole and soul to the business fields, each and every trade are going to be done through it so this portal may helpful to the women as a business person in this running world.

Hardware & Software Characteristics: -
Minimum Hardware Requirements: -
• Laptop/Desktop
• Processor – 1 Gigahertz (GHz) or above
• RAM – 1 GB or above
• Free Disk Space – 30GB or above
• Internet Connection
Recommended Software Requirements: -
• Eclipse IDE 2021-12 4.0 or higher
• Apace Tomcat Server v10.0 or higher
• JDK 12.0 or higher
• JavaSE-14 or higher
• MySQL Server 8.0 or higher
• Appropriate JAR files
• Bootstrap 4
• MD Bootstrap

Database Queries: -
/*Creating Table Query - User*/
CREATE TABLE user(userId INT PRIMARY KEY AUTO_INCREAMENT,userName VARCHAR(100),userPhone VARCHAR(100),userAddress VARCHAR(100),userEmail VARCHAR(100),userPassword VARCHAR(100),userPic VARCHAR(100));

/*Creating Table Query - Category*/
CREATE TABLE category(cId int primary key AUTO_INCREAMENT,cTitle varchar(50) unique key,cDescription varchar(255),cPic varchar(50));

/*Creating Table Query - Product*/
CREATE TABLE product(pId int primary key AUTO_INCREAMENT,pTitle varchar(50) unique key,pDescription varchar(255),pPic varchar(50),pPrice bigint,pDiscount bigint,pQuantity bigint,cId int, foreign key (cId) references category(cId));

/*Inserting Records Query - User*/
INSERT INTO `user` (`userName`, `userPhone`, `userAddress`, `userEmail`, `userPassword`) VALUES (?,?,?,?,?);

/*Inserting Records Query - Category*/
INSERT INTO `category` (`cTitle`, `cDescription`, `cPic`) VALUES (?,?,?);

/*Inserting Records Query - Product*/
INSERT INTO `myproject`.`product` (`pTitle`, `pDescription`, `pPic`, `pPrice`, `pDiscount`, `pQuantity`, `cId`) VALUES (?,?,?,?,?,?,?);
