# Pembagian Kerja Tim (4 Anggota)

Aplikasi **Pinjam Ruang Tel-U** — Java Servlet + JSP + MySQL (`db_pinjamruangtelu`)

## Struktur Branch Git

| Branch | Pemilik | Modul |
|--------|---------|-------|
| `main` | Semua | Branch stabil, hanya merge via Pull Request |
| `feat/modul1-auth` | Gibran | Autentikasi & pengguna |
| `feat/modul2-ruang` | Andra | Ruang & jadwal |
| `feat/modul3-peminjaman` | Brian | Pengajuan peminjaman |
| `feat/modul4-approval` | Aria | Persetujuan & admin |

## Pembagian Tugas

### Gibran — Autentikasi & Manajemen Pengguna
**Package:** `com.telu.pinjamruang.modul1_auth`

| Layer | Tugas | File |
|-------|-------|------|
| Controller | Login & logout | `controller/LoginController.java` |
| View | Halaman login | `WEB-INF/views/auth/login.jsp` |
| Model | Entity user | `model/User.java` |
| DAO | Akses DB user | `dao/UserDAO.java` |

**Akun uji (dari database):**
- PEMINJAM: `peminjam@telu.ac.id`
- PEMBINA: `pembina@telu.ac.id`
- SSC: `ssc@telu.ac.id`
- LOGAM_TUS: `logamtus@telu.ac.id`

---

### Andra — Manajemen Ruang & Jadwal
**Package:** `com.telu.pinjamruang.modul2_ruang`

| Layer | Tugas | File |
|-------|-------|------|
| Controller | Daftar & jadwal ruang | `controller/RuangListController.java`, `RuangJadwalController.java` |
| View | Halaman ruang | `WEB-INF/views/ruang/list.jsp`, `jadwal.jsp` |
| Model | Entity ruang | `model/Ruang.java`, `Jadwal.java` |
| DAO | Akses DB ruang | `dao/RuangDAO.java`, `JadwalDAO.java` |

---

### Brian — Pengajuan Peminjaman
**Package:** `com.telu.pinjamruang.modul3_peminjaman`

| Layer | Tugas | File |
|-------|-------|------|
| Controller | Form & riwayat | `controller/PeminjamanFormController.java`, `PeminjamanRiwayatController.java` |
| View | Halaman peminjaman | `WEB-INF/views/peminjaman/form.jsp`, `riwayat.jsp` |
| Model | Entity pengajuan | `model/Peminjaman.java` |
| DAO | Akses DB pengajuan | `dao/PeminjamanDAO.java` |

---

### Aria — Persetujuan & Admin
**Package:** `com.telu.pinjamruang.modul4_approval`

| Layer | Tugas | File |
|-------|-------|------|
| Controller | Dashboard & laporan | `controller/ApprovalDashboardController.java`, `ApprovalLaporanController.java` |
| View | Halaman approval | `WEB-INF/views/approval/dashboard.jsp`, `laporan.jsp` |
| Model | Entity approval | `model/Approval.java` |
| DAO | Akses DB approval | `dao/ApprovalDAO.java` |

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
2. **Shared code** (`config/`, `util/`, `common/`) — diskusikan dulu di grup sebelum diubah.
3. **Merge ke `main`** hanya lewat Pull Request, minimal 1 review dari anggota lain.
4. **Commit message** format: `feat(modulX): deskripsi singkat`
5. **Struktur MVC** — lihat `docs/MVC.md`
6. **Test koneksi DB** sebelum mulai: `http://localhost:8080/db-test`

## Setup Awal (hari ini)

- [x] Struktur Maven + JDBC connection
- [x] Package per modul (4 anggota)
- [x] Servlet test koneksi database (`/db-test`)
- [ ] Push ke GitHub (lihat `docs/GITHUB_SETUP.md`)
- [ ] Setiap anggota clone & buat branch modul
- [ ] Isi `db.properties` masing-masing
- [ ] Verifikasi tabel di `/db-test` sesuai skema database
