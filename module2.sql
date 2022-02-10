--
-- SQL Procédural
-- Web Apps 
-- 20220210
-- 

-- Module 2 - Variables

-- 2.1 À l’aide de la commande « SELECT », affichez le message « Le T-SQL, c’est bien pratique ! »

SELECT "Le SQL Procédural, c'est bien pratique !";

-- 2.2 Créer à présent une variable qui contiendra la phrase affichée au point 2.1.
-- Afficher le contenu de la variable via la commande « SELECT »

SET @phrase = "Le SQL Procédural, c'est bien pratique !";
SELECT @phrase;

-- 2.3 Déclarer une variable qui contiendra le nombre de professeur de la table « professor » de votre base de données DBSlide. Affichez le contenu de cette variable

USE dbslide;

-- 1ere façon de faire
SELECT @nbProfessor := COUNT(*)
FROM professor;

-- 2e façon de faire
SET @nbProfessor2 = (SELECT COUNT(*) FROM professor);
SELECT @nbProfessor2;

-- 2.4 Déclarer une variable nommée « prenom_prof ». Remplir cette variable avec le prénom de M. Giot et afficher le contenu de la variable. Vérifier que cette valeur est bien « Pierre »

SET @prenom_prof = (
  SELECT professor_surname
  FROM professor
  WHERE professor_name LIKE 'giot'
  -- WHERE professor_name = 'giot'
);

SELECT @prenom_prof; -- output : Pierre OK

-- 2.5 Créer une variable nommée « date_du_jour » qui aura la valeur de la date du jour. Afficher cette date.

SET @date_du_jour = CURRENT_DATE();

SELECT @date_du_jour;

-- 2.6 À l’aide de plusieurs variables, afficher la phrase 
-- « [Nom] [Prénom] est le professeur numéro [professor_id], 
-- a été engagé le [date d’entrée en service du professor] et 
-- travaille dans la section [nom de la section] »
-- Les informations dont vous avez besoin se trouvent dans les tables « professor » et « section »

SELECT 
  @nom := professor_name,
  @prenom := professor_surname,
  @id := professor_id,
  @date_entree := professor_hire_date,
  @nom_section := section_name
FROM professor p
JOIN section s
  ON p.section_id = s.section_id
WHERE professor_id = 2;

SELECT CONCAT(@nom, ' ', @prenom, ' est le professeur numéro ', @id , ', a été engagé le ', @date_entree, ' et travaille dans la section ', @nom_section);

-- OU

SELECT 
  CONCAT(
    @nom := professor_name, ' ',
    @prenom := professor_surname, ' est le professeur numéro ',
    @id := professor_id, ', a été engagé le ',
    @date_entree := professor_hire_date, ' et travaille dans la section ',
    @nom_section := section_name
  )
FROM professor p
JOIN section s
  ON p.section_id = s.section_id;

-- 2.7 Créer une variable contenant votre âge. Créer une seconde variable contenant votre nom. 
-- Afficher maintenant la concaténation de ces variables.
-- Cette opération pose-t-elle problème ? Avez-vous utilisé la fonction CONVERT dans ce cas ? 
-- Aurait-elle été utile ? Si vous ne l’avez pas utilisée, n’hésitez pas à la faire ! 
-- Cela change-t-il la réponse ?

SET @age = 25, @nom = 'Geerts';
SELECT CONCAT(@age, ' ', @nom);

-- Conversion implicite en VARCHAR
-- CONVERT vers VARCHAR n'est pas disponible

-- SET @age = 25, @nom = 'Geerts';
-- SELECT CONCAT(CONVERT(@age, VARCHAR), ' ', @nom);

-- 2.8 Générer (random) 3 variables entières. 
-- Afficher l’addition de ces trois variables dans une table temporaire. 
-- La colonne utilisée pour l’affichage aura pour nom « Résultat »

SET @nb1 = ROUND(RAND() * 10);
SET @nb2 = ROUND(RAND() * 10);
SET @nb3 = ROUND(RAND() * 10);

CREATE TEMPORARY TABLE temp (

  resultat INT
  
);

-- Insérer les 3 variables
INSERT INTO temp VALUES (@nb1 + @nb2 + @nb3);

-- Afficher le contenu
SELECT * FROM temp;

-- 2.9 Déclarer une table temporaire qui contiendra les données issues 
-- des colonnes professor_name et professor_surname de la table professor.
-- Insérer les données dans la table temporaire. 
-- Afficher l’ensemble des données de la table.
-- Déconnectez-vous de MySQL et reconnectez-vous. 
-- La table temporaire existe-t-elle toujours ?



-- 2.10 Déclarer une table temporaire qui aura pour colonnes « NomPrenom », « DateEmbauche » et « Salaire ». Remplir cette table avec les données de tous les professor de la table professor qui ont plus de 2000 euros de salaire. Afficher le contenu de cette table grâce à un select.



-- 2.11 Récupérer le salaire max, le stocker dans une variable temp et faite en sorte d'afficher le type.


