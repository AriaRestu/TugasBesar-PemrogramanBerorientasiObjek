-- =====================================================
-- DATABASE SEEDER - db_pinjamruangtelu
-- Password semua user: 'password123'
-- SHA-256: ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f
-- =====================================================

CREATE DATABASE IF NOT EXISTS db_pinjamruangtelu
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE db_pinjamruangtelu;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE notifikasi;
TRUNCATE TABLE approval;
TRUNCATE TABLE f03;
TRUNCATE TABLE f02;
TRUNCATE TABLE f01;
TRUNCATE TABLE pengajuan_logistik;
TRUNCATE TABLE pengajuan;
TRUNCATE TABLE logistik;
TRUNCATE TABLE ruangan;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- =====================================================
-- USERS
-- =====================================================
INSERT INTO users (id, nama, email, password, no_telp, role) VALUES
-- PEMINJAM (mahasiswa / ketua ormawa)
(1,  'Arif Budi Santoso',       'arif.budi@student.telkomuniversity.ac.id',   'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081311111111', 'PEMINJAM'),
(2,  'Dewi Rahmawati',          'dewi.rahma@student.telkomuniversity.ac.id',  'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081322222222', 'PEMINJAM'),
(3,  'Fajar Nugroho',           'fajar.nugroho@student.telkomuniversity.ac.id','ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081333333333', 'PEMINJAM'),
(4,  'Siti Nurhaliza',          'siti.nur@student.telkomuniversity.ac.id',    'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081344444444', 'PEMINJAM'),
(5,  'Rizky Firmansyah',        'rizky.firm@student.telkomuniversity.ac.id',  'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081355555555', 'PEMINJAM'),
-- PEMBINA (dosen pembina ormawa)
(6,  'Dr. Hendra Kusuma',       'hendra.kusuma@telkomuniversity.ac.id',       'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081366666666', 'PEMBINA'),
(7,  'Dr. Rina Marlina',        'rina.marlina@telkomuniversity.ac.id',        'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081377777777', 'PEMBINA'),
-- SSC (Student Service Center)
(8,  'Agus Setiawan',           'agus.ssc@telkomuniversity.ac.id',            'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081388888888', 'SSC'),
(9,  'Yuni Astuti',             'yuni.ssc@telkomuniversity.ac.id',            'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081399999999', 'SSC'),
-- LOGAM TUS
(10, 'Bapak Suharto',           'suharto.logam@telkomuniversity.ac.id',       'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081300000001', 'LOGAM_TUS'),
(11, 'Ibu Wati',                'wati.logam@telkomuniversity.ac.id',          'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', '081300000002', 'LOGAM_TUS');

-- =====================================================
-- RUANGAN
-- =====================================================
INSERT INTO ruangan (id, nama_ruangan, jenis, kapasitas, lokasi, deskripsi, status_aktif) VALUES
(1,  'Aula Gedung Bangkit',     'AUDITORIUM',  500, 'Gedung Bangkit Lt. 1',   'Aula utama kampus, cocok untuk seminar besar dan wisuda',       TRUE),
(2,  'Aula Gedung C',           'AUDITORIUM',  300, 'Gedung C Lt. 1',         'Aula untuk seminar dan acara himpunan',                         TRUE),
(3,  'Lab Komputer A-301',      'LABORATORIUM', 40, 'Gedung A Lt. 3',         'Lab komputer 40 unit, OS Ubuntu & Windows dual boot',          TRUE),
(4,  'Lab Komputer B-201',      'LABORATORIUM', 35, 'Gedung B Lt. 2',         'Lab komputer 35 unit untuk praktikum jaringan',                 TRUE),
(5,  'Ruang Kelas C-101',       'KELAS',        50, 'Gedung C Lt. 1',         'Ruang kelas reguler dilengkapi proyektor',                      TRUE),
(6,  'Ruang Kelas C-102',       'KELAS',        50, 'Gedung C Lt. 1',         'Ruang kelas reguler',                                          TRUE),
(7,  'Ruang Kelas D-201',       'KELAS',        60, 'Gedung D Lt. 2',         'Ruang kelas kapasitas besar dengan AC',                        TRUE),
(8,  'Ruang Rapat Prodi IF',    'RUANG_RAPAT',  20, 'Gedung A Lt. 4',         'Ruang rapat program studi Informatika',                        TRUE),
(9,  'Ruang Rapat BEM',         'RUANG_RAPAT',  15, 'Gedung Student Center',  'Ruang rapat khusus organisasi mahasiswa',                      TRUE),
(10, 'Lapangan Futsal Indoor',  'LAINNYA',     100, 'Gedung Olahraga Lt. 1',  'Lapangan futsal indoor, bisa untuk acara outdoor indoor',      TRUE),
(11, 'Studio Kreatif',          'LAINNYA',      30, 'Gedung Student Center',  'Studio untuk shooting, podcast, dan kegiatan kreatif',         FALSE);

