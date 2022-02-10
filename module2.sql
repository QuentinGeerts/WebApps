--
--
--
--

-- 2.1 À l’aide de la commande « SELECT », affichez le message « Le T-SQL, c’est bien pratique ! »



-- 2.2 Créer à présent une variable qui contiendra la phrase affichée au point 2.1. Afficher le contenu de la variable via la commande « SELECT »



-- 2.3 Déclarer une variable qui contiendra le nombre de professeur de la table « professor » de votre base de données DBSlide. Affichez le contenu de cette variable



-- 2.4 Déclarer une variable nommée « prenom_prof ». Remplir cette variable avec le prénom de M. Giot et afficher le contenu de la variable. Vérifier que cette valeur est bien « Pierre »



-- 2.5 Créer une variable nommée « date_du_jour » qui aura la valeur de la date du jour. Afficher cette date.



-- 2.6 À l’aide de plusieurs variables, afficher la phrase « [Nom] [Prénom] est le professeur numéro [professor_id], a été engagé le [date d’entrée en service du professor] et travaille dans la section [nom de la section] »
-- Les informations dont vous avez besoin se trouvent dans les tables « professor » et « section »



-- 2.7 Créer une variable contenant votre âge. Créer une seconde variable contenant votre nom. Afficher maintenant la concaténation de ces variables.
-- Cette opération pose-t-elle problème ? Avez-vous utilisé la fonction CONVERT dans ce cas ? Aurait-elle été utile ? Si vous ne l’avez pas utilisée, n’hésitez pas à la faire ! Cela change-t-il la réponse ?



-- 2.8 Générer (random) 3 variables entières. Afficher l’addition de ces trois variables dans une table temporaire. La colonne utilisée pour l’affichage aura pour nom « Résultat »



-- 2.9 Déclarer une table temporaire qui contiendra les données issues 
-- des colonnes professor_name et professor_surname de la table professor.
-- Insérer les données dans la table temporaire. 
-- Afficher l’ensemble des données de la table.
-- Déconnectez-vous de MySQL et reconnectez-vous. 
-- La table temporaire existe-t-elle toujours ?



-- 2.10 Déclarer une table temporaire qui aura pour colonnes « NomPrenom », « DateEmbauche » et « Salaire ». Remplir cette table avec les données de tous les professor de la table professor qui ont plus de 2000 euros de salaire. Afficher le contenu de cette table grâce à un select.



-- 2.11 Récupérer le salaire max, le stocker dans une variable temp et faite en sorte d'afficher le type.


