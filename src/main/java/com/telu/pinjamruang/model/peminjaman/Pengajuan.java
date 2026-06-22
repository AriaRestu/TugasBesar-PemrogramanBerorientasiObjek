package com.telu.pinjamruang.model.peminjaman;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Pengajuan {

    private int id;
    private int userId;
    private Integer ruanganId;
    private String noTiket;
    private String jenisPengajuan;
    private Timestamp tanggalPengajuan;
    private Date tanggalPinjam;
    private Time waktuMulai;
    private Time waktuSelesai;
    private String keperluan;
    private String catatan;
    private String status;

    // Relasi — untuk tampilan
    private String namaUser;
    private String namaRuangan;

    public Pengajuan() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Integer getRuanganId() {
        return ruanganId;
    }

    public void setRuanganId(Integer ruanganId) {
        this.ruanganId = ruanganId;
    }

    public String getNoTiket() {
        return noTiket;
    }

    public void setNoTiket(String noTiket) {
        this.noTiket = noTiket;
    }

    public String getJenisPengajuan() {
        return jenisPengajuan;
    }

    public void setJenisPengajuan(String jenisPengajuan) {
        this.jenisPengajuan = jenisPengajuan;
    }

    public Timestamp getTanggalPengajuan() {
        return tanggalPengajuan;
    }

    public void setTanggalPengajuan(Timestamp tanggalPengajuan) {
        this.tanggalPengajuan = tanggalPengajuan;
    }

    public Date getTanggalPinjam() {
        return tanggalPinjam;
    }

    public void setTanggalPinjam(Date tanggalPinjam) {
        this.tanggalPinjam = tanggalPinjam;
    }

    public Time getWaktuMulai() {
        return waktuMulai;
    }

    public void setWaktuMulai(Time waktuMulai) {
        this.waktuMulai = waktuMulai;
    }

    public Time getWaktuSelesai() {
        return waktuSelesai;
    }

    public void setWaktuSelesai(Time waktuSelesai) {
        this.waktuSelesai = waktuSelesai;
    }

    public String getKeperluan() {
        return keperluan;
    }

    public void setKeperluan(String keperluan) {
        this.keperluan = keperluan;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNamaUser() {
        return namaUser;
    }

    public void setNamaUser(String namaUser) {
        this.namaUser = namaUser;
    }

    public String getNamaRuangan() {
        return namaRuangan;
    }

    public void setNamaRuangan(String namaRuangan) {
        this.namaRuangan = namaRuangan;
    }
}
