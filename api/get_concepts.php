<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database.db');

// Requête pour récupérer tous les concepts
$query = "SELECT * FROM key_concepts ORDER BY name;";
$stmt = $db->prepare($query);
$stmt->execute();

$concepts = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Retourne les concepts en JSON
header('Content-Type: application/json');
echo json_encode($concepts);
?>

