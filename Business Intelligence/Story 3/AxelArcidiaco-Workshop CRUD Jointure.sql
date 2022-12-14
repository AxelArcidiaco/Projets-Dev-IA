-- Création de la table foodly
CREATE DATABASE IF NOT EXISTS `foodly`;

-- Création et remplissage des tables aliment et utilisateur
-- Table aliment
DROP TABLE IF EXISTS `aliment`;
CREATE TABLE `aliment`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(100) NOT NULL,
    `marque` VARCHAR(100) DEFAULT NULL,
    `sucre` FLOAT DEFAULT NULL,
    `calories` INT NOT NULL,
    `graisses` FLOAT DEFAULT NULL,
    `proteines` FLOAT DEFAULT NULL,
    `bio` TINYINT(1) DEFAULT '0',
    PRIMARY KEY(`id`)
);

INSERT INTO `aliment`VALUES
    (1,'pomme','sans marque',19.1,72,0.2,0.4,0),
    (2,'poire','sans marque',27.5,134,0.2,1.1,1),
    (3,'banane','chiquita',24,101,0.3,1.1,0),
    (4,'jambon','herta',0.2,34,0.8,6.6,0),
    (5,'compote','andros',11,51,0,0.5,0),
    (6,'steak haché','charal',0.8,68,4.8,4.8,0),
    (7,'saumon','guyader',0,206,12.3,22.1,0),
    (8,'haricots verts','bonduelle',5.8,25,0.1,1.5,0),
    (9,'riz','oncle benz',28.2,130,0.3,2.7,0),
    (10,'pâtes completes','barilla',64,353,2.7,14,1),
    (11,'blanc de dinde','père dodu',0.6,98,0.9,22,0),
    (12,'filet de poulet','le gaulois',0,121,1.8,26.2,0),
    (13,'muesli','bjorg',26.5,170,5,3.5,1),
    (14,'café','carte noire',0,0,0,0,0),
    (15,"jus d\'orange",'innocent',16,74,0,1.6,0),
    (16,'jus de pomme','andros',24,100,0.2,0.2,1),
    (17,'pomme de terre','doréac',21.1,104,0.2,2.8,0),
    (18,'oeuf','naturalia',0.4,74,5.1,6.5,1),
    (19,'baguette','sans marque',36.1,185,1.2,7.5,0),
    (20,"lait d\'amande",'bjorg',6.1,80,5.3,1.5,1);

-- Table utilisateur
DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(100) DEFAULT NULL,
    `prenom` VARCHAR(100) DEFAULT NULL,
    `email` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`id`),
    UNIQUE KEY `email`(`email`)
);

INSERT INTO `utilisateur` VALUES
    (1, 'durantay', 'quentin', 'qentin@gmail.com'),
    (2, 'dupont', 'marie', 'marie@hotmail.fr'),
    (3, 'miller', 'vincent', 'vm@yahoo.com'),
    (4, 'zuckerberg', 'marc', 'marc@gmail.com'),
    (5, 'paul', 'pierre', 'pp@orange.fr'),
    (6, 'de vauclerc', 'lisa', 'lisadv@gmail.com'),
    (7, 'gluntig', 'éléonore', 'glunt@sfr.com'),
    (8, 'cavill', 'henry', 'henry@outlook.fr'),
    (9, 'hopper', 'lionel', 'hpp@gmail.com'),
    (10, 'tember', 'fabienne', 'fabienne@yopmail.com');




-- ==================================================================================================== --
-- ========= Explotation de la base de données foodly et de ses tables aliment et utilisateur ========= --
-- ==================================================================================================== --


-- inserts

-- Test d'insertion d'une nouvelle ligne dans la table utilisateur
INSERT INTO `utilisateur`(`nom`, `prenom`, `email`) VALUES( 'Durantay', 'Quentin', 'quentin@gmail.com' );

-- Test d'insertion de plusieurs nouvelles lignes dans la table utilisateur
INSERT INTO `utilisateur`(`nom`, `prenom`, `email`) VALUES
( 'Doe', 'John', 'john@yahoo.fr' ), 
( 'Smith', 'Jane', 'jane@hotmail.com' ), 
( 'Dupont', 'Sebastien', 'sebastien@orange.fr'), 
( 'Martin', 'Emilie', 'emilie@gmail.com' );

-- Test d'insertion de plusieurs lignes dans la table aliment
INSERT INTO `aliment`(`nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio` ) VALUES
( 'poire', 'monoprix', 27.5, 134, 0.2, 1.1, FALSE ), 
( 'pomme', 'monoprix', 19.1, 72, 0.2, 0.4, FALSE ), 
( 'oeuf', 'carrefour', 0.6, 82, 5.8, 6.9, TRUE ),
("lait d\'amande", 'bjorg', 4.5, 59, 3.9, 1.1, TRUE );

