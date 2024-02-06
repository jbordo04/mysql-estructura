--Eliminar tablas --
drop TABLE customer;
drop TABLE typeOrder;
drop TABLE commands;
drop TABLE products;
drop TABLE category;
drop TABLE store;
drop TABLE employees;
drop TABLE typeEmployees;
drop TABLE delivers;

--Crear tablas--
CREATE TABLE customer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name text NOT NULL,
  surname varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  CP integer NOT NULL,
  city varchar(255) NOT NULL,
  province varchar(255) NOT NULL,
  telephone integer NOT NULL
);

CREATE TABLE typeOrder (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name varchar(255) NOT NULL
);

CREATE TABLE commands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idCustomer integer NOT NULL,
  date date NOT NULL,
  idTypeOrder integer NOT NULL,
  quantity integer NOT NULL,
  idProducts integer not null,
  price integer NOT NULL,
  idStore integer not NULL,
  foreign key (idCustomer) references customer (id),
  foreign key (idTypeOrder) references typeOrder (id),  
  foreign key (idProducts) references products (id)
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  image text NOT NULL,
  price integer NOT NULL
);

CREATE TABLE category (
  id integer primary key, 
  name text
);

CREATE TABLE pizza (
  id INTEGER PRIMARY KEY,
  idProduct integer not null, 
  idCategory integer, 
  foreign key (idProduct) references products(id),  
  foreign key (idCategory) references category(id)
);

CREATE table store (
  id integer primary key,
  address text not null,
  CP integer not null,
  city varchar(255) not null,
  province varchar(255) not null, 
  idOrder integer not null,
  foreign key (idOrder) references order(id)
);

CREATE TABLE typeEmployees (
  id integer not null,
  name varchar(255) not null
);

CREATE TABLE employees (
  id integer primary key,
  name text not null,
  surname varchar(255) not null,
  NIF varchar(255) not null,
  telephone integer not null,
  idStore integer not null,
  idTypeEmployee text not null,
  foreign key (idStore) references store(id),
  foreign key (idTypeEmployee) references typeEmployees(id)
);

CREATE table delivers (
  id integer primary key,
  idEmployee integer not null,
  date date,
  foreign key (idEmployee) references employees(id)
)