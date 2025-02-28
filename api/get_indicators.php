<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database_indicators.db');

// Requête pour récupérer les indicateurs par thème
$query = "
    SELECT i.indicator_id, i.name, i.definition, i.unit_of_measurement, i.disaggregation, 
           i.data_collection_method, i.underlying_theory_of_change, i.indicator_level,
           CASE 
		   WHEN i.is_standard = 'FALSE' THEN 'no'
		   ELSE 'BMZ Standard indicator'
		   END as is_standard, 
		   i.additional_info,
           t.name AS theme_name, t.description AS theme_description, s.name AS sdg_name, s.sdg_id AS sdg_id, s.description as sdg_description, s.url AS sdg_url,
           GROUP_CONCAT(c.name || '|' || c.definition, '||') AS concepts,
           GROUP_CONCAT(p.name || '|' || p.definition, '||') AS packages,
           sec.name AS sectors, sec.description AS sectors_description,
           u.unit_shortname AS unit_shortname, u.unit_longname AS unit_longname
    FROM indicators i
    JOIN themes t ON i.theme_id = t.theme_id
    JOIN sdgs s ON i.sdg_id = s.sdg_id
    LEFT JOIN indicator_concepts ic ON i.indicator_id = ic.indicator_id
    LEFT JOIN indicator_packages ip ON i.indicator_id = ip.indicator_id
    LEFT JOIN key_concepts c ON ic.concept_id = c.concept_id
    LEFT JOIN packages p ON ip.package_id = p.package_id
    LEFT JOIN sectors sec ON t.sector_id = sec.sector_id
    LEFT JOIN units u ON i.responsible_unit = u.unit_id
    GROUP BY i.indicator_id
    ORDER BY sec.sector_id, t.name, i.name;
";

$stmt = $db->prepare($query);
$stmt->execute();

$indicators = $stmt->fetchAll(PDO::FETCH_ASSOC);


// Formate les concepts pour les inclure comme tableau
foreach ($indicators as &$indicator) {
    if (!empty($indicator['concepts'])) {
        $concepts = explode('||', $indicator['concepts']);
        $indicator['concepts'] = array_map(function ($concept) {
            [$name, $definition] = explode('|', $concept);
            return ['name' => $name, 'definition' => $definition];
        }, $concepts);
    } else {
        $indicator['concepts'] = [];
    }
}

// Formate les packages pour les inclure comme tableau
foreach ($indicators as &$indicator) {
    if (!empty($indicator['packages'])) {
        $packages = explode('||', $indicator['packages']);
        $indicator['packages'] = array_map(function ($package) {
            [$name, $definition] = explode('|', $package);
            return ['name' => $name, 'definition' => $definition];
        }, $packages);
    } else {
        $indicator['packages'] = [];
    }
}


// Retourne les données au format JSON
header('Content-Type: application/json');
echo json_encode($indicators);
?>
