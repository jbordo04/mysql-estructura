import "dotenv/config"
import { createClient } from "@libsql/client"

//Conexion a BBDD localmente
const db = createClient({
  // url: "libsql://project-turso-jbordo04.turso.io", //cloudFile
  // authToken: process.env.TURSO_TOKEN,
  url: "file:./src/infrastructure/database/7.db", //local-relative
  // url: `file:${__dirname}/infrastructure/database/BBDD.db`, //local-absolute
})
const db2 = createClient({
  // url: "libsql://project-turso-jbordo04.turso.io", //cloudFile
  // authToken: process.env.TURSO_TOKEN,
  url: "file:./src/infrastructure/database/8.db", //local-relative
  // url: `file:${__dirname}/infrastructure/database/BBDD.db`, //local-absolute
})

async function createTables() {
  await Promise.all([
    db.execute(/*sql*/ `drop table if exists ventas;`),
    db.execute(/*sql*/ `drop table if exists montura;    `),
    db.execute(/*sql*/ `drop table if exists customer;`),
    db.execute(/*sql*/ `drop table if exists gafas;`),
    db.execute(/*sql*/ `drop table if exists proveidor; `),
    db.execute(/*sql*/ `drop table if exists employee; `),
  ]).then(() => console.log("borrado!!"))

  await db.execute(/*sql*/ `CREATE TABLE proveidor  (
    id integer PRIMARY KEY,
    adress text NOT NULL,
    -- idAdress  integer NOT NULL,
    telephone integer NOT NULL,
    fax integer,
    NIF integer NOT NULL
    -- foreign key (idAdress) references adress (id)
  );`)

  await db.execute(/*sql*/ `CREATE TABLE montura  (
    id integer PRIMARY KEY,
    name text NOT NULL
  );`)

  await db.execute(/*sql*/ `CREATE TABLE gafas  (
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
  );`)

  await db.execute(/*sql*/ `CREATE TABLE customer  (
    id integer PRIMARY KEY,
    name  text NOT NULL,
    adress text NOT NULL,
    telephone integer UNIQUE,
    email text NOT NULL,
    date date,
    idCliente_Recomended integer,
    foreign key (idCliente_Recomended) references customer (id)
  );`)

  await db.execute(/*sql*/ `CREATE TABLE employee (
    id integer PRIMARY KEY,
    nombre text NOT NULL,
    apellido text NOT NULL,
    turno text NOT NULL) `)

  await db.execute(/*sql*/ `CREATE TABLE ventas (
    id integer PRIMARY KEY,
    idCustomer  integer NOT NULL,
    idEmployee int NOT NULL,
    idGafas integer NOT NULL,
    data  date,
    foreign key (idCustomer) references customer (id),
    foreign key (idEmployee) references employee (id),
    foreign key (idGafas) references gafas (id)
  );`)
}
createTables()

async function createTables2() {
  await Promise.all([
    db.execute(/*sql*/ `drop table if exists typeOrder;`),
    db.execute(/*sql*/ `drop table if exists customer;`),
    db.execute(/*sql*/ `drop table if exists product;`),
    db.execute(/*sql*/ `drop table if exists products;`),
    db.execute(/*sql*/ `drop table if exists order;`),
  ]).then(() => console.log("borrado!!"))

  db2.execute(/*sql*/ `CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name text NOT NULL,
    surname varchar(255) NOT NULL,
    adress varchar(255) NOT NULL,
    CP integer NOT NULL,
    city varchar(255) NOT NULL,
    provence varchar(255) NOT NULL,
    telephone integer NOT NULL
  );`)

  db2.execute(/*sql*/ `CREATE table typeOrder (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar(255) NOT NULL);`)

  db2.execute(/*sql*/ `CREATE TABLE order (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    idCustomer integer NOT NULL,
    date date NOT NULL,
    idTypeOrder text NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL,
    foreign key (idCustomer) references customer (id),
    foreign key (idTypeOrder) references typeOrder (id)
  );`)

  db2.execute(/*sql*/ `CREATE TABLE product (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    image text NOT NULL,
    price integer NOT NULL,
  );`)

  db2.execute(/*sql*/ `CREATE TABLE products (
    id INTEGER PRIMARY,
    idPizzes integer, 
    idHamburgers integer, 
    idDrinks integer, 
    foreign key (idPizza) references product(id)
    foreign key (idDrinks) references product(id)
    foreign key (idHamburgers) references product(id)
  )`)
}
createTables2()
// const seller = ["Joan", "Veronica", "Ruben"]
// const time = () => {
//   setInterval()
// }

// db.execute(
//   /*sql*/ ` insert into newCustomer (nombre, apellidos, email, password, nickname, fotoPerfil, fecha) values('Joan', 'Bordonaba', 'joan.bordonaba@gmail.com','asdf', 'bordo','data/perfil_blanco.jpg', current_date )`
// )
// const result = await
// class Client {
//   async receceive() {
//     const respo = await db.execute(
//       /*sql*/ `select concat(nombre, ' ', apellidos) as "Nombre Completo", email, password, nickname, fecha from dataUsers `
//     )
//     console.log(respo.rows[0])
//   }
// }
// new Client().receceive()

//Remove-item alias:curl
