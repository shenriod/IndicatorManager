<?php
// Connexion à la base SQLite
$db = new PDO('sqlite:../db/database_indicators.db');

// Requête pour récupérer les indicateurs par thème
$query = "
	SELECT i.indicator_id, i.name, i.definition, 

	sec.name AS sectors, sec.description AS sectors_description,
	t.name AS theme_name, t.description AS theme_description, 

	i.unit_of_measurement, i.disaggregation, i.data_collection_method, 
	i.underlying_theory_of_change, i.indicator_level, i.additional_info,
	i.is_standard, i.indicator_formulation, 
           
	s.name AS sdg_name, s.sdg_id AS sdg_id, s.description AS sdg_description, s.url AS sdg_url,

	(SELECT GROUP_CONCAT(c.name || '|' || c.definition, '||') 
	FROM indicator_concepts ic
	JOIN key_concepts c ON ic.concept_id = c.concept_id
	WHERE ic.indicator_id = i.indicator_id) AS concepts,

	(SELECT GROUP_CONCAT(p.name || '|' || p.definition, '||') 
	FROM indicator_packages ip
	JOIN packages p ON ip.package_id = p.package_id
	WHERE ip.indicator_id = i.indicator_id) AS packages,

	(SELECT GROUP_CONCAT(sp.topic_name, '||') 
	FROM indicator_saptopics isap
	JOIN sap_topics sp ON isap.topic_id = sp.topic_id
	WHERE isap.indicator_id = i.indicator_id) AS sap_topics,

	u.unit_shortname AS unit_shortname, u.unit_longname AS unit_longname

	FROM indicators i
	JOIN themes t ON i.theme_id = t.theme_id
	JOIN sdgs s ON i.sdg_id = s.sdg_id
	LEFT JOIN sectors sec ON t.sector_id = sec.sector_id
	LEFT JOIN units u ON i.responsible_unit = u.unit_id

	GROUP BY i.indicator_id
	ORDER BY sec.name, t.name, i.name;
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
