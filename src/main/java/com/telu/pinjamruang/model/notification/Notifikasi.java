package com.telu.pinjamruang.model.notification;

import java.sql.Timestamp;

public class Notifikasi {

    private int id;
    private int userId;
    private Integer pengajuanId;
    private String pesan;
    private Timestamp tanggal;
    private boolean dibaca;
    private String tipe;
    private String link;

    public Notifikasi() {
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

    public Integer getPengajuanId() {
        return pengajuanId;
    }

    public void setPengajuanId(Integer pengajuanId) {
        this.pengajuanId = pengajuanId;
    }

    public String getPesan() {
        return pesan;
    }

    public void setPesan(String pesan) {
        this.pesan = pesan;
    }

    public Timestamp getTanggal() {
        return tanggal;
    }

    public void setTanggal(Timestamp tanggal) {
        this.tanggal = tanggal;
    }

    public boolean isDibaca() {
        return dibaca;
    }

    public void setDibaca(boolean dibaca) {
        this.dibaca = dibaca;
    }

    public String getTipe() {
        return tipe;
    }

    public void setTipe(String tipe) {
        this.tipe = tipe;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
