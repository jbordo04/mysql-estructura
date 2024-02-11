-- DROP DATABASE --
drop DATABASE if exists pizzeria;

-- CREATE and USE this DATABASE --
create DATABASE pizzeria;
use `pizzeria`;

-- Eliminar tablas --
drop TABLE if EXISTS customer;
drop TABLE if EXISTS typeOrder;
drop TABLE if EXISTS commands;
drop TABLE if EXISTS products;
drop TABLE if EXISTS category;
drop TABLE if EXISTS store;
drop TABLE if EXISTS employees;
drop TABLE if EXISTS typeEmployees;
drop TABLE if EXISTS delivers;

-- Crear tablas--
CREATE TABLE customer (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name text NOT NULL,
  surname varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  CP integer NOT NULL,
  city varchar(255) NOT NULL,
  province varchar(255) NOT NULL,
  telephone text NOT NULL
);

CREATE TABLE typeOrder (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  image text NOT NULL,
  price decimal(5,2) NOT NULL
);

CREATE table store (
  id integer primary key AUTO_INCREMENT,
  address text not null,
  CP integer not null,
  city varchar(255) not null,
  province varchar(255) not null  
);

CREATE TABLE typeEmployees (
  id integer PRIMARY KEY,
  name varchar(255) not null
);

CREATE TABLE employees (
  id integer primary key AUTO_INCREMENT,
  name text not null,
  surname varchar(255) not null,
  NIF varchar(255) not null,
  telephone text not null,
  idStore integer not null,
  idTypeEmployee integer not null,
  foreign key (idStore) references store(id),
  foreign key (idTypeEmployee) references typeEmployees(id)
);

CREATE TABLE commands (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idEmployee integer not null,
  idCustomer integer NOT NULL,
  date datetime NOT NULL,
  idTypeOrder integer NOT NULL,
  quantity integer NOT NULL,
  idProducts integer not null,
  price decimal(5,2) NOT NULL,
  idStore integer not NULL,
  foreign key (idEmployee) references employees (id),
  foreign key (idCustomer) references customer (id),
  foreign key (idTypeOrder) references typeOrder (id),  
  foreign key (idProducts) references products (id),
  foreign key (idStore) references store (id)
);

CREATE TABLE category (
  id integer primary key AUTO_INCREMENT, 
  name text
);

CREATE TABLE pizza (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idProduct integer not null, 
  idCategory integer, 
  foreign key (idProduct) references products(id),  
  foreign key (idCategory) references category(id)
);

CREATE table delivers (
  id integer primary key AUTO_INCREMENT,
  idEmployee integer not null,
  date date,
  foreign key (idEmployee) references employees(id)
);

-- INSERT DATA TO MOCK DB --
INSERT INTO customer (name, surname,  address,  CP, city, province, telephone) values 
('Joan', 'bordonaba', 'boreal 6 1-1', 08930, 'barcelona', 'barcelona', '6805666146'),
('Rober', 'Mercedes', 'marco 56 5-1', 08015, 'vilanova', 'barcelona', '456456456'),
('Maria', 'atras', 'av. borrel 4 4-1', 08940, 'elprat', 'barcelona', '2345345'),
('Helena', 'martinez', 'c. roma 113 2-1', 08015, 'cornella', 'barcelona', '3453456'),
('Marc', 'garcia', 'venecia 763 3-1', 08020, 'barcelona', 'barcelona', '67867867'),
('Oliver', 'rodriguez', 'c. vialnova 88 1-1', 08930, 'st. Adria del Besos', 'barcelona', '634345'),
('Juliana', 'mala', 'bac de roda 69 7-1', 08002, 'hospitalet', 'barcelona', '63423423'),
('Octavi', 'hernandez', 'av. mistral 445 8-1', 08030, 'barcelona', 'barcelona', '68056621347');

INSERT INTO typeOrder (name) values 
('Delivery'), 
('Takeaway');

INSERT INTO products (name, description, image, price) values 
('drink', 'refresco que sirve para saciar la sed con diferentes sabores', 'www.url.com/img1.jpg', 4.5),
('pizza', 'Bread with some ingredients that make a magic savour', 'www.url.com/img2.jpg', 8.5),
('hamburguer', 'Piece of best breed', 'www.url.com/img3.jpg', 5.5);

