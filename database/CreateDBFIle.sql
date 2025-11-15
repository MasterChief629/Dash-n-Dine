/* Dash n' Dine database creation file */

CREATE DATABASE dashndine;
USE dashndine;

CREATE TABLE restaurants (
	restID INT unsigned,
    restName VARCHAR(32),
    restHours VARCHAR(64),
    primary key (restID)
);

CREATE TABLE menus (
	menuID INT unsigned,
    restID INT unsigned,
    foodIDlist TEXT,
    menuType ENUM ('Breakfast', 'Lunch', 'Dinner', 'All Day') DEFAULT 'All Day',
    primary key (menuID),
    foreign key (restID) references restaurants (restID)
);

CREATE TABLE food (
	foodID INT unsigned,
    menuID INT unsigned,
    foodName VARCHAR(32),
    amount INT unsigned,
    price DECIMAL(5, 2),
    foodDescription TEXT,
    imagePath VARCHAR(255),
    customization TEXT,
    primary key (foodID),
    foreign key (menuID) references menus (menuID)
);

CREATE TABLE users (
	userID INT unsigned,
    realName VARCHAR(32),
    username VARCHAR(32),
    pw VARCHAR(64),
    perms ENUM ('User', 'Employee', 'Admin') DEFAULT 'User',
    primary key (userID)
);

CREATE TABLE orders (
	orderID INT unsigned,
    userID INT unsigned,
    foodID INT unsigned,
    restID INT unsigned,
    orderTime DATETIME,
    totalPrice DECIMAL(6, 2),
    orderStatus ENUM ('Processing', 'Order Recieved', 'Preparing', 'Cooking', 'Delivering', 'Ready') DEFAULT 'Processing',
    primary key (orderID),
    foreign key (userID) references users (userID),
    foreign key (foodID) references food (foodID),
    foreign key (restID) references restaurants (restID)
);
