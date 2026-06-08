# Pembagian Kerja Tim (4 Anggota)

Aplikasi **Pinjam Ruang Tel-U** — Java Servlet + JSP + MySQL (`db_pinjamruangtelu`)

## Struktur Branch Git

| Branch | Pemilik | Modul |
|--------|---------|-------|
| `main` | Semua | Branch stabil, hanya merge via Pull Request |
| `feat/modul1-auth` | Anggota 1 | Autentikasi & pengguna |
| `feat/modul2-ruang` | Anggota 2 | Ruang & jadwal |
| `feat/modul3-peminjaman` | Anggota 3 | Pengajuan peminjaman |
| `feat/modul4-approval` | Anggota 4 | Persetujuan & admin |

## Pembagian Tugas

### Anggota 1 — Autentikasi & Manajemen Pengguna
**Package:** `com.telu.pinjamruang.modul1_auth`

| Tugas | File yang dibuat |
|-------|------------------|
| Halaman login & logout | `servlet/LoginServlet.java`, `jsp/login.jsp` |
| Session & filter role | `filter/AuthFilter.java`, `util/SessionUtil.java` |
| DAO pengguna | `dao/UserDAO.java`, `model/User.java` |

**Akun uji (dari database):**
- PEMINJAM: `peminjam@telu.ac.id`
- PEMBINA: `pembina@telu.ac.id`
- SSC: `ssc@telu.ac.id`
- LOGAM_TUS: `logamtus@telu.ac.id`

---

### Anggota 2 — Manajemen Ruang & Jadwal
**Package:** `com.telu.pinjamruang.modul2_ruang`

| Tugas | File yang dibuat |
|-------|------------------|
| Daftar & detail ruang | `servlet/RuangServlet.java`, `jsp/ruang/list.jsp` |
| Cek ketersediaan jadwal | `dao/JadwalDAO.java`, `dao/RuangDAO.java` |
| Model ruang | `model/Ruang.java`, `model/Jadwal.java` |

---

### Anggota 3 — Pengajuan Peminjaman
**Package:** `com.telu.pinjamruang.modul3_peminjaman`

| Tugas | File yang dibuat |
|-------|------------------|
| Form pengajuan peminjaman | `servlet/PeminjamanServlet.java`, `jsp/peminjaman/form.jsp` |
| Riwayat peminjaman | `jsp/peminjaman/riwayat.jsp` |
| DAO peminjaman | `dao/PeminjamanDAO.java`, `model/Peminjaman.java` |

---

### Anggota 4 — Persetujuan & Admin
**Package:** `com.telu.pinjamruang.modul4_approval`

| Tugas | File yang dibuat |
|-------|------------------|
| Dashboard per role | `servlet/ApprovalServlet.java`, `jsp/approval/dashboard.jsp` |
| Alur persetujuan bertingkat | `dao/ApprovalDAO.java`, `model/Approval.java` |
| Laporan peminjaman | `jsp/approval/laporan.jsp` |

---

## Alur Kerja Git (untuk semua anggota)

```bash
# 1. Clone repo
git clone https://github.com/<org>/aplikasipinjamruangtelu.git
cd aplikasipinjamruangtelu

# 2. Setup database lokal
cp src/main/resources/db.properties.example src/main/resources/db.properties
# Edit db.properties — isi username & password MySQL Anda

# 3. Buat branch modul sendiri
git checkout -b feat/modul1-auth   # ganti sesuai modul Anda

# 4. Kerjakan di package masing-masing, commit rutin
git add .
git commit -m "feat(modul1): tambah LoginServlet"

# 5. Push & buat Pull Request ke main
git push -u origin feat/modul1-auth
```

## Aturan Kolaborasi

1. **Jangan edit package orang lain** — kerjakan hanya di `modulX_*` Anda.
2. **Shared code** (`config/`, `util/`, `dao/BaseDAO.java`) — diskusikan dulu di grup sebelum diubah.
3. **Merge ke `main`** hanya lewat Pull Request, minimal 1 review dari anggota lain.
4. **Commit message** format: `feat(modulX): deskripsi singkat`
5. **Test koneksi DB** sebelum mulai: jalankan app lalu buka `http://localhost:8080/aplikasipinjamruangtelu/db-test`

## Setup Awal (hari ini)

- [x] Struktur Maven + JDBC connection
- [x] Package per modul (4 anggota)
- [x] Servlet test koneksi database (`/db-test`)
- [ ] Push ke GitHub (lihat `docs/GITHUB_SETUP.md`)
- [ ] Setiap anggota clone & buat branch modul
- [ ] Isi `db.properties` masing-masing
- [ ] Verifikasi tabel di `/db-test` sesuai skema database
