--
-- SQL Procédural
-- Web Apps 
-- 20220210
-- 

-- Module 1 - Introduction

-- 1. Se connecter à MySQL et créer une nouvelle requête.
-- Créer une table ayant une colonne de type INTEGER, auto-incrémentée.
-- Où cette table s’est-elle créée ? Comment pouvez-vous la visualiser ?

CREATE TABLE nom_table2 (
  colonne INT AUTO_INCREMENT,
  text VARCHAR(50),
  KEY colonne_key (colonne)
);

-- Aucune base n'a été sélectionnée
-- => Il faut bien sélectionner une base de données

-- 2. Créer une nouvelle base de données (CREATE DATABASE nom_de_votre_bd)
-- Créer une table contenant 2 colonnes dont une possède la contrainte UNIQUE, dans cette base de données. 

CREATE DATABASE exo2;
USE exo2; -- D'utiliser la base de données récemment créée
CREATE TABLE nom_table (
  col1 INT UNIQUE,
  col2 VARCHAR(20)
);

-- 3. A l’aide de l’instruction « SELECT », afficher le message « Bonjour, 
-- et bienvenue dans le cours de Transact SQL ! »

SELECT "Bonjour, et bienvenue dans le cours de SQL Procédural";

-- 4. Insérer une ligne de valeurs dans la table créée au point 1.2.
-- Insérer une seconde ligne identique. Un message d’erreur doit apparaître. 
-- A quelle ligne se situe le message ? Comment trouver cette ligne instantanément ?
-- Comprenez-vous ce message ? Comment pouvez-vous faire pour le comprendre si l’anglais n’est pas votre fort ?

USE exo2;
INSERT INTO nom_table (col1, col2) VALUES (1, "Mon texte 1"); -- OK
INSERT INTO nom_table (col1, col2) VALUES (1, "Mon texte 2"); -- KO : Duplicata du champ '1' pour la clef 'col1'

-- 5. A l’aide d’une instruction de simple « SELECT », 
-- afficher les données contenues dans la table du point 1.2.

-- question : auto_incrément
INSERT INTO nom_table2 (text) VALUES ("Ma valeur texte");
INSERT INTO nom_table2 VALUES (NULL, "Ma valeur texte");

SELECT * FROM nom_table2;