-- =====================================================
-- LOGISTIK
-- =====================================================
INSERT INTO logistik (id, nama_logistik, kategori, satuan, jumlah_tersedia, deskripsi, status_aktif) VALUES
(1,  'Proyektor HDMI',          'Elektronik', 'unit',  8,   'Proyektor portable resolusi Full HD',             TRUE),
(2,  'Layar Proyektor',         'Elektronik', 'unit',  5,   'Layar gulung ukuran 120 inch',                    TRUE),
(3,  'Microphone Wireless',     'Elektronik', 'set',   4,   'Set mic wireless 2 unit + receiver',              TRUE),
(4,  'Speaker Portable',        'Elektronik', 'unit',  6,   'Speaker aktif portable dengan Bluetooth',         TRUE),
(5,  'Laptop Presentasi',       'Elektronik', 'unit',  3,   'Laptop Windows untuk keperluan presentasi',       TRUE),
(6,  'Kamera DSLR',             'Elektronik', 'unit',  2,   'Kamera DSLR Canon EOS untuk dokumentasi',        TRUE),
(7,  'Tripod Kamera',           'Elektronik', 'unit',  3,   'Tripod aluminium adjustable',                     TRUE),
(8,  'Meja Lipat',              'Furnitur',   'buah',  30,  'Meja lipat serbaguna',                            TRUE),
(9,  'Kursi Plastik',           'Furnitur',   'buah', 150,  'Kursi plastik standar',                           TRUE),
(10, 'Podium',                  'Furnitur',   'buah',  3,   'Podium kayu untuk pembicara',                     TRUE),
(11, 'Backdrop Banner',         'Dekorasi',   'buah',  4,   'Backdrop banner ukuran 3x2m dengan stand',        TRUE),
(12, 'Roll Banner',             'Dekorasi',   'buah',  8,   'Roll banner ukuran 60x160cm',                     TRUE),
(13, 'Extension Kabel 5m',      'Kelistrikan','buah',  20,  'Extension kabel 5 meter 4 stop kontak',           TRUE),
(14, 'UPS / Stabilizer',        'Kelistrikan','unit',  5,   'UPS untuk perlindungan perangkat elektronik',     TRUE),
(15, 'Tenda 3x3',               'Outdoor',    'unit',  6,   'Tenda lipat 3x3 untuk acara outdoor',             FALSE);

-- =====================================================
-- PENGAJUAN
-- Note: pembina_id sesuai migration_add_pembina_id.sql
-- =====================================================
INSERT INTO pengajuan (id, user_id, ruangan_id, pembina_id, no_tiket, jenis_pengajuan, tanggal_pengajuan, tanggal_pinjam, waktu_mulai, waktu_selesai, keperluan, catatan, status) VALUES
-- Status DISETUJUI (sudah lengkap semua approval)
(1,  1, 2,    6, 'TKT-2026-001', 'RUANGAN_LOGISTIK', '2026-06-01 09:00:00', '2026-07-05', '08:00:00', '16:00:00', 'Seminar Nasional Informatika 2026', 'Perlu proyektor, mic, dan kursi tambahan', 'DISETUJUI'),
(2,  2, 1,    7, 'TKT-2026-002', 'RUANGAN_LOGISTIK', '2026-06-03 10:00:00', '2026-07-12', '07:00:00', '17:00:00', 'Wisuda Angkatan 2022 Himpunan', 'Butuh sound system lengkap', 'DISETUJUI'),

