<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database_indicators.db');

// Requête pour récupérer tous les thèmes
$query = "SELECT * FROM themes ORDER BY name;";
$stmt = $db->prepare($query);
$stmt->execute();

$themes = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Retourne les thèmes en JSON
header('Content-Type: application/json');
echo json_encode($themes);
?>
