
-- EX 1 
SELECT numcom FROM entcom WHERE numfou = 9120

-- EX 2 
SELECT numfou FROM entcom GROUP BY numfou

-- EX 3
SELECT COUNT(DISTINCT numfou) AS "fournisseurs",
COUNT(numcom)  AS " commandes" FROM entcom 

-- EX 4
SELECT codart, libart, stkale, stkphy, qteann from produit
WHERE stkphy <= stkale AND qteann < 1000

-- EX 5
SELECT nomfou, posfou  FROM fournis 
WHERE left (posfou,2) = "75" OR left (posfou,2) = "78" OR left (posfou,2) = "92" OR left (posfou,2) = "77"
ORDER BY posfou DESC, nomfou ASC ;

-- EX 6
SELECT numcom FROM entcom
WHERE month (datcom) = "03" OR month (datcom) = "04"

-- EX 7
SELECT numcom, datcom FROM entcom
WHERE obscom != ""

-- EX 8
SELECT numcom, SUM(qtecde*priuni) as "total"
FROM ligcom GROUP BY numcom
ORDER BY SUM(qtecde*priuni) DESC

-- EX 9
SELECT numcode, SUM(qtecde*priuni) as "total" FROM ligcom
WHERE qtecde < 1000
GROUP BY numcom
HAVING SUM(qtecde*priuni) > 10000

-- EX 10
SELECT nomfou, numcom,datcom FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou

-- EX 11
SELECT entcom.numcom, numfou, libart, SUM(qtecde*priuni) as "total"
FROM entcom
JOIN ligcom ON ligcom.numcom = entcom.numcom
JOIN produit ON produit.codart = ligcom.codart
WHERE obscom LIKE "%urgent%"
GROUP BY entcom.numcom

-- EX 12
SELECT COUNT(codart), nomfou 
FROM fournis
JOIN vente ON vente.numfou = fournis.numfou
GROUP BY fournis.numfou

SELECT COUNT(codart), nomfou
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
JOIN ligcom ON ligcom.numcom = entcom.numcom
GROUP BY fournis.numfou

-- EX 13
SELECT numcom, datcom 
FROM entcom
WHERE numfou = 120


SELECT numcom, datcom 
FROM entcom
WHERE (
	SELECT numcom, datcom 
	FROM entcom
)

-- EX 14
SELECT libart, prix1
FROM produit
JOIN vente ON vente.codart = produit.codart
WHERE libart like "r%" (
	SELECT libart, prix1
	FROM vente
	WHERE libart < prix1
)

-- EX 15
SELECT produit.codart  FROM produit
JOIN vente ON vente.codart = produit.codart
JOIN fournis ON fournis.numfou = vente.numfou
WHERE stkphy  <= (stkale * 150 / 100)
ORDER BY codart, fournis.numfou

-- EX 16
SELECT produit.codart  FROM produit
JOIN vente ON vente.codart = produit.codart
JOIN fournis ON fournis.numfou = vente.numfou
WHERE stkphy  <= (stkale * 150 / 100) AND delliv <= 30
ORDER BY fournis.numfou, codart

-- EX 17
SELECT fournis.numfou, vente.codart, nomfou, sum(stkphy)
FROM fournis, vente, produit
WHERE  fournis.numfou = vente.numfou 
	and vente.codart = produit.codart 
	and  vente.delliv <=30
	and  stkphy  <= (stkale * 150 / 100)
GROUP BY fournis.numfou, vente.codart, nomfou
ORDER BY sum(stkphy)  desc

-- EX 18
SELECT ligcom.codart, sum(qtecde)   FROM ligcom
JOIN produit ON produit.codart = ligcom.codart
WHERE  qtecde >= (qteann * 90 / 100)
GROUP BY codart

-- EX 19
SELECT fournis.numfou, nomfou, sum(qtecde * priuni * 1.2060)  FROM  fournis
JOIN entcom ON entcom.numfou = fournis.numfou
JOIN ligcom ON ligcom.numcom = entcom.numcom
WHERE  YEAR (datcom) = "2018"
GROUP BY fournis.numfou, nomfou


-- --------------------------------------------------------------------------
--  EX 1
UPDATE vente
SET prix1 = prix1 * 1.04,
prix2 = prix2 * 1.02
WHERE numfou = 9180 

-- EX 2
UPDATE vente
SET prix2 = prix1
WHERE prix2 = 0 

-- EX 3
UPDATE entcom
JOIN fournis ON fournis.numfou = entcom.numfou
SET obscom = "*****"
WHERE satisf < 5 

-- EX 4
DELETE FROM vente
WHERE codart = "I110"