INSERT INTO store (address, CP, city, province) VALUES 
('146 borrell St', 08015, 'Barcelona', 'Barcelona'),
('146 Roma Av.', 08040, 'Barcelona', 'Barcelona'),
('16 MArai del Mar St', 08073, 'Hospitalet', 'Barcelona'),
('16 lluca St', 08085, 'Hospitalet', 'Barcelona'),
('16 Catalunya pl.', 08643, 'Terrasa', 'Barcelona'),
('16 ramon Av.', 08647, 'Terrasa', 'Barcelona');

INSERT INTO typeEmployees (id, name) VALUES 
(1, 'Delivering'),
(2, 'Cooking');

INSERT INTO employees (name, surname, NIF, telephone, idStore, idTypeEmployee) VALUES 
('Guillermo', 'Rodriguez', '4645678A', '680213452', 3, 1),
('Sara', 'Amparo', '47654321B', '62345355', 1, 2),
('Albert', 'Jimenez', '48765432C', '69345734', 2, 1),
('veronica', 'Mondaz', '4645678A', '680213452', 1, 2),
('Ramon', 'Ampweraro', '47654321B', '62345355', 2, 2),
('Lucia', 'Echevarria', '48765432C', '69345734', 3, 1);

INSERT INTO commands (idEmployee, idCustomer, date, idTypeOrder, quantity, idProducts, price, idStore) values
(1,1, '2023-11-11 20:32:54', 2,1,1, 30.5, 1),
(1,1, '2023-11-11 20:32:54', 2,1,3, 30.5, 1),
(2,3, '2023-01-11 10:32:54', 2,1,1, 40.5, 3),
(2,3, '2023-01-11 10:32:54', 2,1,3, 20.5, 3),
(3,4, '2023-08-11 20:32:54', 2,3,1, 30.5, 1),
(4,6, '2023-12-11 23:32:54', 2,2,2, 10.5, 5),
(5,7, '2023-11-11 20:32:54', 2,1,2, 30.5, 2),
(3,5, '2023-01-11 22:32:54', 2,1,1, 30.5, 2),
(3,5, '2023-01-11 22:32:54', 2,1,2, 30.5, 5),
(1,2, '2023-08-11 20:32:54', 2,3,1, 30.5, 1),
(2,1, '2023-11-11 20:32:54', 2,1,1, 30.5, 4),
(4,1, '2023-11-11 20:32:54', 2,1,3, 20.5, 4),
(6,3, '2023-01-11 10:32:54', 2,1,1, 50.5, 1),
(6,3, '2023-01-11 10:32:54', 2,1,3, 30.5, 3),
(5,4, '2023-08-11 20:32:54', 2,3,1, 20.5, 1),
(1,6, '2023-12-11 23:32:54', 2,2,2, 10.5, 6),
(2,7, '2023-11-11 20:32:54', 2,1,2, 40.5, 6),
(3,5, '2023-01-11 22:32:54', 2,1,1, 25.5, 1),
(3,5, '2023-01-11 22:32:54', 2,1,2, 15.5, 3),
(4,2, '2023-08-11 20:32:54', 2,3,1, 29.5, 5);

INSERT INTO category (name) VALUES 
('Chesse'),
('Fruits'),
('Offs');

INSERT INTO pizza (idProduct, idCategory) VALUES 
(2, 1),
(2, 2),
(2, 3),
(2, 2);

-- FEW QUERIES --

-- TOTAL QUANTITY SOLD IN A LOCALITY --
SELECT c.* FROM commands c
INNER JOIN store s ON c.idStore = s.id
where c.idProducts = 1 AND s.city = 'Barcelona';

SELECT COUNT(*) as 'Drinks Sold', s.city FROM commands c
INNER JOIN store s ON c.idStore = s.id
where c.idProducts = 1 AND s.city = 'Barcelona';

-- TOTAL SELLERS MADE BY AN EMPLOYEE --

SELECT c.* FROM commands c
where c.idEmployee = 1;

SELECT COUNT(DISTINCT( c.date)) as 'Commandas realizadas', CONCAT(e.name, ' ',e.surname) as Empployee FROM commands c
INNER JOIN employees e ON e.id = c.idEmployee
where c.idEmployee = 1;


