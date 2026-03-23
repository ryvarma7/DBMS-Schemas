INSERT INTO Admin (admin_name, email, role, contact_number) VALUES
('Ravi Kumar', 'ravi@srm.edu.in', 'Security Admin', '9876543210'),
('Anitha Rao', 'anitha@srm.edu.in', 'Lab Admin', '9123456780'),
('Karan Mehta', 'karan@srm.edu.in', 'Super Admin', '9988776655'),
('Sneha Iyer', 'sneha@srm.edu.in', 'Security Admin', '9090909090'),
('Arjun Patel', 'arjun@srm.edu.in', 'Lab Admin', '9012345678');

INSERT INTO Asset (asset_name, asset_type, os_version, location, purchase_date, admin_id) VALUES
('Lab-PC-01', 'Desktop', 'Windows 10', 'Lab A', '2022-01-10', 1),
('Lab-PC-02', 'Desktop', 'Windows 11', 'Lab A', '2022-03-15', 2),
('Lab-PC-03', 'Desktop', 'Ubuntu 22.04', 'Lab A', '2023-01-01', 1),
('Lab-PC-04', 'Desktop', 'Windows 10', 'Lab A', '2022-11-11', 2),
('Lab-PC-05', 'Desktop', 'Windows 11', 'Lab A', '2023-02-20', 1),

('Lab-PC-06', 'Desktop', 'Ubuntu 20.04', 'Lab B', '2022-05-05', 2),
('Lab-PC-07', 'Desktop', 'Windows 10', 'Lab B', '2022-06-06', 1),
('Lab-PC-08', 'Desktop', 'Windows 11', 'Lab B', '2023-03-03', 2),
('Lab-PC-09', 'Desktop', 'Ubuntu 22.04', 'Lab B', '2023-04-04', 1),
('Lab-PC-10', 'Desktop', 'Windows 10', 'Lab B', '2022-08-08', 2),

('Server-01', 'Server', 'Linux', 'Server Room', '2021-05-05', 3),
('Server-02', 'Server', 'Linux', 'Server Room', '2021-07-07', 3),
('Server-03', 'Server', 'Linux', 'Data Center', '2022-09-09', 3),
('Server-04', 'Server', 'Linux', 'Data Center', '2022-10-10', 3),

('Laptop-01', 'Laptop', 'Windows 11', 'Faculty Room', '2023-02-02', 4),
('Laptop-02', 'Laptop', 'Windows 10', 'Faculty Room', '2023-04-04', 4),
('Laptop-03', 'Laptop', 'Ubuntu 20.04', 'Library', '2023-06-01', 5),
('Laptop-04', 'Laptop', 'Windows 11', 'Library', '2023-07-07', 5),
('Laptop-05', 'Laptop', 'Windows 10', 'Admin Block', '2023-08-08', 4),
('Laptop-06', 'Laptop', 'Ubuntu 22.04', 'Admin Block', '2023-09-09', 5);

INSERT INTO Vulnerability (cve_id, severity, description, discovery_date, status) VALUES
('CVE-2023-1001', 'High', 'Browser exploit vulnerability', '2023-06-01', 'Open'),
('CVE-2023-1002', 'Medium', 'Kernel memory leak', '2023-06-10', 'Resolved'),
('CVE-2023-1003', 'Critical', 'Remote code execution', '2023-07-01', 'Open'),
('CVE-2023-1004', 'Low', 'UI spoofing issue', '2023-05-20', 'Resolved'),
('CVE-2023-1005', 'High', 'Privilege escalation', '2023-08-01', 'Open'),
('CVE-2023-1006', 'Medium', 'Authentication bypass', '2023-09-01', 'Open');

