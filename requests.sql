-- Question 1:

SELECT titre_not 
FROM notices 
WHERE id_not = 12;

-- Question 2:

SELECT titre_not 
FROM notices 
WHERE annee_not > 2000
ORDER BY titre_not ASC;

-- Question 3:

SELECT titre_not .
FROM notices 
WHERE titre_not LIKE '%Informatique%';

-- Question 4:

SELECT DISTINCT code_lg 
FROM langues;

-- Question 5:

SELECT cote_exe 
FROM exemplaires 
WHERE id_not_exe = 12;

-- Question 6:

SELECT nom_aut, prenom_aut 
FROM auteurs 
WHERE prenom_aut = 'Jean'
ORDER BY nom_aut ASC;

-- Question 7:

SELECT nom_aut, prenom_aut 
FROM auteurs 
WHERE nom_aut LIKE 'A%'
ORDER BY nom_aut ASC;

-- Question 8:

SELECT titre_not, creation_not 
FROM notices 
ORDER BY creation_not DESC
LIMIT 10;

-- Question 9:

SELECT n.titre_not
FROM notices n
JOIN exemplaires e ON n.id_not = e.id_not_exe
JOIN langues l ON l.id_lg = e.id_not_exe
WHERE l.code_lg = 'en' -- Supposant que 'en' est le code pour anglais
ORDER BY n.titre_not ASC;

-- Question 10:

SELECT n.titre_not
FROM notices n
JOIN editeurs e ON n.id_ed_not = e.id_ed
WHERE e.nom_ed = 'Nathan'
ORDER BY n.titre_not ASC;

-- Question 11:

SELECT a.nom_aut, a.prenom_aut
FROM auteurs a
JOIN ecrire e ON a.id_aut = e.id_aut_ecr
WHERE e.id_not_ecr = 12;

-- Question 12:

SELECT ed.nom_ed
FROM notices n
JOIN editeurs ed ON n.id_ed_not = ed.id_ed
WHERE n.id_not = 12;

-- Question 13 :

SELECT c.nom_cat
FROM categories c
JOIN noeuds n ON c.id_cat = n.id_cat_nds
WHERE n.id_parent_nds = 1;

-- Question 14 :

SELECT n.titre_not
FROM notices n
JOIN appartenir a ON n.id_not = a.id_not_app
WHERE a.id_cat_app = 16
ORDER BY n.titre_not ASC;

-- Question 15 :

SELECT COUNT(*) AS total_notices
FROM notices;

-- Question 16 :

SELECT COUNT(*) AS notices_sans_ISBN
FROM notices
WHERE code_not IS NULL OR code_not = '';

-- Question 17 :

SELECT l.code_lg, COUNT(n.id_not) AS nombre_notices
FROM notices n
JOIN exemplaires e ON n.id_not = e.id_not_exe
JOIN langues l ON e.id_not_exe = l.id_lg
GROUP BY l.code_lg;

-- Question 18 :

SELECT n.annee_not, COUNT(e.id_exe) AS nombre_exemplaires
FROM notices n
JOIN exemplaires e ON n.id_not = e.id_not_exe
GROUP BY n.annee_not;

-- Question 19 :

SELECT a.nom_aut, a.prenom_aut, COUNT(e.id_exe) AS nombre_exemplaires
FROM auteurs a
JOIN ecrire ec ON a.id_aut = ec.id_aut_ecr
JOIN notices n ON ec.id_not_ecr = n.id_not
JOIN exemplaires e ON n.id_not = e.id_not_exe
GROUP BY a.nom_aut, a.prenom_aut
HAVING COUNT(e.id_exe) >= 10;

-- Question 20 :

SELECT nom_aut, COUNT(*) AS nombre_homonymes
FROM auteurs
GROUP BY nom_aut
HAVING COUNT(*) > 1;

-- NEW QUESTION

-- Question 21 :

SELECT NumCde
FROM COMMANDES
WHERE DateCde = '2020-02-20';

-- Question 22 :

SELECT P.RefProd, P.Prix, C.Qte
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd;

-- Question 23 :

SELECT RefProd, Designation, Prix, Stock
FROM PRODUITS
WHERE Prix > 15 AND Stock < 5;

-- Question 24 :

SELECT DISTINCT Cl.NomCli, Cl.PrenomCli
FROM CLIENTS Cl
JOIN COMMANDES C ON Cl.NumCli = C.NumCli
WHERE C.DateCde BETWEEN '2020-02-01' AND '2020-02-29';

-- Question 25 :

SELECT P.RefProd
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd
JOIN COMMANDES Co ON Co.NumCde = C.NumCde
JOIN CLIENTS Cl ON Co.NumCli = Cl.NumCli
WHERE Cl.NomCli = 'Bydull';

-- Question 26 :

SELECT P.Designation, P.Prix
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd
JOIN COMMANDES Co ON Co.NumCde = C.NumCde
JOIN CLIENTS Cl ON Co.NumCli = Cl.NumCli
WHERE Cl.VilleCli IN ('Caen', 'Lisieux', 'Bayeux');

-- Question 27 :

SELECT DISTINCT P.RefProd
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd
JOIN COMMANDES Co ON Co.NumCde = C.NumCde
JOIN CLIENTS Cl ON Co.NumCli = Cl.NumCli
WHERE Cl.NomCli NOT LIKE 'T%' AND Co.DateCde = '2020-02-15';

-- Question 28 :

SELECT DISTINCT Cl.NomCli, Cl.PrenomCli
FROM CLIENTS Cl
JOIN COMMANDES C ON Cl.NumCli = C.NumCli
WHERE C.DateCde BETWEEN '2020-02-01' AND '2020-02-29'
ORDER BY Cl.NomCli;

-- Question 29 :

SELECT RefProd, Designation, Prix, Stock
FROM PRODUITS
WHERE Prix > 15 AND Stock < 5
ORDER BY Designation ASC, Stock DESC;

-- Question 30 :

SELECT COUNT(*)
FROM PRODUITS;

-- Question 31 :

SELECT AVG(P.Prix)
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd
WHERE C.NumCde = 158;

-- Question 32 :

SELECT DISTINCT RefProd, Designation, Prix, Stock
FROM PRODUITS
WHERE Prix > 15 AND Stock < 5;

-- Question 33 :

SELECT SUM(P.Prix * C.Qte) AS MontantTotal
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd
WHERE C.NumCde = 158;

-- Question 34 :

SELECT COUNT(*)
FROM COMMANDES Co
JOIN CLIENTS Cl ON Co.NumCli = Cl.NumCli
WHERE Cl.NomCli = 'Dupont' AND Cl.VilleCli = 'Cherbourg';

-- Question 35 :

SELECT SUM(P.Prix * C.Qte) AS MontantTotal
FROM PRODUITS P
JOIN COMPORTER C ON P.RefProd = C.RefProd
JOIN COMMANDES Co ON Co.NumCde = C.NumCde
JOIN CLIENTS Cl ON Co.NumCli = Cl.NumCli
WHERE Cl.NomCli = 'Dupont' AND Cl.VilleCli = 'Cherbourg';

-- Question 36 :

SELECT Cl.NumCli, Cl.NomCli, Cl.PrenomCli, COUNT(Co.NumCde) AS NbCommandes
FROM CLIENTS Cl
JOIN COMMANDES Co ON Cl.NumCli = Co.NumCli
WHERE Cl.VilleCli = 'Cherbourg' AND Co.DateCde BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY Cl.NumCli, Cl.NomCli, Cl.PrenomCli;

-- Question 37 :

SELECT MIN(DateCde)
FROM COMMANDES;
