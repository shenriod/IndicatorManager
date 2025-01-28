<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database.db');

// Récupération des données POST
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['indicator_id'], $data['name'], $data['definition'], $data['unit_of_measurement'], $data['disaggregation'], $data['data_collection_method'], $data['typical_frequency'], $data['underlying_theory_of_change'], $data['theme_id'], $data['sdg_id'])) {
    // Mise à jour des champs de l'indicateur
    $query = "
        UPDATE indicators
        SET name = :name,
            definition = :definition,
            unit_of_measurement = :unit_of_measurement,
            disaggregation = :disaggregation,
            data_collection_method = :data_collection_method,
            typical_frequency = :typical_frequency,
            underlying_theory_of_change = :underlying_theory_of_change,
            theme_id = :theme_id,
            sdg_id = :sdg_id
        WHERE indicator_id = :indicator_id;
    ";

    $stmt = $db->prepare($query);
    $stmt->bindValue(':name', $data['name'], PDO::PARAM_STR);
    $stmt->bindValue(':definition', $data['definition'], PDO::PARAM_STR);
    $stmt->bindValue(':unit_of_measurement', $data['unit_of_measurement'], PDO::PARAM_STR);
    $stmt->bindValue(':disaggregation', $data['disaggregation'], PDO::PARAM_STR);
    $stmt->bindValue(':data_collection_method', $data['data_collection_method'], PDO::PARAM_STR);
    $stmt->bindValue(':typical_frequency', $data['typical_frequency'], PDO::PARAM_STR);
    $stmt->bindValue(':underlying_theory_of_change', $data['underlying_theory_of_change'], PDO::PARAM_STR);
    $stmt->bindValue(':theme_id', $data['theme_id'], PDO::PARAM_INT);
    $stmt->bindValue(':sdg_id', $data['sdg_id'], PDO::PARAM_STR);
    $stmt->bindValue(':indicator_id', $data['indicator_id'], PDO::PARAM_INT);

    if ($stmt->execute()) {
        // Mise à jour des concepts liés à cet indicateur
        $indicatorId = $data['indicator_id'];
        $conceptIds = $data['concept_ids'] ?? [];

        // Supprime les concepts existants pour cet indicateur
        $deleteQuery = "DELETE FROM indicator_concepts WHERE indicator_id = :indicator_id;";
        $deleteStmt = $db->prepare($deleteQuery);
        $deleteStmt->bindValue(':indicator_id', $indicatorId, PDO::PARAM_INT);
        $deleteStmt->execute();

        // Ajoute les nouveaux concepts
        if (!empty($conceptIds)) {
            $insertQuery = "INSERT INTO indicator_concepts (indicator_id, concept_id) VALUES (:indicator_id, :concept_id);";
            $insertStmt = $db->prepare($insertQuery);
            foreach ($conceptIds as $conceptId) {
                $insertStmt->bindValue(':indicator_id', $indicatorId, PDO::PARAM_INT);
                $insertStmt->bindValue(':concept_id', $conceptId, PDO::PARAM_INT);
                $insertStmt->execute();
            }
        }

        echo json_encode(['success' => true, 'message' => 'Indicator updated successfully.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Failed to update indicator.']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid input.']);
}
?>

