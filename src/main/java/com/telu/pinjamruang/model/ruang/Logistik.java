package com.telu.pinjamruang.model.ruang;

public class Logistik {

    private int id;
    private String namaLogistik;
    private String kategori;
    private String satuan;
    private int jumlahTersedia;
    private String deskripsi;
    private boolean statusAktif;

    public Logistik() {
    }

    public Logistik(
            int id,
            String namaLogistik,
            String kategori,
            String satuan,
            int jumlahTersedia,
            String deskripsi,
            boolean statusAktif) {

        this.id = id;
        this.namaLogistik = namaLogistik;
        this.kategori = kategori;
        this.satuan = satuan;
        this.jumlahTersedia = jumlahTersedia;
        this.deskripsi = deskripsi;
        this.statusAktif = statusAktif;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaLogistik() {
        return namaLogistik;
    }

    public void setNamaLogistik(String namaLogistik) {
        this.namaLogistik = namaLogistik;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getSatuan() {
        return satuan;
    }

    public void setSatuan(String satuan) {
        this.satuan = satuan;
    }

    public int getJumlahTersedia() {
        return jumlahTersedia;
    }

    public void setJumlahTersedia(int jumlahTersedia) {
        this.jumlahTersedia = jumlahTersedia;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public boolean isStatusAktif() {
        return statusAktif;
    }

    public void setStatusAktif(boolean statusAktif) {
        this.statusAktif = statusAktif;
    }
}
