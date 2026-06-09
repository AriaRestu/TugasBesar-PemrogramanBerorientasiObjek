# Database: db_pinjamruangtelu

## Koneksi JDBC

Konfigurasi di `src/main/resources/db.properties` (tidak di-commit ke Git).

```properties
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://localhost:3306/db_pinjamruangtelu?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Jakarta
db.username=root
db.password=<password_anda>
```

## Setup lokal

```bash
cp src/main/resources/db.properties.example src/main/resources/db.properties
# Edit db.properties dengan kredensial MySQL Anda
```

## Verifikasi koneksi

Jalankan aplikasi, lalu buka:

```
http://localhost:8080/aplikasipinjamruangtelu/db-test
```

Halaman ini menampilkan status koneksi dan daftar tabel yang ada di database.

## Tabel (9 tabel)

Skema lengkap: `docs/schema.sql` — jalankan ulang jika perlu reset:

```bash
mysql -u root -p < docs/schema.sql
```

| Tabel | Deskripsi | Modul terkait |
|-------|-----------|---------------|
| `users` | Pengguna & role (PEMINJAM, PEMBINA, SSC, LOGAM_TUS) | modul1_auth |
| `ruangan` | Data ruang yang bisa dipinjam | modul2_ruang |
| `pengajuan` | Pengajuan peminjaman ruang | modul3_peminjaman |
| `logistik` | Master data logistik/alat | modul2_ruang |
| `pengajuan_logistik` | Logistik per pengajuan | modul3_peminjaman |
| `f01` | Form detail tipe F01 | modul3_peminjaman |
| `f02` | Form detail tipe F02 | modul3_peminjaman |
| `f03` | Output/surat hasil pengajuan | modul4_approval |
| `notifikasi` | Notifikasi ke pengguna | modul4_approval |

### Akun uji (sudah di-seed)

| Role | Email | Password |
|------|-------|----------|
| PEMINJAM | peminjam@telu.ac.id | peminjam123 |
| PEMBINA | pembina@telu.ac.id | pembina123 |
| SSC | ssc@telu.ac.id | ssc123 |
| LOGAM_TUS | logamtus@telu.ac.id | logamtus123 |

## Kelas koneksi bersama

- `com.telu.pinjamruang.config.DatabaseConfig` — baca `db.properties`
- `com.telu.pinjamruang.util.DBConnection` — `getConnection()`
- `com.telu.pinjamruang.dao.BaseDAO` — extend untuk DAO di modul masing-masing
