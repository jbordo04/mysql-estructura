-- DROP DATABASE --
drop DATABASE if exists optica;

-- CREATE and USE this DATABASE --
create DATABASE optica;
use `optica`;

-- set names utf8
-- set character_set_client  =  utf8mb4


-- DELETE TABLES --
drop table if exists ventas;
drop table if exists montura;    
drop table if exists customer;
drop table if exists gafas;
drop table if exists proveidor; 
drop table if exists employee; 

-- CREATE TABLES --
CREATE TABLE proveidor  (
   id integer PRIMARY KEY,
   adress text NOT NULL,  
   telephone text NOT NULL,
   fax integer,
   NIF integer NOT NULL   
);

CREATE TABLE montura  (
   id integer PRIMARY KEY AUTO_INCREMENT,
   name text NOT NULL
);

CREATE TABLE gafas  (
   id integer PRIMARY KEY AUTO_INCREMENT,
   brand  text NOT NULL,
   graduation integer NOT NULL,
   idMontura integer,
   colourJoint text NOT NULL,
   colorGlass text NOT NULL,
   idProveidor integer NOT NULL,
   price integer not null,
   foreign key (idProveidor) references proveidor (id),
   foreign key (idMontura) references montura (id)
);

CREATE TABLE customer  (
   id integer PRIMARY KEY AUTO_INCREMENT,
   name  text NOT NULL,
   adress text NOT NULL,
   telephone text,
   email text NOT NULL,
   date date,
   idCliente_Recomended integer,
   foreign key (idCliente_Recomended) references customer (id),
   constraint UC_telephone UNIQUE (telephone)
);

CREATE TABLE employee (
   id integer PRIMARY KEY AUTO_INCREMENT,
   nombre text NOT NULL,
   apellido text NOT NULL,
   turno text NOT NULL
);

CREATE TABLE ventas (
   id integer PRIMARY KEY AUTO_INCREMENT,
   idCustomer  integer NOT NULL,
   idEmployee int NOT NULL,
   idGafas integer NOT NULL,
   data  date,
   foreign key (idCustomer) references customer (id),
   foreign key (idEmployee) references employee (id),
   foreign key (idGafas) references gafas (id)
);

INSERT INTO proveidor (adress, telephone, fax, NIF) values 
(
   'Ave.Meridiana 57', '6734522345', '4437654', 'X4352345T'
),
(
   'Ave.Roma 234', '345634563', '4437654', 'F23423R'
),
(
   'Ave.Gipuzcoia 23', '2345522345', '4437654', 'T234234T'
);

INSERT INTO montura (name) values ('flotant'),('pasta'),('metalica');

INSERT INTO gafas ( brand, graduation, idMontura, colourJoint, colorGlass, idProveidor, price) values 
(
   'Rayban', 2.3, 1, 'amarillo', 'verde', 1, 60.5
),
(
   'DG', 1, 2, 'verde', 'negro', 2, 80.9
),
(
   'chichin', 4.5, 3, 'rojo', 'marron', 1, 39.9
);


INSERT INTO employee (name, apellido, turno) values 
(
   'joan', 'bordonaba', 'tarde'
),
(
   'Mireia', 'Gonzales', 'maana'
),
(
   'Floren', 'Straush', 'maana'
);

INSERT INTO customer (name, adress, telephone, email, date, idCliente_Recomended) values 
(
   'Roberto', 'Boreal 6 1-1', '680566146', 'joan@#sdfasdf.com', now(), null
),
(
   'Maria', 'roma 7 4-2', '4563472342', 'maria@#sdfasdf.com', now(), null
),
(
   'Ana', 'burgos 45 3-1', '6234561345', 'ana@#sdfasdf.com', now(), null
);