INSERT INTO Asset_Vulnerability_Map (asset_id, vulnerability_id, detected_date) VALUES
(1,1,'2023-06-02'),
(1,2,'2023-06-11'),
(2,1,'2023-06-05'),
(3,3,'2023-07-02'),
(4,4,'2023-05-25'),
(5,5,'2023-08-02'),
(6,2,'2023-06-12'),
(7,1,'2023-06-15'),
(8,3,'2023-07-05'),
(9,6,'2023-09-05'),
(10,2,'2023-06-20'),
(11,3,'2023-07-05'),
(12,5,'2023-08-10'),
(13,3,'2023-07-11'),
(14,6,'2023-09-15'),
(15,1,'2023-06-25'),
(16,2,'2023-06-28'),
(17,6,'2023-09-20'),
(18,4,'2023-05-30'),
(19,5,'2023-08-18'),
(20,1,'2023-06-22');

INSERT INTO Patch (patch_name, release_date, vulnerability_id, version) VALUES
('Browser Patch v1', '2023-06-15', 1, '1.0'),
('Kernel Fix v2', '2023-06-20', 2, '2.1'),
('RCE Patch v3', '2023-07-10', 3, '3.0'),
('UI Fix v1', '2023-05-30', 4, '1.2'),
('Privilege Patch v2', '2023-08-10', 5, '2.5'),
('Auth Fix v1', '2023-09-10', 6, '1.1');

INSERT INTO Patch_Status_History (asset_id, patch_id, status, updated_date, applied_by) VALUES
(1,1,'Applied','2023-06-20',1),
(1,2,'Pending','2023-06-25',2),
(2,1,'Applied','2023-06-22',2),
(3,3,'Failed','2023-07-15',1),
(4,4,'Applied','2023-06-01',2),
(5,5,'Pending','2023-08-05',1),
(6,2,'Applied','2023-06-30',2),
(7,1,'Applied','2023-07-01',1),
(8,3,'Pending','2023-07-10',2),
(9,6,'Applied','2023-09-12',5),
(10,2,'Applied','2023-06-21',2),
(11,3,'Pending','2023-07-08',3),
(12,5,'Applied','2023-08-12',3),
(13,3,'Failed','2023-07-18',3),
(14,6,'Pending','2023-09-18',3),
(15,1,'Applied','2023-06-27',4),
(16,2,'Applied','2023-06-29',4),
(17,6,'Pending','2023-09-22',5),
(18,4,'Applied','2023-06-02',5),
(19,5,'Applied','2023-08-20',4),
(20,1,'Pending','2023-06-25',5);

INSERT INTO Risk_Score (asset_id, risk_level, score, calculated_date) VALUES
(1,'Medium',55,'2023-06-21'),
(2,'Low',30,'2023-06-22'),
(3,'Critical',90,'2023-07-16'),
(4,'Low',20,'2023-06-02'),
(5,'High',80,'2023-08-06'),
(6,'Medium',60,'2023-06-13'),
(7,'Medium',50,'2023-07-02'),
(8,'High',75,'2023-07-11'),
(9,'High',70,'2023-09-13'),
(10,'Medium',65,'2023-06-23'),
(11,'High',85,'2023-07-06'),
(12,'Medium',60,'2023-08-11'),
(13,'Critical',92,'2023-07-12'),
(14,'High',78,'2023-09-16'),
(15,'Low',25,'2023-06-26'),
(16,'Medium',55,'2023-06-29'),
(17,'High',70,'2023-09-21'),
(18,'Low',20,'2023-05-31'),
(19,'High',82,'2023-08-19'),
(20,'Medium',65,'2023-06-23');

INSERT INTO Audit_Log (action, details, user_id) VALUES
('Patch Applied','Browser patch applied to Lab-PC-01',1),
('Patch Pending','Kernel patch pending on Lab-PC-01',2),
('Vulnerability Detected','CVE-2023-1003 detected on Server-01',1),
('Patch Failed','Patch failed on Lab-PC-03',1),
('Risk Calculated','Risk score updated for Server-02',3),
('Patch Applied','Privilege patch applied to Server-02',3),
('Admin Login','Admin logged into system',4),
('New Asset Added','Laptop-03 added to system',5),
('Patch Applied','Auth fix applied to Laptop-03',5),
('Risk Updated','Critical risk recorded for Server-03',3);