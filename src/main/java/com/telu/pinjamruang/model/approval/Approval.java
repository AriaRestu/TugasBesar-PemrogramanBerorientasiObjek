package com.telu.pinjamruang.model.approval;

import java.sql.Timestamp;

public class Approval {

    private int id;
    private int pengajuanId;
    private int approverId;
    private String roleApprover;
    private String status;
    private String catatan;
    private Timestamp tanggalApproval;

    // Relasi — untuk tampilan
    private String namaApprover;
    private String noTiket;

    public Approval() {
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

    public int getApproverId() {
        return approverId;
    }

    public void setApproverId(int approverId) {
        this.approverId = approverId;
    }

    public String getRoleApprover() {
        return roleApprover;
    }

    public void setRoleApprover(String roleApprover) {
        this.roleApprover = roleApprover;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }

    public Timestamp getTanggalApproval() {
        return tanggalApproval;
    }

    public void setTanggalApproval(Timestamp tanggalApproval) {
        this.tanggalApproval = tanggalApproval;
    }

    public String getNamaApprover() {
        return namaApprover;
    }

    public void setNamaApprover(String namaApprover) {
        this.namaApprover = namaApprover;
    }

    public String getNoTiket() {
        return noTiket;
    }

    public void setNoTiket(String noTiket) {
        this.noTiket = noTiket;
    }
}
