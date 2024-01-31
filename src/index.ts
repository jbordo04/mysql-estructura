import { createClient } from "@libsql/client";

//Conexion a BBDD localmente
const db = createClient({
  url: "libsql:./src/infrastructure/database/BBDD.sql",
  // url: "file:./src/infrastructure/database/BBDD.db", //relative
  // url: `file:${__dirname}/infrastructure/database/BBDD.db`, //absolute
});

// db.execute(/*sql*/ `create table if not exists dataUsers  (
//   userId integer PRIMARY KEY,
//   nombre  text NOT NULL,
//   apellidos text NOT NULL,
//   email text UNIQUE,
//   password text NOT NULL,
//   nickname text NOT NULL UNIQUE,
//   fotoPerfil text not null,
//   fecha date
// )  `);

// db.execute(
//   /*sql*/ ` insert into dataUsers (nombre, apellidos, email, password, nickname, fotoPerfil, fecha) values('Joan', 'Bordonaba', 'joan.bordonaba@gmail.com','asdf', 'bordo','data/perfil_blanco.jpg', current_date )`
// );
// const result = await
class Client {
  async receceive() {
    const respo = await db.execute(
      /*sql*/ `select concat(nombre, ' ', apellidos) as "Nombre Completo", email, password, nickname, fecha from dataUsers `
    );
    console.log(respo.rows[0]);
  }
}
new Client().receceive();

//Remove-item alias:curl
