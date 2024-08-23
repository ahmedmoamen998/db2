CREATE DATABASE movi
USE movi
CREATE SCHEMA movi
GO
CREATE TABLE movi.movie (
	movi_id int PRIMARY KEY,
	movi_title  char(50),
	movi_year int,
	movi_time int ,
	movi_lang  char(50),
	movi_dt_rel date,
	mov_rel_country char(50)

)	
CREATE TABLE movi.actor (
	actor_id INT PRIMARY KEY,
	actfirst_name char(50),
	actlast_name char(50),
	act_gendr char(1)
)	
CREATE TABLE movi.director (
	director_id INT PRIMARY KEY,
	directorfirst_name char(50),
	directorlast_name char(50),
	
)
CREATE TABLE movi.movi_direction (
	di_id INT ,
	movi_id int , 
	constraint fk foreign key (di_id) references movi.director(director_id)ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
	constraint forkey foreign key (movi_id) references movi.movie (movi_id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT


)
 
CREATE TABLE movi.movi_cast (
	actor_id INT ,
	movi_id int,
	--what is mean of it 
	-- you say that we cant alter tables in our data base what about relation can we alter it 
	role varchar(50),
	constraint fkcast foreign key (actor_id)references  movi.actor (actor_id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT ,
		constraint fkcast2 foreign key (movi_id)references movi.movie(movi_id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT 

)	

CREATE TABLE movi.reviewer (
	rev_id INT PRIMARY KEY,
	rev_name char(30),
	

)	
CREATE TABLE movi.genres (
	gen_id INT PRIMARY KEY,
	gen_title char(30)
	
)	
CREATE TABLE movi.movie_genres (
	movi_id INT ,
	gen_id int 
	constraint fkg foreign key (movi_id) references  movi.movie(movi_id)ON DELETE SET DEFAULT ON UPDATE SET DEFAULT,
	constraint fkg2 foreign key (gen_id)references movi.genres (gen_id)ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
)	
CREATE TABLE movi.rating (
	movi_id int ,
	rev_id INT ,
	rev_stars int , 
	num_o_ratings int , 
	constraint fkra foreign key (movi_id) references movi.movie(movi_id) ON DELETE SET DEFAULT ON UPDATE SET DEFAULT ,
	constraint fkra2 foreign key (rev_id) references movi.reviewer (rev_id)ON DELETE SET DEFAULT ON UPDATE SET DEFAULT
	
)	

