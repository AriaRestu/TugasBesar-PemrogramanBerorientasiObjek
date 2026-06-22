package com.telu.pinjamruang.model.peminjaman;

public class PengajuanLogistik {

    private int id;
    private int pengajuanId;
    private int logistikId;
    private int jumlah;
    private String keterangan;

    // Relasi — untuk tampilan
    private String namaLogistik;
    private String satuan;

    public PengajuanLogistik() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPengajuanId() {
        return pengajuanId;
    }

    public void setPengajuanId(int pengajuanId) {
        this.pengajuanId = pengajuanId;
    }

    public int getLogistikId() {
        return logistikId;
    }

    public void setLogistikId(int logistikId) {
        this.logistikId = logistikId;
    }

    public int getJumlah() {
        return jumlah;
    }

    public void setJumlah(int jumlah) {
        this.jumlah = jumlah;
    }

    public String getKeterangan() {
        return keterangan;
    }

    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }

    public String getNamaLogistik() {
        return namaLogistik;
    }

    public void setNamaLogistik(String namaLogistik) {
        this.namaLogistik = namaLogistik;
    }

    public String getSatuan() {
        return satuan;
    }

    public void setSatuan(String satuan) {
        this.satuan = satuan;
    }
}
