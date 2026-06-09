# Setup GitHub Repository

## Langkah 1 — Buat repo di GitHub

1. Buka [github.com/new](https://github.com/new)
2. Nama repo: `aplikasipinjamruangtelu`
3. Visibility: **Private** (untuk proyek kelompok) atau Public
4. **Jangan** centang "Add README" (sudah ada di lokal)
5. Klik **Create repository**

## Langkah 2 — Push dari lokal

```bash
cd /path/ke/mavenproject2

# Init & commit pertama (sudah dilakukan jika Anda ikuti setup ini)
git init
git add .
git commit -m "init: struktur proyek, JDBC connection, pembagian kerja 4 modul"

# Hubungkan ke GitHub (ganti USERNAME)
git remote add origin https://github.com/USERNAME/aplikasipinjamruangtelu.git
git branch -M main
git push -u origin main
```

## Langkah 3 — Undang anggota tim

Di GitHub repo → **Settings** → **Collaborators** → tambahkan Andra, Brian, dan Aria.

## Langkah 4 — Buat branch untuk tiap modul

Setelah semua anggota punya akses, masing-masing:

```bash
git checkout -b feat/modul1-auth    # Gibran
git checkout -b feat/modul2-ruang   # Andra
git checkout -b feat/modul3-peminjaman  # Brian
git checkout -b feat/modul4-approval    # Aria
git push -u origin <nama-branch>
```

## Branch Protection (opsional, direkomendasikan)

Settings → Branches → Add rule untuk `main`:
- Require pull request before merging
- Require 1 approval
