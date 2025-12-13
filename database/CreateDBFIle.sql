/* Dash n' Dine database creation file */

CREATE DATABASE dashndine;
USE dashndine;

CREATE TABLE restaurants (
	restID INT,
    restName VARCHAR(32),
    restHours VARCHAR(64),
    primary key (restID)
);

CREATE TABLE menus (
	menuID INT,
    restID INT,
    foodIDlist TEXT,
    menuType ENUM ('Breakfast', 'Lunch', 'Dinner', 'All Day') DEFAULT 'All Day',
    primary key (menuID),
    foreign key (restID) references restaurants (restID)
);

CREATE TABLE food (
	foodID INT,
    menuID INT,
    foodName VARCHAR(32),
    amount INT,
    price DECIMAL(5, 2),
    foodDescription TEXT,
    imagePath VARCHAR(255),
    customization TEXT,
    primary key (foodID),
    foreign key (menuID) references menus (menuID)
);

CREATE TABLE users (
	userID INT,
    userEmail VARCHAR(32),
    realName VARCHAR(32),
    username VARCHAR(32),
    pw VARCHAR(64),
    perms ENUM ('User', 'Employee', 'Admin') DEFAULT 'User',
    primary key (userID)
);

CREATE TABLE orders (
	orderID INT,
    userID INT,
    foodID INT,
    restID INT,
    orderTime DATETIME,
    totalPrice DECIMAL(6, 2),
    orderStatus ENUM ('Processing', 'Order Recieved', 'Preparing', 'Cooking', 'Delivering', 'Ready') DEFAULT 'Processing',
    primary key (orderID),
    foreign key (userID) references users (userID),
    foreign key (foodID) references food (foodID),
    foreign key (restID) references restaurants (restID)
);