-- Ajout de haricots vert à la table aliment
INSERT INTO `aliment`( `id`, `nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio` ) VALUES
(
    '25',
    'haricots vert',
    'monoprix',
    3,
    25,
    0,
    1.7,
    FALSE
)


-- Les selects

-- Sélection des noms, prénoms, et email des éléments de la table utilisateur
SELECT `nom`, `prenom`, `email` FROM utilisateur;

-- Sélection des noms et calories des éléments de la table aliment
SELECT `nom`, `calories` FROM `aliment`

-- Sélection de l'élément de la table aliment dont l'id est 4
SELECT * FROM aliment WHERE id = 4;

-- Sélection des éléments de la table aliment dont le nom est poire
SELECT * FROM aliment WHERE nom = "poire";

-- Sélection des éléments dont les calories sont inférieur à 90
SELECT * FROM aliment WHERE calories < 90;

-- Sélection des éléments dont l'adresse mail fini par gmail.com
SELECT * FROM utilisateur WHERE email LIKE "%gmail.com";

-- Trie des élément de la table aliment par ordre croissant sur leur nombre de calories
SELECT * FROM aliment ORDER BY calories ASC;

-- Sélection des éléments dont les calories sont inférieur à 90 trié par ordre décroissant sur leur nombre de calories
SELECT * FROM aliment WHERE calories < 90 ORDER BY calories DESC;

-- Sélection des éléments dont les calories sont inférieur à 90 et le contenu en sucre est supérieur à 10
SELECT  *
FROM aliment
WHERE (calories < 90)
AND (sucre > 10)
ORDER BY calories DESC;

-- Sélection des élément qui ne sont pas bio
SELECT * FROM aliment WHERE bio = 0;

-- Selection des éléments qui ne sont pas bio trié par ordre décroissant de leur contenu en protéine
SELECT * FROM aliment WHERE bio = 0 ORDER BY proteines DESC;

--  Comptage du nombre d'élément dont l'adresse mail fini par gmail.com
SELECT COUNT(*) FROM utilisateur WHERE email LIKE "%gmail.com";

--  Comptage du nombre d'élément dont l'adresse mail fini par gmail.com
SELECT COUNT(email) 
FROM utilisateur 
WHERE email LIKE "%gmail.com";

-- Sélection des éléments dont le nom contient pomme
SELECT * 
FROM aliment 
WHERE nom like "%pomme%";

-- Comptage du nombre d'élement dont le nom contient pomme
SELECT COUNT(nom) 
FROM aliment 
WHERE nom LIKE "%pomme%";

-- Comptage du nombre d'élement dont le nom est unique et qui contient pomme
SELECT COUNT(DISTINCT nom) 
FROM aliment 
WHERE nom LIKE "%pomme%";

-- La même chose que la requête précédente mais cette fois avec un alias
SELECT  COUNT(DISTINCT nom) AS "produits différents contenant le mot pomme"
FROM aliment
WHERE nom LIKE "%pomme%";

-- Recherche de  l'élément de la table aliment dont le taux de sucre est le plus élévé
SELECT MAX(sucre)  AS "taux de sucre maximum"
FROM aliment;

-- Moyenne des calories des élément de aliment qui on plus de 30g de calorie
SELECT  AVG(calories) AS "calories moyennes des aliments > 30g"
FROM aliment
WHERE calories > 30;

-- Comptage des élément de la table aliment qui ne sont pas bio
SELECT COUNT(*) FROM aliment WHERE bio = FALSE;

-- Somme des calories de tous les éléments de la table aliment
SELECT SUM(calories) FROM aliment;

-- Recherche du plus faible taux de graisse parmi les élément de la table aliment
SELECT  MIN(graisses) AS "taux de graisse minimum"
FROM aliment;


-- Updates

-- Mise à jour de l'adresse mail d'un élément de la table utilisateur
UPDATE `utilisateur` SET `email` = 'quentind@gmail.com' WHERE `id` = '1';
-- Vérification de la modification
SELECT * FROM `utilisateur` WHERE `id` = '1';

-- Mise à jour de l'élément pomme de la table aliment en pomme golden
UPDATE `aliment` SET `nom` = 'pomme golden' WHERE `aliment`.`id` = 1;
-- vérification de la modification
SELECT * FROM `aliment` WHERE `id` = '1';


-- Création de views / sauvegarde des requêtes

-- création d'une vue qui contient la requête permettant d'affiche tous les utilisateurs dont l'adresse mail fini par gmail.com
CREATE VIEW utilisateurs_gmail_vw AS (
SELECT  *
FROM utilisateur
WHERE email LIKE "%gmail.com" );

