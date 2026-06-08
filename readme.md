## Ringkasan

- Framework: Java Servlet + JSP (Jakarta EE)
- Build: Apache Maven
- Web server target: Apache Tomcat 10 (WAR packaging)
- Database: MySQL (database: `db_pinjamruangtelu`)
- Java: JDK 11+ (project compiled for Java 11)

## Tim & Pembagian Kerja

Lihat [docs/TEAM.md](docs/TEAM.md) untuk pembagian 4 modul dan alur Git.

| Anggota | Modul | Package |
|---------|-------|---------|
| 1 | Autentikasi & pengguna | `modul1_auth` |
| 2 | Ruang & jadwal | `modul2_ruang` |
| 3 | Pengajuan peminjaman | `modul3_peminjaman` |
| 4 | Persetujuan & admin | `modul4_approval` |

## Setup Database

```bash
cp src/main/resources/db.properties.example src/main/resources/db.properties
# Edit db.properties — isi username & password MySQL
```

Verifikasi: `http://localhost:8080/aplikasipinjamruangtelu/db-test`

## Push ke GitHub

Lihat [docs/GITHUB_SETUP.md](docs/GITHUB_SETUP.md).

## Build

1. Bangun artifact:

```bash
mvn clean package
```

Hasilnya: `target/aplikasipinjamruangtelu-1.0-SNAPSHOT.war`.

## Menjalankan aplikasi (pilih salah satu)

- Dengan Tomcat lokal:

```bash
# letakkan WAR ke tomcat/webapps (atau gunakan skrip deploy)
cp target/*.war tomcat/webapps/aplikasipinjamruangtelu.war
./scripts/start-tomcat.sh    # atau tomcat/bin/startup.sh
```

Lalu akses: `http://localhost:8080/aplikasipinjamruangtelu/`

- Dengan Jetty (development, hot reload):

```bash
mvn jetty:run -Djetty.port=8080
# atau gunakan port lain jika 8080 dipakai:
mvn jetty:run -Djetty.port=8081
```

## Skrip yang disertakan

- `scripts/start-tomcat.sh` — mulai Tomcat di `./tomcat`
- `scripts/stop-tomcat.sh` — hentikan Tomcat

Gunakan skrip ini jika Anda menaruh Tomcat di folder proyek `./tomcat`.

## Akun (placeholder)

- PEMINJAM: `peminjam@telu.ac.id` / `peminjam123`
- PEMBINA: `pembina@telu.ac.id` / `pembina123`
- SSC: `ssc@telu.ac.id` / `ssc123`
- LOGAM_TUS: `logamtus@telu.ac.id` / `logamtus123`

---

<!-- skrip `scripts/deploy-to-tomcat.sh` yang otomatis membuild lalu menyalin WAR ke `tomcat/webapps/`. -->
