package com.telu.pinjamruang.model.dokumen;

import java.sql.Timestamp;

public class F03 {

    private int id;
    private int pengajuanId;
    private String noTiket;
    private Timestamp tanggalTerbit;
    private Integer diterbitkanOleh;
    private String filePdf;
    private Timestamp createdAt;

    // Relasi — untuk tampilan
    private String namaPenerbit;

    public F03() {
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

    public String getNoTiket() {
        return noTiket;
    }

    public void setNoTiket(String noTiket) {
        this.noTiket = noTiket;
    }

    public Timestamp getTanggalTerbit() {
        return tanggalTerbit;
    }

    public void setTanggalTerbit(Timestamp tanggalTerbit) {
        this.tanggalTerbit = tanggalTerbit;
    }

    public Integer getDiterbitkanOleh() {
        return diterbitkanOleh;
    }

    public void setDiterbitkanOleh(Integer diterbitkanOleh) {
        this.diterbitkanOleh = diterbitkanOleh;
    }

    public String getFilePdf() {
        return filePdf;
    }

    public void setFilePdf(String filePdf) {
        this.filePdf = filePdf;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getNamaPenerbit() {
        return namaPenerbit;
    }

    public void setNamaPenerbit(String namaPenerbit) {
        this.namaPenerbit = namaPenerbit;
    }
}
