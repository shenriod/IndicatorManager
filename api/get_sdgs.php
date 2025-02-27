<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database_indicators.db');

// Requête pour récupérer tous les SDGs
$query = "SELECT * FROM sdgs ORDER BY name;";
$stmt = $db->prepare($query);
$stmt->execute();

$sdgs = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Retourne les SDGs en JSON
header('Content-Type: application/json');
echo json_encode($sdgs);
?>
