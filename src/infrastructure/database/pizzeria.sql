CREATE TABLE customer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name text NOT NULL,
  surname varchar(255) NOT NULL,
  adress varchar(255) NOT NULL,
  CP integer NOT NULL,
  city varchar(255) NOT NULL,
  provence varchar(255) NOT NULL,
  telephone integer NOT NULL
);

CREATE table typeOrder (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name varchar(255) NOT NULL)

CREATE TABLE order (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idCustomer integer NOT NULL,
  date date NOT NULL,
  idTypeOrder text NOT NULL,
  quantity integer NOT NULL,
  price integer NOT NULL,
  foreign key (idCustomer) references customer (id),
  foreign key (idTypeOrder) references typeOrder (id)
);

CREATE TABLE product (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  image text NOT NULL,
  price integer NOT NULL,
);

CREATE TABLE products (
  id INTEGER PRIMARY,
  idPizzes integer, 
  idHamburgers integer, 
  idDrinks integer, 
  foreign key (idPizza) references product(id)
  foreign key (idDrinks) references product(id)
  foreign key (idHamburgers) references product(id)
)