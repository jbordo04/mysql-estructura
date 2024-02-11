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
   id integer PRIMARY KEY AUTO_INCREMENT,
   name text not null,
   adress text NOT NULL,  
   telephone text NOT NULL,
   fax text,
   NIF text NOT NULL   
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
   telephone varchar(255) not null,
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

-- INSERT DATA TO MOCK DB --
INSERT INTO proveidor (name, adress, telephone, fax, NIF) values 
(
   'Alferez, S.L.','Ave.Meridiana 57', '6734522345', '4437654', 'X4352345T'
),
(
   'Mmapras, S.L.','Ave.Roma 234', '345634563', '4437654', 'F23423R'
),
(
   'Hmos Lugo, S.L.','Ave.Gipuzcoia 23', '2345522345', '4437654', 'T234234T'
),
(
   'Berthon, S.L','Str. Muckenfield 89', '781234123', '43457654', 'P22342334T'
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
   'chichin', 4.5, 3, 'rojo', 'marron', 3, 39.9
),
(
   'Lacoste', 2.5, 2, 'green', 'balck', 1, 19.9
),
(
   'Vizeroy', 3.5, 1, 'blue', 'white', 3, 49.9
),
(
   'Polaroy', 0.5, 3, 'black', 'black', 4, 89.9
);


INSERT INTO employee (nombre, apellido, turno) values 
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

INSERT INTO ventas(idCustomer ,idEmployee , idGafas , data) values 
(
   1, 2,3, '2023-01-08'
),
(
   3, 1,3, '2023-04-08'
),
(
   3, 2,2, '2023-03-08'
),
(
   1, 1,3, '2023-05-08'
),
(
   1, 3,2, '2023-09-08'
),
(
   2, 1,5, '2023-06-08'
),
(
   3, 2,2, '2023-05-08'
),
(
   1, 2,5, '2023-12-08'
),
(
   3, 1,1, '2023-02-08'
),
(
   3, 2,2, '2023-11-08'
),
(
   1, 1,1, '2023-04-08'
),
(
   1, 3,4, '2023-05-08'
),
(
   2, 1,5, '2023-12-08'
),
(
   3, 2,4, '2023-07-08'
);


-- LISTA TOTAL DE COMPRAS CUSTOMER --
SELECT COUNT(*) as 'Ventas Totales', c.name as customer 
FROM ventas v 
INNER JOIN customer c on v.idCustomer = c.id
INNER JOIN gafas g on g.id = v.idGafas
  where c.id = 1;

SELECT g.brand, v.data, c.name as customer 
FROM ventas v 
INNER JOIN customer c on v.idCustomer = c.id
INNER JOIN gafas g on g.id = v.idGafas
  where c.id = 1;

-- LISTA DE DIFF GLASSE SOLD FOR YEAR PER EMPLOYEE --
SELECT c.name as costumer, concat(e.nombre, ' ', e.apellido) as 'Employee', g.brand, v.data as date
FROM ventas v 
INNER JOIN employee e on v.idEmployee = e.id 
INNER JOIN gafas g ON v.idGafas = g.id 
INNER JOIN customer c on c.id = v.idCustomer
where e.id = 1;

-- DIFF SUPPLIERS MAKING SELLING GLASSES
SELECT p.name as proveedor, COUNT(g.id) AS total_gafas FROM gafas g
INNER JOIN proveidor p ON p.id = g.idProveidor
GROUP BY p.name
ORDER BY total_gafas DESC;

