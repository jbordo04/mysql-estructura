-- DROP DATABASE --
drop DATABASE if exists youtube;

-- CREATE and USE this DATABASE --
create DATABASE youtube;
use `youtube`;

-- set names utf8
-- set character_set_client  =  utf8mb4

-- CREATE TABLE --
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  email text not null,
  password text not null,
  nickname text not null,
  birthdate datetime not null,
  sex varchar(255) not null, 
  country varchar(255) not null,
  CP text not null
);

CREATE table typeVideo(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) not null
);

CREATE TABLE labels (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) not null
);

CREATE TABLE videos (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  title text not null,
  description text not null,
  size decimal(5,2) not null,
  name text not null,
  duration decimal(5,2) not null,
  thunmbnail text not null,
  num_Plays integer not null,
  num_Likes integer not null,
  num_Dislikes integer not null,
  idTypeVideo integer not null,
  idUser integer not null,
  date datetime not null,
  idLabels int not null,
  foreign key (idTypeVideo) references typeVideo(id),
  foreign key (idUser) references users(id),
  foreign key (idLabels) references labels(id)
);

CREATE table statePlaylist(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) not null
);

CREATE TABLE playlist(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  date date not null,
  idState INTEGER NOT NULL,
  idVideo int,
  foreign key (idVideo) references videos(id),
  foreign key (idState) references statePlaylist(id)
);

CREATE TABLE coments (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  content text not null,
  date datetime not null,
  idUser integer not null,
  idVideo integer not null,
  foreign key (idUser) references users(id),
  foreign key (idVideo) references videos(id)
);

CREATE TABLE likedVideo(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idVideo integer not null,
  idUser integer not null,
  date datetime not null,
  foreign key (idVideo) references videos(id),
  foreign key (idUser) references users(id)
);

CREATE TABLE nolikedVideo(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  idVideo integer not null,
  idUser integer not null,
  date datetime not null,
  foreign key (idVideo) references videos(id),
  foreign key (idUser) references users(id)
);