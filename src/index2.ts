import "dotenv/config";
import { createClient } from "@libsql/client";

const db2 = createClient({
  url: "file:./src/infrastructure/database/9.db", //local-relative
});

async function createTables2() {
  await Promise.all([
    db2.execute(/*sql*/ `drop table if exists customer;`),
    db2.execute(/*sql*/ `drop table if exists typeOrder;`),
    db2.execute(/*sql*/ `drop table if exists commands;`),
    db2.execute(/*sql*/ `drop table if exists products;`),
    db2.execute(/*sql*/ `drop table if exists pizza;`),
    db2.execute(/*sql*/ `drop table if exists category;`),
    db2.execute(/*sql*/ `drop table if exists store;`),
    db2.execute(/*sql*/ `drop table if exists employees;`),
    db2.execute(/*sql*/ `drop table if exists typeEmployees;`),
    db2.execute(/*sql*/ `drop table if exists delivers;`),
  ]).then(() => console.log("borrado2!!"));

  await db2.execute(/*sql*/ `CREATE TABLE customer (
    id INTEGER PRIMARY KEY,
    name text NOT NULL,
    surname varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    CP integer NOT NULL,
    city varchar(255) NOT NULL,
    province varchar(255) NOT NULL,
    telephone integer NOT NULL
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE typeOrder (
    id INTEGER PRIMARY KEY,
    name varchar(255) NOT NULL);`);

  await db2.execute(/*sql*/ `CREATE TABLE commands (
    id integer PRIMARY KEY,
    idCustomer integer NOT NULL,
    date date NOT NULL,
    idTypeOrder integer NOT NULL,
    idProducts integer NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    foreign key (idCustomer) references customer (id),
    foreign key (idTypeOrder) references typeOrder (id),
    foreign key (idProducts) references products (id)
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE products (
    id integer PRIMARY KEY,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    image text NOT NULL,
    price integer NOT NULL
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE category (
    id integer primary key, 
    name text
    -- idPizza integer,
    -- foreign key (idPizza) references pizza(id)
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE pizza (
     id INTEGER PRIMARY KEY,
    idProduct integer not null, 
    idCategory integer, 
    foreign key (idProduct) references products(id),  
    foreign key (idCategory) references category(id)
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE store (
    id integer primary key,
    address text not null,
    CP integer not null,
    city varchar(255) not null,
    province varchar(255) not null, 
    idOrder integer not null,
    foreign key (idOrder) references commands(id)
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE typeEmployees (
    id integer primary key, 
    name text 
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE employees (
    id integer primary key,
    name text not null,
    surname varchar(255) not null,
    NIF varchar(255) not null,
    telephone integer not null,
    idStore integer not null,
    idTypeEmployee text not null,
    foreign key (idStore) references store(id),
    foreign key (idTypeEmployee) references typeEmployees(id)
  );`);

  await db2.execute(/*sql*/ `CREATE TABLE delivers (
    id integer primary key,
    idEmployee integer not null,
    date date,
    foreign key (idEmployee) references employees(id)
  );`);
}

createTables2();
