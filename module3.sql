--
-- SQL Procédural
-- Web Apps 
-- 20220211
-- 

-- Module 3 - Contrôles conditionnels

-- Créer une procédure qui reçoit en paramètre (professor_id) et qui avertit selon
-- l'ancienneté du professeur.
-- Par exemple, pour l’employé numéro 5 de la table professor, examinez sa date
-- d’arrivée dans l'université. Si son ancienneté est de plus de 20 ans, afficher la phrase
-- « L’employé 5 est un Senior ». Sinon, il faudra signaler qu’il s’agit d’un Junior.



-- 3.2 Créer une procédure qui reçoit les (nom, prenom) de l'étudiant et signale si l'étudiant
-- existe.
-- S’il existe dans la table student, affichez son id.
-- Sinon, signalez que l'étudiant n'existe pas.



-- 3.3 Si le nombre d'étudiants qui ont plus de 10 à leur résultat annuel est plus important que
-- le nombre d'étudiants qui ont moins de 10, affichez « C'est un bon cru ! » Sinon,
-- indiquez « Aie... ».



-- 3.4 Stocker dans une table temporaire le nom, prenom et suivi_etudiant. Cette dernière
-- contiendra le statut des étudiants. Selon le cas :
-- - si l'étudiant est né après l’an 2000, cela est vraisemblablement impossible,
-- - dans le cas où l'étudiant est né entre 1980 et 2000, il est un Junior.
-- - Entre 1970 et 1979 il est un Qualified.
-- - Entre 1950 et 1969, il est Confirmed,
-- - sinon, c’est un Vice President ! Puis affichez le contenu de la table temporaire par un select.



-- 3.5 Créer une procédure qui reçoit, l'id du professeur. En fonction de l'année
-- d'engagement du professeur traité, prévenez-nous s’il sera bientôt à la retraite (+30
-- années d'expérience) ou pas via une phrase affichée à l’écran « Attention, retraite
-- imminente pour [nom_employé] ! » ou justement, « [nom_employé] a encore de
-- longues années à faire chez nous ! ».


