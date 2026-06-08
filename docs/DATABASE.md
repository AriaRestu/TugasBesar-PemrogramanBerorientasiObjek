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

## Tabel

> Tabel sudah dibuat di database. Setelah koneksi berhasil, daftar tabel akan muncul otomatis di `/db-test`.
> Dokumentasikan skema tabel di bawah ini setelah verifikasi.

| Tabel | Deskripsi | Modul terkait |
|-------|-----------|---------------|
| _(isi setelah cek /db-test)_ | | |

## Kelas koneksi bersama

- `com.telu.pinjamruang.config.DatabaseConfig` — baca `db.properties`
- `com.telu.pinjamruang.util.DBConnection` — `getConnection()`
- `com.telu.pinjamruang.dao.BaseDAO` — extend untuk DAO di modul masing-masing