-- Status SELESAI
(3,  3, 5,    6, 'TKT-2026-003', 'RUANGAN',           '2026-05-10 08:00:00', '2026-05-20', '13:00:00', '15:00:00', 'Rapat Koordinasi Himpunan', NULL, 'SELESAI'),

-- Status DITOLAK
(4,  4, 3,    7, 'TKT-2026-004', 'RUANGAN_LOGISTIK', '2026-06-05 11:00:00', '2026-07-08', '09:00:00', '12:00:00', 'Workshop UI/UX Design', 'Butuh laptop presentasi', 'DITOLAK'),

-- Status MENUNGGU_PEMBINA
(5,  5, 9,    6, 'TKT-2026-005', 'RUANGAN',           '2026-06-20 14:00:00', '2026-07-18', '15:00:00', '17:00:00', 'Rapat Evaluasi BEM Semester Ganjil', NULL, 'MENUNGGU_PEMBINA'),
(6,  1, NULL, 6, 'TKT-2026-006', 'LOGISTIK',          '2026-06-21 09:00:00', '2026-07-19', '10:00:00', '14:00:00', 'Pinjam peralatan pameran jurusan', 'Butuh backdrop dan roll banner', 'MENUNGGU_PEMBINA'),

-- Status MENUNGGU_SSC
(7,  2, 7,    7, 'TKT-2026-007', 'RUANGAN_LOGISTIK', '2026-06-15 08:30:00', '2026-07-25', '08:00:00', '20:00:00', 'Kompetisi Debat Bahasa Inggris', 'Acara seharian penuh', 'MENUNGGU_SSC'),
(8,  3, 2,    6, 'TKT-2026-008', 'RUANGAN_LOGISTIK', '2026-06-18 10:00:00', '2026-07-30', '08:00:00', '15:00:00', 'Pelatihan Kepemimpinan Mahasiswa', NULL, 'MENUNGGU_SSC'),

-- Status MENUNGGU_LOGAM_TUS
(9,  4, 4,    7, 'TKT-2026-009', 'RUANGAN_LOGISTIK', '2026-06-10 09:00:00', '2026-07-22', '09:00:00', '17:00:00', 'Praktikum Jaringan Komputer Terbuka', NULL, 'MENUNGGU_LOGAM_TUS'),
(10, 5, 8,    6, 'TKT-2026-010', 'RUANGAN',          '2026-06-12 11:00:00', '2026-07-26', '10:00:00', '12:00:00', 'Rapat Prodi Informatika', NULL, 'MENUNGGU_LOGAM_TUS'),

-- Status DRAFT
(11, 1, 6,    NULL, 'TKT-2026-011', 'RUANGAN',        '2026-06-22 16:00:00', '2026-08-01', '09:00:00', '11:00:00', 'Persiapan Ospek Jurusan', NULL, 'DRAFT'),
(12, 2, NULL, NULL, 'TKT-2026-012', 'LOGISTIK',       '2026-06-22 17:00:00', '2026-08-05', '08:00:00', '16:00:00', 'Pinjam kamera untuk dokumentasi kegiatan', NULL, 'DRAFT');

