-- Skema database db_pinjamruangtelu
-- Berdasarkan ER Diagram proyek

CREATE DATABASE IF NOT EXISTS db_pinjamruangtelu
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db_pinjamruangtelu;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    no_telp VARCHAR(20),
    role ENUM('PEMINJAM', 'PEMBINA', 'SSC', 'LOGAM_TUS') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ruangan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_ruangan VARCHAR(100) NOT NULL,
    jenis ENUM('KELAS', 'LABORATORIUM', 'AUDITORIUM', 'RUANG_RAPAT', 'LAINNYA') NOT NULL,
    kapasitas INT NOT NULL,
    lokasi VARCHAR(150),
    deskripsi TEXT,
    status_aktif BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS pengajuan (
    id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,
    ruangan_id INT NULL,

    no_tiket VARCHAR(50) NOT NULL UNIQUE,

    jenis_pengajuan ENUM('RUANGAN', 'LOGISTIK', 'RUANGAN_LOGISTIK') NOT NULL,

    tanggal_pengajuan DATETIME DEFAULT CURRENT_TIMESTAMP,

    tanggal_pinjam DATE NOT NULL,
    waktu_mulai TIME NOT NULL,
    waktu_selesai TIME NOT NULL,

    keperluan VARCHAR(255) NOT NULL,
    catatan TEXT,
    status ENUM('DRAFT', 'MENUNGGU_PEMBINA', 'MENUNGGU_SSC', 'MENUNGGU_LOGAM_TUS', 'DISETUJUI', 'DITOLAK', 'SELESAI') DEFAULT 'DRAFT',

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (ruangan_id) 
    REFERENCES ruangan(id)
    ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS logistik (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_logistik VARCHAR(100) NOT NULL,
    kategori VARCHAR(50),
    satuan VARCHAR(20),
    jumlah_tersedia INT DEFAULT 0,
    deskripsi TEXT,
    status_aktif BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS pengajuan_logistik (
    id INT AUTO_INCREMENT PRIMARY KEY,

    pengajuan_id INT NOT NULL,
    logistik_id INT NOT NULL,

    jumlah INT NOT NULL DEFAULT 1,
    keterangan VARCHAR(255),

    FOREIGN KEY (pengajuan_id)
        REFERENCES pengajuan(id)
        ON DELETE CASCADE,

    FOREIGN KEY (logistik_id)
        REFERENCES logistik(id)
);

CREATE TABLE IF NOT EXISTS f01 (
    id INT AUTO_INCREMENT PRIMARY KEY,

    pengajuan_id INT NOT NULL UNIQUE,

    nama_ormawa VARCHAR(100) NOT NULL,
    nama_ketua_pelaksana VARCHAR(100) NOT NULL,
    nim VARCHAR(20) NOT NULL,
    program_studi VARCHAR(100) NOT NULL,
    no_handphone VARCHAR(20) NOT NULL,

    nama_kegiatan VARCHAR(200) NOT NULL,
    tanggal_kegiatan DATE NOT NULL,
    tempat_kegiatan VARCHAR(150) NOT NULL,

    waktu_mulai TIME NOT NULL,
    waktu_selesai TIME NOT NULL,

    total_peserta INT NOT NULL,

    catatan TEXT,

    file_path VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (pengajuan_id)
        REFERENCES pengajuan(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS f02 (
    id INT AUTO_INCREMENT PRIMARY KEY,

    pengajuan_id INT NOT NULL UNIQUE,

    catatan TEXT,

    file_path VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (pengajuan_id)
        REFERENCES pengajuan(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS f03 (
    id INT AUTO_INCREMENT PRIMARY KEY,

    pengajuan_id INT NOT NULL UNIQUE,

    no_tiket VARCHAR(50) NOT NULL UNIQUE,

    tanggal_terbit DATETIME DEFAULT CURRENT_TIMESTAMP,

    diterbitkan_oleh INT,

    file_pdf VARCHAR(255) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (pengajuan_id)
        REFERENCES pengajuan(id)
        ON DELETE CASCADE,

    FOREIGN KEY (diterbitkan_oleh)
        REFERENCES users(id)
        ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS approval (
    id INT AUTO_INCREMENT PRIMARY KEY,

    pengajuan_id INT NOT NULL,
    approver_id INT NOT NULL,

    role_approver ENUM(
        'PEMBINA',
        'SSC',
        'LOGAM_TUS'
    ) NOT NULL,

    status ENUM(
        'MENUNGGU',
        'DISETUJUI',
        'DITOLAK'
    ) NOT NULL,

    catatan TEXT,

    tanggal_approval DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (pengajuan_id)
        REFERENCES pengajuan(id)
        ON DELETE CASCADE,

    FOREIGN KEY (approver_id)
        REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS notifikasi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    pengajuan_id INT,
    pesan TEXT NOT NULL,
    tanggal DATETIME DEFAULT CURRENT_TIMESTAMP,
    dibaca BOOLEAN DEFAULT FALSE,
    tipe VARCHAR(50),
    link VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (pengajuan_id) REFERENCES pengajuan(id) ON DELETE SET NULL
);

-- Data awal: akun uji per role
INSERT INTO users (nama, email, password, no_telp, role) VALUES
    ('Peminjam Demo', 'peminjam@telu.ac.id', 'peminjam123', '0811111111', 'PEMINJAM'),
    ('Pembina Demo', 'pembina@telu.ac.id', 'pembina123', '0812222222', 'PEMBINA'),
    ('SSC Demo', 'ssc@telu.ac.id', 'ssc123', '0813333333', 'SSC'),
    ('Logam TUS Demo', 'logamtus@telu.ac.id', 'logamtus123', '0814444444', 'LOGAM_TUS')
ON DUPLICATE KEY UPDATE nama = VALUES(nama);
