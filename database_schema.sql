CREATE DATABASE IF NOT EXISTS bagong_silang_incident;

USE bagong_silang_incident;

-- USERS TABLE
CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin','reporter') DEFAULT 'reporter',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_username (username)
);

-- INCIDENT CATEGORY TABLE
CREATE TABLE incident_categories(
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- INCIDENTS TABLE
CREATE TABLE incidents(
    id INT AUTO_INCREMENT PRIMARY KEY,
    reporter_id INT,
    reporter_name VARCHAR(100) NOT NULL,
    contact VARCHAR(50) NOT NULL,
    category_id INT,
    location VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    evidence_image VARCHAR(255),
    status ENUM('Pending','Investigating','Resolved') DEFAULT 'Pending',
    date_reported TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (reporter_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES incident_categories(id),

    INDEX idx_status (status),
    INDEX idx_date (date_reported)
);

-- INSERT INCIDENT CATEGORIES
INSERT INTO incident_categories (category_name) VALUES
('Theft'),
('Accident'),
('Violence'),
('Dispute'),
('Fire'),
('Other');

-- INSERT ADMIN USER
-- Password: admin123 (hashed)
INSERT INTO users (fullname, username, password, role)
VALUES (
'Barangay Administrator',
'admin',
'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9Xn6n8R9JZC/7K1sC5nW6O',
'admin'
);