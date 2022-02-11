--
-- SQL Procédural
-- Web Apps 
-- 20220211
-- 

-- Module 3 - Contrôles conditionnels

-- 3.1 Créer une procédure qui reçoit en paramètre (professor_id) et qui avertit selon
-- l'ancienneté du professeur.
-- Par exemple, pour l’employé numéro 5 de la table professor, examinez sa date
-- d’arrivée dans l'université. Si son ancienneté est de plus de 20 ans, afficher la phrase
-- « L’employé 5 est un Senior ». Sinon, il faudra signaler qu’il s’agit d’un Junior.

DROP PROCEDURE IF EXISTS anciennete;

DELIMITER |

CREATE PROCEDURE anciennete ( IN prof_id INT )
BEGIN

  -- Récupération en année de la date d'embauche du professeur
  SET @date_embauche = (
    SELECT 
      YEAR(professor_hire_date)
    FROM
      professor
    WHERE
      professor_id = prof_id
  );

  -- Récupération en année de la date d'aujourd'hui
  SET @aujourdhui = (
    SELECT
      YEAR(CURRENT_DATE())
  );

  -- Vérification de l'ancienneté
  IF (@aujourdhui - @date_embauche) > 20 THEN
    SELECT CONCAT("L'employé ", prof_id, " est un senior");
  ELSE
    SELECT CONCAT("L'employé ", prof_id, " est un junior");
  END IF;

END |

DELIMITER ;

CALL anciennete(1); -- KO
CALL anciennete(5); -- OK

-- 3.2 Créer une procédure qui reçoit les (nom, prenom) de l'étudiant et signale si l'étudiant
-- existe.
-- S’il existe dans la table student, affichez son id.
-- Sinon, signalez que l'étudiant n'existe pas.

DROP PROCEDURE IF EXISTS etudiantExiste;

DELIMITER |

CREATE PROCEDURE etudiantExiste( IN nom VARCHAR(50), IN prenom VARCHAR(50) )
BEGIN

  -- Récupération de l'id de l'étudiant
  -- id ou null si pas trouvé
  SET @existeEtudiant = (
    SELECT student_id 
    FROM student 
    WHERE last_name = nom 
      AND first_name = prenom
  );

  -- Vérification de la valeur de l'id
  -- Si valeur => existe
  -- Si null => n'existe pas
  IF @existeEtudiant IS NOT NULL THEN
    -- L'étudiant existe
    SELECT @existeEtudiant "Il porte l'id";
  ELSE
    -- L'étudiant n'existe pas
    SELECT CONCAT("L'étudiant ", prenom, " ", nom, " n'existe pas.") "Attention";
  END IF;

END |

DELIMITER ;

CALL etudiantExiste('Geerts', 'Quentin'); -- KO
CALL etudiantExiste('Depp', 'Johnny'); -- OK


-- 3.3 Si le nombre d'étudiants qui ont plus de 10 à leur résultat annuel est plus important que
-- le nombre d'étudiants qui ont moins de 10, affichez « C'est un bon cru ! » Sinon,
-- indiquez « Aie... ».

DROP PROCEDURE IF EXISTS note;

DELIMITER |
CREATE PROCEDURE note()
BEGIN

  SET @nbEtudiantsSup10 = (
    SELECT 
      COUNT(*)
    FROM STUDENT
    WHERE 
      year_result > 10
  );
  
  SET @nbEtudiantsInf10 = (
    SELECT 
      COUNT(*)
    FROM STUDENT
    WHERE 
      year_result < 10
  );

  IF @nbEtudiantsSup10 > @nbEtudiantsInf10 THEN
    -- Majorité positive
    SELECT "C'est un bon cru.." AS "Verdict";
  ELSE
    -- Majorité négative
    SELECT "Aie..." AS "Verdict";

  END IF;

END |
DELIMITER ;

CALL note();

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


