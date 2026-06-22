package com.telu.pinjamruang.model.dokumen;

import java.sql.Timestamp;

public class F02 {

    private int id;
    private int pengajuanId;
    private String catatan;
    private String filePath;
    private Timestamp createdAt;

    public F02() {
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
