#! /bin/bash
# script.sh
# lancer le script principale
echo "installer un serveur apache"
sudo apt update 
sudo apt install apache2
echo "installer module PHP"
sudo apt install libapache2-mod-php
echo "installer MYSQL"
sudo apt update
sudo apt install mysql-server
sudo apt install php7.0-mysql
echo "creer une BD "
echo "Creer un utilisateur ayant tous les droits sur une BD"
echo "create database db_app;
create user user_app identified by 'abc';
grant all on db_app.* to user_app@'%';"| sudo mysql -u root -p 
echo "Creer une table et la remplir par des valeurs"
echo "tester l'acces a la base et affichier le contenu de la table"
echo " create table client (id int NOT NULL AUTO_INCREMENT ,
nom varchar(20) DEFAULT NULL,
prenom varchar(30) DEFAULT NULL,
email varchar(60) DEFAULT NULL, 
PRIMARY KEY (id)
);
insert into client (nom,prenom,email) values ('raoudha', 'raoudha@gmail.com'),('user', 'user@gmail.com');
use db_app; show databases; show tables;
show columns in client; select * from client ;"| sudo mysql -u user_app -p -D db-app
