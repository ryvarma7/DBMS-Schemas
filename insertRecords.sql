-- =========================
-- INSERT INTO ADMIN
-- =========================
INSERT INTO Admin (admin_name, email, role, contact_number) VALUES
('Ravi Kumar', '[ravi@srm.edu.in](mailto:ravi@srm.edu.in)', 'Security Admin', '9876543210'),
('Anitha Rao', '[anitha@srm.edu.in](mailto:anitha@srm.edu.in)', 'Lab Admin', '9123456780'),
('Karan Mehta', '[karan@srm.edu.in](mailto:karan@srm.edu.in)', 'Super Admin', '9988776655'),
('Sneha Iyer', '[sneha@srm.edu.in](mailto:sneha@srm.edu.in)', 'Security Admin', '9090909090');

-- =========================
-- INSERT INTO ASSET
-- =========================
INSERT INTO Asset (asset_name, asset_type, os_version, location, purchase_date, admin_id) VALUES
('Lab-PC-01', 'Desktop', 'Windows 10', 'Lab A', '2022-01-10', 1),
('Lab-PC-02', 'Desktop', 'Windows 11', 'Lab A', '2022-03-15', 2),
('Lab-PC-03', 'Desktop', 'Ubuntu 22.04', 'Lab B', '2023-01-01', 1),
('Lab-PC-04', 'Desktop', 'Windows 10', 'Lab B', '2022-11-11', 2),
('Server-01', 'Server', 'Linux', 'Server Room', '2021-05-05', 3),
('Server-02', 'Server', 'Linux', 'Server Room', '2021-07-07', 3),
('Laptop-01', 'Laptop', 'Windows 11', 'Faculty Room', '2023-02-02', 4),
('Laptop-02', 'Laptop', 'Windows 10', 'Faculty Room', '2023-04-04', 4);

-- =========================
-- INSERT INTO VULNERABILITY
-- =========================
INSERT INTO Vulnerability (cve_id, severity, description, discovery_date) VALUES
('CVE-2023-1001', 'High', 'Browser exploit vulnerability', '2023-06-01'),
('CVE-2023-1002', 'Medium', 'Kernel memory leak', '2023-06-10'),
('CVE-2023-1003', 'Critical', 'Remote code execution', '2023-07-01'),
('CVE-2023-1004', 'Low', 'UI spoofing issue', '2023-05-20'),
('CVE-2023-1005', 'High', 'Privilege escalation', '2023-08-01');

-- =========================
-- INSERT INTO ASSET_VULNERABILITY_MAP
-- =========================
INSERT INTO Asset_Vulnerability_Map (asset_id, vulnerability_id, detected_date) VALUES
(1,1,'2023-06-02'),
(1,2,'2023-06-11'),
(2,1,'2023-06-05'),
(3,3,'2023-07-02'),
(4,4,'2023-05-25'),
(5,3,'2023-07-03'),
(6,5,'2023-08-05'),
(7,2,'2023-06-15'),
(8,1,'2023-06-18');

-- =========================
-- INSERT INTO PATCH
-- =========================
INSERT INTO Patch (patch_name, release_date, vulnerability_id, version) VALUES
('Browser Patch v1', '2023-06-15', 1, '1.0'),
('Kernel Fix v2', '2023-06-20', 2, '2.1'),
('RCE Patch v3', '2023-07-10', 3, '3.0'),
('UI Fix v1', '2023-05-30', 4, '1.2'),
('Privilege Patch v2', '2023-08-10', 5, '2.5');

-- =========================
-- INSERT INTO PATCH_STATUS_HISTORY
-- =========================
INSERT INTO Patch_Status_History (asset_id, patch_id, status, updated_date, applied_by) VALUES
(1,1,'Applied','2023-06-20',1),
(1,2,'Pending','2023-06-25',2),
(2,1,'Applied','2023-06-22',2),
(3,3,'Failed','2023-07-15',1),
(4,4,'Applied','2023-06-01',2),
(5,3,'Pending','2023-07-20',3),
(6,5,'Applied','2023-08-15',3),
(7,2,'Applied','2023-06-30',4),
(8,1,'Pending','2023-06-28',4);

-- =========================
-- INSERT INTO RISK_SCORE
-- =========================
INSERT INTO Risk_Score (asset_id, risk_level, score, calculated_date) VALUES
(1,'Medium',55,'2023-06-21'),
(2,'Low',30,'2023-06-22'),
(3,'Critical',90,'2023-07-16'),
(4,'Low',20,'2023-06-02'),
(5,'High',80,'2023-07-21'),
(6,'High',75,'2023-08-16'),
(7,'Medium',50,'2023-07-01'),
(8,'Medium',60,'2023-06-29');

-- =========================
-- INSERT INTO AUDIT_LOG
-- =========================
INSERT INTO Audit_Log (action, details, user_id) VALUES
('Patch Applied','Browser patch applied to Lab-PC-01',1),
('Patch Pending','Kernel patch pending on Lab-PC-01',2),
('Vulnerability Detected','CVE-2023-1003 detected on Server-01',1),
('Patch Failed','Patch failed on Lab-PC-03',1),
('Risk Calculated','Risk score updated for Server-02',3),
('Patch Applied','Privilege patch applied to Server-02',3),
('Admin Login','Admin logged into system',4);
