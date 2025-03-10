<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database_indicators.db');

// Requête pour obtenir le nombre total d'indicateurs
$query = "SELECT COUNT(*) AS total_indicators FROM indicators";

$stmt = $db->prepare($query);
$stmt->execute();

$result = $stmt->fetch(PDO::FETCH_ASSOC);

// Retourne les données au format JSON
header('Content-Type: application/json');
echo json_encode($result);
?>

