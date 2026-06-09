# Struktur MVC

Aplikasi memakai pola **Model — View — Controller**, dikelompokkan per fitur (auth, ruang, peminjaman, approval).

## Konsep

| Layer | Peran | Lokasi |
|-------|-------|--------|
| **Model** | Entity & data class | `model/{fitur}/` |
| **DAO** | Akses database | `dao/{fitur}/` |
| **View** | Tampilan HTML (JSP) | `WEB-INF/views/` |
| **Controller** | Routing & logika request | `controller/{fitur}/` |

View **tidak** diakses langsung dari browser. Semua halaman lewat Controller (Servlet) yang `forward` ke JSP.

## Struktur folder

```
src/main/java/com/telu/pinjamruang/
├── config/                         # konfigurasi DB
├── util/                           # helper koneksi
├── common/                         # class dasar bersama
│   ├── api/ApiResponse.java
│   ├── BaseViewController.java
│   ├── BasePingController.java
│   └── BaseDAO.java
├── controller/                     # semua Servlet
│   ├── HomeController.java         # halaman utama
│   ├── AppPingController.java      # health check app
│   ├── DBTestController.java       # tes koneksi DB
│   ├── auth/                       # Gibran — login & user
│   ├── ruang/                      # Andra — ruang & jadwal
│   ├── peminjaman/                 # Brian — pengajuan
│   └── approval/                   # Aria — persetujuan
├── model/                          # entity per fitur
│   ├── auth/
│   ├── ruang/
│   ├── peminjaman/
│   └── approval/
└── dao/                            # akses DB per fitur
    ├── auth/
    ├── ruang/
    ├── peminjaman/
    └── approval/

src/main/webapp/
├── WEB-INF/views/                  # semua JSP (View)
│   ├── fragments/
│   ├── auth/login.jsp
│   ├── home.jsp
│   ├── ruang/
│   ├── peminjaman/
│   └── approval/
└── assets/css/
```

## Routing

### Halaman (View via Controller)

| URL | Controller | View |
|-----|------------|------|
| `/login` | `LoginController` | `auth/login.jsp` |
| `/logout` | `LoginController` | `auth/login.jsp` |
| `/home` | `HomeController` | `home.jsp` |
| `/ruang/list` | `RuangListController` | `ruang/list.jsp` |
| `/ruang/jadwal` | `RuangJadwalController` | `ruang/jadwal.jsp` |
| `/peminjaman/form` | `PeminjamanFormController` | `peminjaman/form.jsp` |
| `/peminjaman/riwayat` | `PeminjamanRiwayatController` | `peminjaman/riwayat.jsp` |
| `/approval/dashboard` | `ApprovalDashboardController` | `approval/dashboard.jsp` |
| `/approval/laporan` | `ApprovalLaporanController` | `approval/laporan.jsp` |

### API (Controller JSON)

| URL | Controller |
|-----|------------|
| `/api/ping` | `AppPingController` |
| `/api/auth/ping` | `AuthPingController` |
| `/api/ruang/ping` | `RuangPingController` |
| `/api/peminjaman/ping` | `PeminjamanPingController` |
| `/api/approval/ping` | `ApprovalPingController` |

## Alur request halaman

```
Browser  →  GET /ruang/list
         →  RuangListController (controller/ruang/)
         →  forward ke WEB-INF/views/ruang/list.jsp (View)
         →  HTML ke browser
```

## Alur request API

```
Browser  →  GET /api/ruang/ping
         →  RuangPingController (controller/ruang/)
         →  JSON response
```

## Tugas per anggota (MVC)

| Anggota | Controller | Model | DAO | View |
|---------|------------|-------|-----|------|
| Gibran | `controller/auth/` | `model/auth/` | `dao/auth/` | `views/auth/` |
| Andra | `controller/ruang/` | `model/ruang/` | `dao/ruang/` | `views/ruang/` |
| Brian | `controller/peminjaman/` | `model/peminjaman/` | `dao/peminjaman/` | `views/peminjaman/` |
| Aria | `controller/approval/` | `model/approval/` | `dao/approval/` | `views/approval/` |
