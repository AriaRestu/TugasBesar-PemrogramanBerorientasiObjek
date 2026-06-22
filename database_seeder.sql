SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    no_telp VARCHAR(20),
    role ENUM('PEMINJAM', 'PEMBINA', 'SSC', 'LOGAM_TUS') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Semua user di bawah ini menggunakan password default: 'password123'
-- Hash SHA-256 dari 'password123' adalah: 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f'

INSERT INTO users (nama, email, password, no_telp, role) VALUES 
('User Peminjam', 'peminjam@telkomuniversity.ac.id', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081234567890', 'PEMINJAM'),
('User Pembina', 'pembina@telkomuniversity.ac.id', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081234567891', 'PEMBINA'),
('Staf SSC', 'ssc@telkomuniversity.ac.id', 'ef92b778bafe771e8   9245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081234567892', 'SSC'),
('Staf Logam TUS', 'logamtus@telkomuniversity.ac.id', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081234567893', 'LOGAM_TUS');

SET FOREIGN_KEY_CHECKS = 1;
