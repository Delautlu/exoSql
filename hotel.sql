-- ex 1
SELECT hot_nom, hot_ville FROM hotel
SELECT cli_nom, cli_prenom, cli_adresse FROM client
SELECT sta_nom FROM station WHERE sta_altitude <1000;
SELECT cha_numero FROM chambre WHERE  cha_capacite >1;
SELECT cli_nom FROM client NOT LIKE  cli_ville != Londres;
SELECT hot_nom, hot_ville From hotel WHERE hot_categorie >3;

-- ex 2
SELECT sta_nom, hot_nom, hot_categorie, hot_ville FROM hotel JOIN station;
SELECT hot_nom, hot_categorie, hot_ville, cha_numero FROM hotel JOIN chambre;
SELECT hot_nom, hot_categorie, hot_ville, cha_numero WHERE cha_capacite >1 LIKE hot_ville Bretou FROM hotel JOIN chambre;
SELECT cli_nom, hot_nom, res_dat FROM client JOIN hotel JOIN reservation;
SELECT sta_nom, hot_nom, cha_numero, cha_capacite FROM station JOIN hotel JOIN chambre;
SELECT cli_nom, hot_nom,res_date_debut, DATEDIFF (res_date_fin, res_date_debut) AS "durée séjour"
FROM client
JOIN reservation ON res_cli_id = cli_id
JOIN chambre ON cha_id = res_cha_id
JOIN hotel ON hot_id = cha_hot_id;

-- ex 3
SELECT hot_id, hot_sta_id, FROM hotel GROUP BY hot_id;

SELECT cha_hot_id, hot_sta_id, sta_id FROM chambre
JOIN hotel ON hot_sta_id = cha_hot_id
JOIN station ON sta_id = cha_hot_id

SELECT cha_hot_id, hot_sta_id, sta_id FROM chambre
JOIN hotel ON hot_sta_id = cha_hot_id
JOIN station ON sta_id = cha_hot_id
WHERE cha_capacite >1;

SELECT cli_id, res_cli_id, cha_hot_id, hot_id
FROM client
JOIN reservation ON res_cha_id = cli_id
JOIN chambre ON cha_hot_id = cli_id
JOIN hotel ON hot_id = res_cha_id

SELECT sta_nom, AVG (DATEDIFF (res_date_fin, res_date_debut) ) AS "moyenne"
FROM reservation
JOIN chambre ON cha_hot_id = res_cha_id
JOIN hotel ON hot_sta_id = res_cha_id
JOIN station ON sta_id = cha_hot_id