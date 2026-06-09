# API Ping (Placeholder)

Endpoint sederhana untuk cek ketersediaan API tiap modul (Controller layer MVC). Semua mengembalikan JSON `status: ok`.

## Endpoints

| Method | URL | Modul | Pemilik |
|--------|-----|-------|---------|
| GET | `/api/ping` | Aplikasi | Tim |
| GET | `/api/auth/ping` | Autentikasi | Gibran |
| GET | `/api/ruang/ping` | Ruang & jadwal | Andra |
| GET | `/api/peminjaman/ping` | Peminjaman | Brian |
| GET | `/api/approval/ping` | Approval | Aria |

## Contoh response

```json
{
  "status": "ok",
  "module": "auth",
  "owner": "Gibran",
  "message": "API modul autentikasi siap",
  "timestamp": "2026-06-09T10:00:00Z"
}
```

## Test

```bash
curl http://localhost:8080/api/ping
curl http://localhost:8080/api/auth/ping
curl http://localhost:8080/api/ruang/ping
curl http://localhost:8080/api/peminjaman/ping
curl http://localhost:8080/api/approval/ping
```
