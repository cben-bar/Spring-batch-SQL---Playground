-- Table des salariés
CREATE TABLE IF NOT EXISTS employes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    matricule VARCHAR(50) NOT NULL UNIQUE,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_embauche DATE NOT NULL,
    departement VARCHAR(100),
    poste VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table des disponibilités
CREATE TABLE IF NOT EXISTS disponibilites (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    employe_id BIGINT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE NOT NULL,
    type_disponibilite ENUM('DISPONIBLE', 'INDISPONIBLE', 'CONGES', 'MALADIE', 'FORMATION') NOT NULL,
    commentaire TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employe_id) REFERENCES employes(id),
    INDEX idx_employe_date (employe_id, date_debut, date_fin)
);

-- Données de test pour les employés
INSERT INTO employes (matricule, nom, prenom, email, date_embauche, departement, poste) VALUES
('EMP001', 'Dupont', 'Jean', 'jean.dupont@entreprise.com', '2020-01-15', 'IT', 'Développeur'),
('EMP002', 'Martin', 'Marie', 'marie.martin@entreprise.com', '2019-06-01', 'RH', 'Responsable RH'),
('EMP003', 'Bernard', 'Pierre', 'pierre.bernard@entreprise.com', '2021-03-10', 'Finance', 'Comptable');

-- Données de test pour les disponibilités (exemple sur 5 semaines)
INSERT INTO disponibilites (employe_id, date_debut, date_fin, type_disponibilite, commentaire) VALUES
-- Disponibilités pour Jean Dupont
(1, DATE_SUB(CURDATE(), INTERVAL 2 WEEK), DATE_SUB(CURDATE(), INTERVAL 1 WEEK), 'DISPONIBLE', 'Disponible normal'),
(1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 WEEK), 'CONGES', 'Vacances d''été'),
(1, DATE_ADD(CURDATE(), INTERVAL 2 WEEK), DATE_ADD(CURDATE(), INTERVAL 3 WEEK), 'DISPONIBLE', 'Disponible normal'),

-- Disponibilités pour Marie Martin
(2, DATE_SUB(CURDATE(), INTERVAL 2 WEEK), DATE_SUB(CURDATE(), INTERVAL 1 WEEK), 'DISPONIBLE', 'Disponible normal'),
(2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 WEEK), 'DISPONIBLE', 'Disponible normal'),
(2, DATE_ADD(CURDATE(), INTERVAL 2 WEEK), DATE_ADD(CURDATE(), INTERVAL 3 WEEK), 'FORMATION', 'Formation management'),

-- Disponibilités pour Pierre Bernard
(3, DATE_SUB(CURDATE(), INTERVAL 2 WEEK), DATE_SUB(CURDATE(), INTERVAL 1 WEEK), 'MALADIE', 'Arrêt maladie'),
(3, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 WEEK), 'DISPONIBLE', 'Disponible normal'),
(3, DATE_ADD(CURDATE(), INTERVAL 2 WEEK), DATE_ADD(CURDATE(), INTERVAL 3 WEEK), 'DISPONIBLE', 'Disponible normal'); 