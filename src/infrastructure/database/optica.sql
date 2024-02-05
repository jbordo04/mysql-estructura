-- drop DATABASE if exist 'sql-SP5'
-- create DATABASE 'sql-SP5'
-- use `sql-SP5`

-- set names utf8
-- set character_set_client  =  utf8mb4


--DELETE TABLES --
drop table if exists ventas;
drop table if exists montura;    
drop table if exists customer;
drop table if exists gafas;
drop table if exists proveidor; 
drop table if exists employee; 

--CREATE TABLES --
CREATE TABLE proveidor  (
   id integer PRIMARY KEY,
   adress text NOT NULL,  
   telephone integer NOT NULL,
   fax integer,
   NIF integer NOT NULL   
);

CREATE TABLE montura  (
   id integer PRIMARY KEY,
   name text NOT NULL
);

CREATE TABLE gafas  (
   id integer PRIMARY KEY,
   brand  text NOT NULL,
   graduation integer NOT NULL,
   idMontura integer ,
   colourJoint text NOT NULL,
   colorGlass text NOT NULL UNIQUE,
   idProveidor integer NOT NULL,
   price integer not null,
   foreign key (idProveidor) references proveidor (id),
   foreign key (idMontura) references montura (id)
);

CREATE TABLE customer  (
   id integer PRIMARY KEY,
   name  text NOT NULL,
   adress text NOT NULL,
   telephone integer UNIQUE,
   email text NOT NULL,
   date date,
   idCliente_Recomended integer,
   foreign key (idCliente_Recomended) references customer (id)
);

CREATE TABLE employee (
   id integer PRIMARY KEY,
   nombre text NOT NULL,
   apellido text NOT NULL,
   turno text NOT NULL) 

CREATE TABLE ventas (
   id integer PRIMARY KEY,
   idCustomer  integer NOT NULL,
   idEmployee int NOT NULL,
   idGafas integer NOT NULL,
   data  date,
   foreign key (idCustomer) references customer (id),
   foreign key (idEmployee) references employee (id),
   foreign key (idGafas) references gafas (id)
);