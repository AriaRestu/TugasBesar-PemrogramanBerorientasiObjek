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

-- ===========================
-- RUANGAN
-- ===========================
INSERT INTO ruangan (nama_ruangan, jenis, kapasitas, lokasi, deskripsi, status_aktif) VALUES
('Aula Gedung C', 'AUDITORIUM', 300, 'Gedung C Lt. 1', 'Aula besar untuk seminar dan acara kampus', TRUE),
('Lab Komputer 1', 'LABORATORIUM', 40, 'Gedung B Lt. 2', 'Lab komputer dengan 40 unit PC', TRUE),
('Ruang Kelas C101', 'KELAS', 50, 'Gedung C Lt. 1', 'Ruang kelas reguler', TRUE),
('Ruang Rapat Prodi', 'RUANG_RAPAT', 20, 'Gedung A Lt. 3', 'Ruang rapat program studi', TRUE);

-- ===========================
-- LOGISTIK
-- ===========================
INSERT INTO logistik (nama_logistik, kategori, satuan, jumlah_tersedia, deskripsi, status_aktif) VALUES
('Proyektor', 'Elektronik', 'unit', 5, 'Proyektor HDMI portable', TRUE),
('Meja Lipat', 'Furnitur', 'buah', 20, 'Meja lipat serbaguna', TRUE),
('Kursi Plastik', 'Furnitur', 'buah', 100, 'Kursi plastik standar', TRUE),
('Microphone Wireless', 'Elektronik', 'set', 3, 'Mic wireless 2-in-1', TRUE);

-- ===========================
-- PENGAJUAN
-- ===========================
INSERT INTO pengajuan (user_id, ruangan_id, no_tiket, jenis_pengajuan, tanggal_pinjam, waktu_mulai, waktu_selesai, keperluan, catatan, status) VALUES
(1, 1, 'TKT-001', 'RUANGAN_LOGISTIK', '2026-07-10', '08:00:00', '12:00:00', 'Seminar Nasional Teknologi', 'Perlu proyektor dan mic', 'DISETUJUI'),
(1, 3, 'TKT-002', 'RUANGAN', '2026-07-15', '13:00:00', '15:00:00', 'Rapat Himpunan Mahasiswa', NULL, 'MENUNGGU_SSC'),
(1, 2, 'TKT-003', 'RUANGAN_LOGISTIK', '2026-07-20', '09:00:00', '17:00:00', 'Workshop Pemrograman', 'Butuh 30 kursi tambahan', 'MENUNGGU_LOGAM_TUS'),
(1, NULL, 'TKT-004', 'LOGISTIK', '2026-07-22', '10:00:00', '12:00:00', 'Pinjam logistik untuk pameran', NULL, 'MENUNGGU_PEMBINA');

-- ===========================
-- PENGAJUAN LOGISTIK
-- ===========================
INSERT INTO pengajuan_logistik (pengajuan_id, logistik_id, jumlah, keterangan) VALUES
(1, 1, 2, 'Proyektor untuk presentasi'),
(1, 4, 1, 'Mic untuk moderator'),
(3, 2, 10, 'Meja tambahan peserta'),
(3, 3, 30, 'Kursi tambahan');

-- ===========================
-- F01 (untuk pengajuan ormawa)
-- ===========================
INSERT INTO f01 (pengajuan_id, nama_ormawa, nama_ketua_pelaksana, nim, program_studi, no_handphone, nama_kegiatan, tanggal_kegiatan, tempat_kegiatan, waktu_mulai, waktu_selesai, total_peserta, catatan) VALUES
(1, 'HIMTI Tel-U Surabaya', 'Budi Santoso', '6701234001', 'S1 Teknik Informatika', '081299990001', 'Seminar Nasional Teknologi 2026', '2026-07-10', 'Aula Gedung C', '08:00:00', '12:00:00', 200, 'Kegiatan tahunan himpunan');

-- ===========================
-- APPROVAL
-- ===========================
-- TKT-001: sudah disetujui semua tahap
INSERT INTO approval (pengajuan_id, approver_id, role_approver, status, catatan) VALUES
(1, 2, 'PEMBINA',   'DISETUJUI', 'Kegiatan positif, disetujui'),
(1, 3, 'SSC',       'DISETUJUI', 'Berkas lengkap'),
(1, 4, 'LOGAM_TUS', 'DISETUJUI', 'Ruangan tersedia');

-- TKT-002: sudah lewat pembina, menunggu SSC
INSERT INTO approval (pengajuan_id, approver_id, role_approver, status, catatan) VALUES
(2, 2, 'PEMBINA', 'DISETUJUI', 'Disetujui pembina');

-- TKT-003: sudah lewat pembina & SSC, menunggu Logam TUS
INSERT INTO approval (pengajuan_id, approver_id, role_approver, status, catatan) VALUES
(3, 2, 'PEMBINA', 'DISETUJUI', 'OK'),
(3, 3, 'SSC',     'DISETUJUI', 'Dokumen lengkap');

-- ===========================
-- F03 (tiket untuk TKT-001 yang sudah DISETUJUI)
-- ===========================
INSERT INTO f03 (pengajuan_id, no_tiket, diterbitkan_oleh, file_pdf) VALUES
(1, 'TKT-001', 4, 'F03_TKT-001.pdf');

-- ===========================
-- NOTIFIKASI
-- ===========================
INSERT INTO notifikasi (user_id, pengajuan_id, pesan, tipe, link, dibaca) VALUES
(1, 1, 'Pengajuan #TKT-001 telah DISETUJUI oleh Logam TUS. Tiket Anda sudah dapat diunduh.', 'DISETUJUI', '/f03?pengajuan_id=1', FALSE),
(1, 2, 'Pengajuan #TKT-002 telah diverifikasi SSC, menunggu persetujuan Anda.', 'STATUS_UPDATE', '/detail-pengajuan?id=2', TRUE),
(3, 3, 'Pengajuan #TKT-003 telah diverifikasi SSC, menunggu persetujuan Anda.', 'APPROVAL_SSC', '/detail-pengajuan?id=3', FALSE),
(4, 1, 'Pengajuan #TKT-001 menunggu persetujuan akhir Anda.', 'APPROVAL_SSC', '/detail-pengajuan?id=1', TRUE);
