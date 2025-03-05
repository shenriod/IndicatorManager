<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database_indicators.db');

// Requête pour récupérer les doublons possibles
$query = "
    SELECT pd.indicator_id1, i1.name AS indicator1_name, 
           pd.indicator_id2, i2.name AS indicator2_name, 
           pd.comments
    FROM possible_duplicates pd
    JOIN indicators i1 ON pd.indicator_id1 = i1.indicator_id
    JOIN indicators i2 ON pd.indicator_id2 = i2.indicator_id
    ORDER BY pd.indicator_id1, pd.indicator_id2;
";

$stmt = $db->prepare($query);
$stmt->execute();
$duplicates = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Retourne les données au format JSON
header('Content-Type: application/json');
echo json_encode($duplicates);
?>

