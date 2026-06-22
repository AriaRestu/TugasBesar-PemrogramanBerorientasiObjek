package com.telu.pinjamruang.model.ruang;

public class Ruangan {

    private int id;
    private String namaRuangan;
    private String jenis;
    private int kapasitas;
    private String lokasi;
    private String deskripsi;
    private boolean statusAktif;

    public Ruangan() {
    }

    public Ruangan(
            int id,
            String namaRuangan,
            String jenis,
            int kapasitas,
            String lokasi,
            String deskripsi,
            boolean statusAktif) {

        this.id = id;
        this.namaRuangan = namaRuangan;
        this.jenis = jenis;
        this.kapasitas = kapasitas;
        this.lokasi = lokasi;
        this.deskripsi = deskripsi;
        this.statusAktif = statusAktif;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaRuangan() {
        return namaRuangan;
    }

    public void setNamaRuangan(String namaRuangan) {
        this.namaRuangan = namaRuangan;
    }

    public String getJenis() {
        return jenis;
    }

    public void setJenis(String jenis) {
        this.jenis = jenis;
    }

    public int getKapasitas() {
        return kapasitas;
    }

    public void setKapasitas(int kapasitas) {
        this.kapasitas = kapasitas;
    }

    public String getLokasi() {
        return lokasi;
    }

    public void setLokasi(String lokasi) {
        this.lokasi = lokasi;
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