-- =====================================================
-- PENGAJUAN LOGISTIK
-- =====================================================
INSERT INTO pengajuan_logistik (pengajuan_id, logistik_id, jumlah, keterangan) VALUES
-- TKT-001: Seminar Nasional
(1, 1, 2, 'Proyektor untuk 2 ruang parallel session'),
(1, 3, 2, 'Mic untuk moderator dan pembicara'),
(1, 9, 50, 'Kursi tambahan peserta'),
(1, 10, 1, 'Podium untuk keynote speaker'),
-- TKT-002: Wisuda Himpunan
(2, 1, 1, 'Proyektor untuk slideshow'),
(2, 3, 2, 'Mic untuk MC dan sambutan'),
(2, 4, 2, 'Speaker untuk musik'),
(2, 11, 2, 'Backdrop acara wisuda'),
-- TKT-004: Workshop UI/UX (ditolak)
(4, 5, 3, 'Laptop untuk peserta presentasi'),
(4, 1, 1, 'Proyektor'),
-- TKT-006: Pameran jurusan
(6, 11, 2, 'Backdrop booth pameran'),
(6, 12, 4, 'Roll banner info prodi'),
(6, 13, 5, 'Extension kabel untuk booth'),
-- TKT-007: Kompetisi Debat
(7, 1, 1, 'Proyektor untuk tayangan timer'),
(7, 3, 4, 'Mic untuk peserta debat'),
(7, 9, 30, 'Kursi tambahan penonton'),
-- TKT-008: Pelatihan Kepemimpinan
(8, 1, 1, 'Proyektor materi'),
(8, 3, 1, 'Mic untuk fasilitator'),
(8, 8, 10, 'Meja diskusi kelompok'),
-- TKT-009: Praktikum Jaringan
(9, 13, 10, 'Extension kabel untuk perangkat jaringan'),
(9, 14, 3, 'UPS untuk switch dan router'),
-- TKT-012: Kamera dokumentasi
(12, 6, 1, 'Kamera DSLR utama'),
(12, 7, 1, 'Tripod untuk kamera');

-- =====================================================
-- F01 (Form pengajuan kegiatan ormawa)
-- =====================================================
INSERT INTO f01 (pengajuan_id, nama_ormawa, nama_ketua_pelaksana, nim, program_studi, no_handphone, nama_kegiatan, tanggal_kegiatan, tempat_kegiatan, waktu_mulai, waktu_selesai, total_peserta, catatan) VALUES
(1, 'HIMTI Tel-U Surabaya',     'Arif Budi Santoso',  '6701234001', 'S1 Teknik Informatika',   '081311111111', 'Seminar Nasional Informatika 2026',      '2026-07-05', 'Aula Gedung C',         '08:00:00', '16:00:00', 300, 'Pembicara dari industri dan akademisi'),
(2, 'BEM Fakultas Teknik',      'Dewi Rahmawati',     '6701234002', 'S1 Sistem Informasi',     '081322222222', 'Malam Apresiasi & Wisuda Himpunan 2026', '2026-07-12', 'Aula Gedung Bangkit',   '07:00:00', '17:00:00', 450, 'Acara tahunan himpunan mahasiswa'),
(3, 'HMSF Tel-U Surabaya',      'Fajar Nugroho',      '6701234003', 'S1 Matematika',           '081333333333', 'Rapat Koordinasi Semesteran',            '2026-05-20', 'Ruang Kelas C-101',     '13:00:00', '15:00:00', 30,  NULL),
(4, 'UKM Desain Kreatif',       'Siti Nurhaliza',     '6701234004', 'S1 Desain Komunikasi Visual','081344444444','Workshop UI/UX Design Bootcamp',        '2026-07-08', 'Lab Komputer A-301',    '09:00:00', '12:00:00', 35, 'Peserta membawa laptop masing-masing'),
(7, 'English Debate Club',      'Dewi Rahmawati',     '6701234002', 'S1 Sistem Informasi',     '081322222222', 'Kompetisi Debat Bahasa Inggris 2026',    '2026-07-25', 'Ruang Kelas D-201',     '08:00:00', '20:00:00', 80,  'Kompetisi tingkat institusi'),
(8, 'Mapala Tel-U',             'Fajar Nugroho',      '6701234003', 'S1 Matematika',           '081333333333', 'Pelatihan Kepemimpinan Mahasiswa',       '2026-07-30', 'Aula Gedung C',         '08:00:00', '15:00:00', 100, 'Terbuka untuk semua mahasiswa baru'),
(9, 'Lab Network & Security',   'Siti Nurhaliza',     '6701234004', 'S1 Teknik Informatika',   '081344444444', 'Praktikum Jaringan Terbuka 2026',        '2026-07-22', 'Lab Komputer B-201',    '09:00:00', '17:00:00', 35,  'Sesi latihan konfigurasi router & switch');

