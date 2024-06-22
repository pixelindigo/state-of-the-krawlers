CREATE TABLE `users` (
`user_id` INT NOT NULL auto_increment,
`email` VARCHAR( 200 ) NOT NULL ,
`password` VARCHAR( 50 ) NOT NULL ,
`firstname` VARCHAR( 200 ) NOT NULL ,
`lastname` VARCHAR( 200 ) NOT NULL ,
`affiliation` VARCHAR( 200 ) NOT NULL ,
`showemail` BOOL DEFAULT false NOT NULL ,
`privilege` ENUM( 'admin', 'user' ) NOT NULL DEFAULT 'user' ,
PRIMARY KEY ( `user_id` )
) ;

CREATE TABLE `papers` (
`paper_id` INT NOT NULL AUTO_INCREMENT ,
`title` VARCHAR( 200 ) NOT NULL ,
`abstract` TEXT NOT NULL ,
`pdf` LONGBLOB NOT NULL ,
`pdfname` VARCHAR( 200 ) NOT NULL ,
`session_id` INT NOT NULL ,
`order` INT NOT NULL ,
PRIMARY KEY ( `paper_id` )
) ;

CREATE TABLE `sessions` (
`session_id` INT NOT NULL AUTO_INCREMENT ,
`name` VARCHAR( 200 ) NOT NULL ,
`user_id` INT NOT NULL ,
`starttime` DATETIME NOT NULL ,
`duration` INT NOT NULL ,
PRIMARY KEY ( `session_id` )
) ;

CREATE TABLE `authors` (
`paper_id` INT NOT NULL ,
`user_id` INT NOT NULL ,
`order` INT NOT NULL ,
PRIMARY KEY ( `paper_id`, `order` )
) ;

CREATE TABLE `comments` (
`comment_id` INT NOT NULL AUTO_INCREMENT ,
`user_id` INT NOT NULL ,
`paper_id` INT NOT NULL ,
`comment` TEXT NOT NULL ,
`date` DATETIME NOT NULL ,
`approved` BOOL DEFAULT false NOT NULL ,
PRIMARY KEY ( `comment_id` )
) ;

CREATE TABLE `options` (
`name` VARCHAR( 200 ) NOT NULL ,
`type` ENUM( 'text', 'file', 'boolean' ) NOT NULL ,
`value` TEXT NOT NULL ,
PRIMARY KEY ( `name` )
) ;

CREATE TABLE `files` (
`paper_id` INT NOT NULL ,
`name` VARCHAR( 200 ) NOT NULL ,
`ext` VARCHAR( 200 ) NOT NULL ,
`type` VARCHAR( 200 ) NOT NULL ,
`data` LONGBLOB NOT NULL ,
PRIMARY KEY ( `paper_id` , `name` )
);

INSERT INTO users (email, password, firstname, lastname, privilege, affiliation) VALUES ('jaekpot@localhost.com', '250468c349ff95256ce5a4457dde2f0c', 'John', 'Doe', 'admin', '');
