-- =========================
-- DATABASE CREATION
-- =========================
CREATE DATABASE IF NOT EXISTS VulnerabilityPatchDB;
USE VulnerabilityPatchDB;

-- =========================
-- ADMIN TABLE
-- =========================
CREATE TABLE Admin (
admin_id INT AUTO_INCREMENT PRIMARY KEY,
admin_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
role ENUM('Security Admin', 'Lab Admin', 'Super Admin') NOT NULL,
contact_number VARCHAR(15),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- ASSET TABLE
-- =========================
CREATE TABLE Asset (
asset_id INT AUTO_INCREMENT PRIMARY KEY,
asset_name VARCHAR(50) NOT NULL,
asset_type ENUM('Desktop', 'Laptop', 'Server') NOT NULL,
os_version VARCHAR(50),
location VARCHAR(50),
purchase_date DATE,
admin_id INT,
FOREIGN KEY (admin_id) REFERENCES Admin(admin_id)
ON DELETE SET NULL
);

-- =========================
-- VULNERABILITY TABLE
-- =========================
CREATE TABLE Vulnerability (
vulnerability_id INT AUTO_INCREMENT PRIMARY KEY,
cve_id VARCHAR(20) UNIQUE NOT NULL,
severity ENUM('Low', 'Medium', 'High', 'Critical') NOT NULL,
description VARCHAR(255),
discovery_date DATE,
status ENUM('Open', 'Resolved') DEFAULT 'Open'
);

-- =========================
-- ASSET-VULNERABILITY MAP
-- =========================
CREATE TABLE Asset_Vulnerability_Map (
map_id INT AUTO_INCREMENT PRIMARY KEY,
asset_id INT,
vulnerability_id INT,
detected_date DATE,
UNIQUE(asset_id, vulnerability_id),
FOREIGN KEY (asset_id) REFERENCES Asset(asset_id)
ON DELETE CASCADE,
FOREIGN KEY (vulnerability_id) REFERENCES Vulnerability(vulnerability_id)
ON DELETE CASCADE
);

-- =========================
-- PATCH TABLE
-- =========================
CREATE TABLE Patch (
patch_id INT AUTO_INCREMENT PRIMARY KEY,
patch_name VARCHAR(50),
release_date DATE,
vulnerability_id INT,
version VARCHAR(20),
FOREIGN KEY (vulnerability_id) REFERENCES Vulnerability(vulnerability_id)
ON DELETE CASCADE
);

-- =========================
-- PATCH STATUS HISTORY
-- =========================
CREATE TABLE Patch_Status_History (
status_id INT AUTO_INCREMENT PRIMARY KEY,
asset_id INT,
patch_id INT,
status ENUM('Pending', 'Applied', 'Failed') DEFAULT 'Pending',
updated_date DATE,
applied_by INT,
FOREIGN KEY (asset_id) REFERENCES Asset(asset_id),
FOREIGN KEY (patch_id) REFERENCES Patch(patch_id),
FOREIGN KEY (applied_by) REFERENCES Admin(admin_id)
);

-- =========================
-- RISK SCORE TABLE
-- =========================
CREATE TABLE Risk_Score (
risk_id INT AUTO_INCREMENT PRIMARY KEY,
asset_id INT,
risk_level ENUM('Low', 'Medium', 'High', 'Critical'),
score INT CHECK (score BETWEEN 1 AND 100),
calculated_date DATE,
FOREIGN KEY (asset_id) REFERENCES Asset(asset_id)
ON DELETE CASCADE
);

-- =========================
-- AUDIT LOG TABLE
-- =========================
CREATE TABLE Audit_Log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
action VARCHAR(100) NOT NULL,
timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
details VARCHAR(255),
user_id INT,
FOREIGN KEY (user_id) REFERENCES Admin(admin_id)
ON DELETE SET NULL
);

-- =========================
-- INDEXES (IMPORTANT FOR PERFORMANCE)
-- =========================
CREATE INDEX idx_asset ON Asset(asset_name);
CREATE INDEX idx_cve ON Vulnerability(cve_id);
CREATE INDEX idx_patch_status ON Patch_Status_History(status);

-- =========================
-- SAMPLE VIEW (FOR COMPLEX QUERIES)
-- =========================
CREATE VIEW Vulnerable_Assets AS
SELECT
A.asset_id,
A.asset_name,
V.cve_id,
V.severity,
P.status
FROM Asset A
JOIN Asset_Vulnerability_Map AV ON A.asset_id = AV.asset_id
JOIN Vulnerability V ON AV.vulnerability_id = V.vulnerability_id
LEFT JOIN Patch_Status_History P ON A.asset_id = P.asset_id;
