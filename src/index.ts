import "dotenv/config"
import { createClient } from "@libsql/client"

//Conexion a BBDD localmente
const db = createClient({
  // url: "libsql://project-turso-jbordo04.turso.io", //cloudFile
  // authToken: process.env.TURSO_TOKEN,
  url: "file:./src/infrastructure/database/tursoDB.db", //local-relative
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
    telephone text NOT NULL,
    fax text,
    NIF integer NOT NULL    
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
    price decimal(5,2) not null,
    foreign key (idProveidor) references proveidor (id),
    foreign key (idMontura) references montura (id)
  );`)

  await db.execute(/*sql*/ `CREATE TABLE customer  (
    id integer PRIMARY KEY,
    name  text NOT NULL,
    adress text NOT NULL,
    telephone text not null,
    email text NOT NULL,
    date date,
    idCliente_Recomended integer,
    foreign key (idCliente_Recomended) references customer (id)
    constraint UC_telephone UNIQUE (telephone)
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