-- =====================================================
-- APPROVAL
-- =====================================================
INSERT INTO approval (pengajuan_id, approver_id, role_approver, status, catatan, tanggal_approval) VALUES
-- TKT-001: DISETUJUI semua
(1, 6,  'PEMBINA',   'DISETUJUI', 'Kegiatan positif dan sudah terencana dengan baik', '2026-06-02 10:00:00'),
(1, 8,  'SSC',       'DISETUJUI', 'Berkas lengkap, jadwal tidak konflik',             '2026-06-03 09:00:00'),
(1, 10, 'LOGAM_TUS', 'DISETUJUI', 'Ruangan dan logistik tersedia',                   '2026-06-04 14:00:00'),
-- TKT-002: DISETUJUI semua
(2, 7,  'PEMBINA',   'DISETUJUI', 'Acara tahunan, disetujui',                        '2026-06-04 11:00:00'),
(2, 8,  'SSC',       'DISETUJUI', 'Dokumen lengkap',                                 '2026-06-05 10:00:00'),
(2, 10, 'LOGAM_TUS', 'DISETUJUI', 'Aula tersedia untuk tanggal tersebut',            '2026-06-06 13:00:00'),
-- TKT-003: SELESAI - semua approval
(3, 6,  'PEMBINA',   'DISETUJUI', 'Disetujui',                                       '2026-05-11 09:00:00'),
(3, 9,  'SSC',       'DISETUJUI', 'OK',                                              '2026-05-12 10:00:00'),
(3, 11, 'LOGAM_TUS', 'DISETUJUI', 'Ruangan tersedia',                               '2026-05-13 11:00:00'),
-- TKT-004: DITOLAK oleh SSC
(4, 7,  'PEMBINA',   'DISETUJUI', 'Setuju, kegiatan edukatif',                       '2026-06-06 08:00:00'),
(4, 9,  'SSC',       'DITOLAK',   'Tanggal bentrok dengan kegiatan fakultas. Mohon ajukan tanggal lain.', '2026-06-07 14:00:00'),
-- TKT-007: Menunggu SSC - sudah lewat pembina
(7, 7,  'PEMBINA',   'DISETUJUI', 'English Debate Club disetujui',                   '2026-06-16 09:00:00'),
-- TKT-008: Menunggu SSC - sudah lewat pembina
(8, 6,  'PEMBINA',   'DISETUJUI', 'Kegiatan penting untuk mahasiswa baru',           '2026-06-19 08:30:00'),
-- TKT-009: Menunggu LOGAM_TUS - sudah lewat pembina & SSC
(9, 7,  'PEMBINA',   'DISETUJUI', 'Disetujui',                                       '2026-06-11 09:00:00'),
(9, 8,  'SSC',       'DISETUJUI', 'Tidak ada konflik jadwal',                        '2026-06-12 10:00:00'),
-- TKT-010: Menunggu LOGAM_TUS - sudah lewat pembina & SSC
(10, 6, 'PEMBINA',   'DISETUJUI', 'Rapat prodi rutin',                               '2026-06-13 08:00:00'),
(10, 9, 'SSC',       'DISETUJUI', 'OK, ruang rapat tersedia',                        '2026-06-14 09:00:00');

