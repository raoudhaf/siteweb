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

echo "creer une BD "
echo "Creer un utilisateur ayant tous les droits sur une BD"

echo "create database db_app1;
create user admin identified by '123';
grant all on 'db_app1'.* to admin@'%';"| sudo mysql -u root -p

echo "Creer une table et la remplir par des valeurs"
echo "tester l'acces a la base et affichier le contenu de la table"
echo " create table client2 (id int NOT NULL AUTO_INCREMENT ,
nom varchar(20) DEFAULT NULL,
prenom varchar(30) DEFAULT NULL,
email varchar(60) DEFAULT NULL, 
PRIMARY KEY (id)
);
insert into client2 (nom,prenom,email) values ('raoudha','fathallah', 'raoudha@gmail.com'),('user','user1', 'user@gmail.com');
use db_app1; show databases; show tables;
show columns in client2; select * from client2 ;"|  sudo mysql -u admin -p -h 192.168.56.10 -P 3306 -D db_app1

