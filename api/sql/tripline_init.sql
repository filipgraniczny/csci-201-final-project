DROP DATABASE IF EXISTS tripline_data;
CREATE DATABASE tripline_data;
USE tripline_data;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Trip;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Photo;


CREATE TABLE User (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    pfp_id INT
);

CREATE TABLE Trip (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    description VARCHAR(255),
    location VARCHAR(255),
    from_time timestamp NOT NULL,
    to_time timestamp,
    author_id INT
    
);

CREATE TABLE Event (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255), -- change to enum -- 
    description VARCHAR(255),
    location VARCHAR(255),
    from_time timestamp NOT NULL,
    to_time timestamp,
    trip_id INT
);

CREATE TABLE Location (
    id INT PRIMARY KEY  NOT NULL auto_increment,
    name VARCHAR(255) UNIQUE NOT NULL,
    longitude float not null,
    latitude float not null
);

CREATE TABLE Photo (
	id INT PRIMARY KEY NOT NULL auto_increment,
    trip_id INT,
    event_id INT,
	caption varchar(255),
	object_key_aws varchar(255) not null
);

ALTER TABLE Photo ADD FOREIGN KEY (trip_id) REFERENCES Trip(id);
ALTER TABLE Photo ADD FOREIGN KEY (event_id) REFERENCES Event(id);
ALTER TABLE User ADD FOREIGN KEY (pfp_id) REFERENCES Photo(id);
ALTER TABLE Trip ADD FOREIGN KEY (author_id) REFERENCES User(id);
ALTER TABLE Event ADD FOREIGN KEY (trip_id) REFERENCES Trip(id);