-- =====================================================
-- F03 (Tiket resmi untuk pengajuan DISETUJUI/SELESAI)
-- =====================================================
INSERT INTO f03 (pengajuan_id, no_tiket, diterbitkan_oleh, file_pdf) VALUES
(1, 'TKT-2026-001', 10, 'F03_TKT-2026-001.pdf'),
(2, 'TKT-2026-002', 10, 'F03_TKT-2026-002.pdf'),
(3, 'TKT-2026-003', 11, 'F03_TKT-2026-003.pdf');

-- =====================================================
-- NOTIFIKASI
-- =====================================================
INSERT INTO notifikasi (user_id, pengajuan_id, pesan, tipe, link, dibaca) VALUES
-- Notifikasi untuk peminjam
(1, 1, 'Pengajuan #TKT-2026-001 telah DISETUJUI. Tiket Anda siap diunduh.', 'DISETUJUI', '/f03?pengajuan_id=1', FALSE),
(2, 2, 'Pengajuan #TKT-2026-002 telah DISETUJUI. Tiket Anda siap diunduh.', 'DISETUJUI', '/f03?pengajuan_id=2', TRUE),
(3, 3, 'Pengajuan #TKT-2026-003 telah SELESAI.', 'SELESAI', '/detail-pengajuan?id=3', TRUE),
(4, 4, 'Pengajuan #TKT-2026-004 DITOLAK oleh SSC: Tanggal bentrok dengan kegiatan fakultas.', 'DITOLAK', '/detail-pengajuan?id=4', FALSE),
(5, 5, 'Pengajuan #TKT-2026-005 dikirim ke pembina, menunggu persetujuan.', 'STATUS_UPDATE', '/detail-pengajuan?id=5', TRUE),
(1, 6, 'Pengajuan #TKT-2026-006 dikirim ke pembina, menunggu persetujuan.', 'STATUS_UPDATE', '/detail-pengajuan?id=6', TRUE),
(2, 7, 'Pengajuan #TKT-2026-007 disetujui pembina, menunggu verifikasi SSC.', 'STATUS_UPDATE', '/detail-pengajuan?id=7', FALSE),
(3, 8, 'Pengajuan #TKT-2026-008 disetujui pembina, menunggu verifikasi SSC.', 'STATUS_UPDATE', '/detail-pengajuan?id=8', FALSE),
(4, 9, 'Pengajuan #TKT-2026-009 disetujui SSC, menunggu persetujuan Logam TUS.', 'STATUS_UPDATE', '/detail-pengajuan?id=9', TRUE),
(5, 10,'Pengajuan #TKT-2026-010 disetujui SSC, menunggu persetujuan Logam TUS.', 'STATUS_UPDATE', '/detail-pengajuan?id=10', FALSE),
-- Notifikasi untuk approver
(6,  5, 'Ada pengajuan baru #TKT-2026-005 menunggu persetujuan Anda.', 'APPROVAL_PEMBINA', '/detail-pengajuan?id=5', FALSE),
(6,  6, 'Ada pengajuan baru #TKT-2026-006 menunggu persetujuan Anda.', 'APPROVAL_PEMBINA', '/detail-pengajuan?id=6', FALSE),
(8,  7, 'Pengajuan #TKT-2026-007 menunggu verifikasi SSC.', 'APPROVAL_SSC', '/detail-pengajuan?id=7', FALSE),
(8,  8, 'Pengajuan #TKT-2026-008 menunggu verifikasi SSC.', 'APPROVAL_SSC', '/detail-pengajuan?id=8', TRUE),
(10, 9, 'Pengajuan #TKT-2026-009 menunggu persetujuan akhir Anda.', 'APPROVAL_LOGAM_TUS', '/detail-pengajuan?id=9', FALSE),
(10,10, 'Pengajuan #TKT-2026-010 menunggu persetujuan akhir Anda.', 'APPROVAL_LOGAM_TUS', '/detail-pengajuan?id=10', FALSE);