-- Affiche de la vue ainsi créée
SELECT * FROM utilisateurs_gmail_vw;

-- Séléction des élément de la vue dont le prénom contient la lettre m
SELECT  *
FROM utilisateurs_gmail_vw
WHERE prenom LIKE "%m%";

-- Création d'une vue qui contient la requête permettant d'obtenir la liste des aliments non bio trié par ordre décroissant sur leur contenu en protéine
CREATE VIEW aliment_nonbio_vw AS (
SELECT  *
FROM aliment
WHERE bio = 0 ORDER BY proteines DESC);

-- Affichage de la vue ainsi créée
SELECT * FROM aliment_nonbio_vw;


-- Jointures

-- Création de la table langue
CREATE TABLE langues (id_langue INT AUTO_INCREMENT, nom_langue VARCHAR(50), PRIMARY KEY (id_langue));

-- Remplisage de la table langue
INSERT INTO `langues` (`id_langue`, `nom_langue`) VALUES ('1', 'Français'), ('2', 'Anglais');

-- Lien entre les deux tables
ALTER TABLE utilisateur ADD CONSTRAINT `fk_langue_utilisateur` FOREIGN KEY (`id_langue`) REFERENCES utilisateur (`id_langue`) ON DELETE CASC;

-- Jointure entre les deux tables:
-- INNER JOIN sur tout les éléments des tables
SELECT * FROM utilisateur INNER JOIN langues ON utilisateur.id_langue = langues.id_langue;

-- INNER JOIN qui ne prend en compte que les utilisateurs qui ont une adresse gmail et parle le français
SELECT  *
FROM utilisateur
INNER JOIN langues
ON utilisateur.id_langue = langues.id_langue
WHERE (utilisateur.email LIKE "%gmail%")
AND (langues.id_langue = 1);

-- INNER JOIN qui ne prend en compte que les utilisateurs qui ont une adresse gmail et parle le français
-- N'affiche que les noms (en majuscule), les prénoms, leur email, et leur langues
SELECT  utilisateur.id
       ,UPPER(utilisateur.nom) AS "NOM"
       ,utilisateur.prenom
       ,utilisateur.email
       ,langues.nom_langue     AS "LANGUE"
FROM utilisateur
INNER JOIN langues
ON utilisateur.id_langue = langues.id_langue
WHERE (utilisateur.email LIKE "%gmail%") AND(langues.id_langue = 1)
ORDER BY utilisateur.id DESC;

-- Jointure qui affiche le nom de famille des utilisateurs et la langue qu'ils ont choisi
SELECT UPPER(utilisateur.nom) AS "NOM", langues.nom_langue AS "LANGUE" FROM utilisateur
INNER JOIN langues
ON utilisateur.id_langue = langues.id_langue
WHERE (langues.id_langue = 1)


-- ALTER TABLE / UPDATE

-- Ajout d'un champ à la table aliment
ALTER TABLE aliment ADD vitamines_c FLOAT;

-- Ajout d'un champ à la table langue
ALTER TABLE langues ADD code_iso VARCHAR(20);
-- Remplisage de la nouvelle colonne
UPDATE `langues` SET `code_iso` = 'fr-fr' WHERE `langues`.`id_langue` = 1;
UPDATE `langues` SET `code_iso` = 'en-gb' WHERE `langues`.`id_langue` = 2;

-- Suppression d'un champ de la table aliment
ALTER TABLE `aliment` DROP `vitamines_c`;

-- Modification d'un champ existant de la table
ALTER TABLE aliment MODIFY calories FLOAT;


-- delete

-- suppression de l'utilisateur avec l'id = 2
DELETE FROM `utilisateur` WHERE `id` = '2';
-- Vérification
SELECT * FROM `utilisateur` WHERE `id` = '2'; -- L'élément avec l'id 2 ne doit plus apparaitre

-- suppression de tous les éléments d'une table
DELETE FROM utilisateur;
-- Vérification
SELECT * FROM `utilisateur`; -- La table doit être vide

-- suppression d'une table
DROP TABLE `utilisateur`;
-- Vérification
SHOW tables ; -- La table ne doit pas apparaitre

-- suppression d'une base de données
DROP DATABASE `foodly`;
SHOW DATABASES ; -- La base de données foodly ne doit pas apparaitre

-- suppression de l'élément de la table aliment dont le nom est 'pomme golden'
DELETE * FROM `aliment` WHERE `nom`='pomme golden';
-- vérification
SELECT * FROM `aliment`; -- L'élément de la table aliment dont le nom est 'pomme golden' ne doit pas apparaitre