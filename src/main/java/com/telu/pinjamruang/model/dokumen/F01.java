package com.telu.pinjamruang.model.dokumen;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class F01 {

    private int id;
    private int pengajuanId;
    private String namaOrmawa;
    private String namaKetuaPelaksana;
    private String nim;
    private String programStudi;
    private String noHandphone;
    private String namaKegiatan;
    private Date tanggalKegiatan;
    private String tempatKegiatan;
    private Time waktuMulai;
    private Time waktuSelesai;
    private int totalPeserta;
    private String catatan;
    private String filePath;
    private Timestamp createdAt;

    public F01() {
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

    public String getNamaOrmawa() {
        return namaOrmawa;
    }

    public void setNamaOrmawa(String namaOrmawa) {
        this.namaOrmawa = namaOrmawa;
    }

    public String getNamaKetuaPelaksana() {
        return namaKetuaPelaksana;
    }

    public void setNamaKetuaPelaksana(String namaKetuaPelaksana) {
        this.namaKetuaPelaksana = namaKetuaPelaksana;
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public String getProgramStudi() {
        return programStudi;
    }

    public void setProgramStudi(String programStudi) {
        this.programStudi = programStudi;
    }

    public String getNoHandphone() {
        return noHandphone;
    }

    public void setNoHandphone(String noHandphone) {
        this.noHandphone = noHandphone;
    }

    public String getNamaKegiatan() {
        return namaKegiatan;
    }

    public void setNamaKegiatan(String namaKegiatan) {
        this.namaKegiatan = namaKegiatan;
    }

    public Date getTanggalKegiatan() {
        return tanggalKegiatan;
    }

    public void setTanggalKegiatan(Date tanggalKegiatan) {
        this.tanggalKegiatan = tanggalKegiatan;
    }

    public String getTempatKegiatan() {
        return tempatKegiatan;
    }

    public void setTempatKegiatan(String tempatKegiatan) {
        this.tempatKegiatan = tempatKegiatan;
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

    public int getTotalPeserta() {
        return totalPeserta;
    }

    public void setTotalPeserta(int totalPeserta) {
        this.totalPeserta = totalPeserta;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}
