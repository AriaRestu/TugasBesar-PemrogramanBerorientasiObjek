# Struktur MVC

Aplikasi memakai pola **Model — View — Controller** per modul tim.

## Konsep

| Layer | Peran | Lokasi |
|-------|-------|--------|
| **Model** | Entity & akses database | `modulX_*/model/`, `modulX_*/dao/` |
| **View** | Tampilan HTML (JSP) | `WEB-INF/views/` |
| **Controller** | Routing & logika request | `modulX_*/controller/` |

View **tidak** diakses langsung dari browser. Semua halaman lewat Controller (Servlet) yang `forward` ke JSP.

## Struktur folder

```
src/main/java/com/telu/pinjamruang/
├── config/                    # konfigurasi DB
├── util/                      # helper koneksi
├── common/
│   ├── api/ApiResponse.java
│   ├── controller/            # base class Controller
│   └── dao/BaseDAO.java
├── controller/                # controller level aplikasi
│   ├── HomeController.java
│   ├── AppPingController.java
│   └── DBTestController.java
├── modul1_auth/               # Gibran
│   ├── controller/
│   ├── model/
│   └── dao/
├── modul2_ruang/              # Andra
├── modul3_peminjaman/         # Brian
└── modul4_approval/           # Aria

src/main/webapp/
├── WEB-INF/views/             # semua JSP (View)
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
         →  RuangListController (Controller)
         →  forward ke WEB-INF/views/ruang/list.jsp (View)
         →  HTML ke browser
```

## Alur request API

```
Browser  →  GET /api/ruang/ping
         →  RuangPingController (Controller)
         →  JSON response
```

## Tugas per anggota (MVC)

| Anggota | Controller | Model | DAO | View |
|---------|------------|-------|-----|------|
| Gibran | `modul1_auth/controller/` | `modul1_auth/model/` | `modul1_auth/dao/` | `views/auth/` |
| Andra | `modul2_ruang/controller/` | `modul2_ruang/model/` | `modul2_ruang/dao/` | `views/ruang/` |
| Brian | `modul3_peminjaman/controller/` | `modul3_peminjaman/model/` | `modul3_peminjaman/dao/` | `views/peminjaman/` |
| Aria | `modul4_approval/controller/` | `modul4_approval/model/` | `modul4_approval/dao/` | `views/approval/` |
