drop DATABASE if exist 'sql-SP5'
create DATABASE 'sql-SP5'
use `sql-SP5`

set names utf8
set character_set_client  =  utf8mb4

create table if not exists dataUsers  (
   userId integer PRIMARY KEY,
   nombre  text NOT NULL,
   apellidos text NOT NULL,
   email text UNIQUE,
   password text NOT NULL,
   nickname text NOT NULL UNIQUE,
   fotoPerfil text not null,
   fecha date)

insert into dataUsers (nombre, apellidos, email, password, nickname, fotoPerfil, fecha) values('Joan', 'Bordonaba', 'joan.bordonaba@gmail.com','asdf', 'bordo','data/perfil_blanco.jpg', current_date )