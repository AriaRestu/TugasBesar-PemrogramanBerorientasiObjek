-- Migration: tambah kolom pembina_id ke tabel pengajuan
ALTER TABLE pengajuan
    ADD COLUMN pembina_id INT NULL AFTER ruangan_id,
    ADD FOREIGN KEY fk_pengajuan_pembina (pembina_id) REFERENCES users(id) ON DELETE SET NULL;
