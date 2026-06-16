package com.telu.pinjamruang.model.auth;

public class User {

    private int id;
    private String nama;
    private String email;
    private String password;
    private String noTelp;
    private String role;

    public User() {
    }

    public User(
            int id,
            String nama,
            String email,
            String password,
            String noTelp,
            String role) {

        this.id = id;
        this.nama = nama;
        this.email = email;
        this.password = password;
        this.noTelp = noTelp;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNoTelp() {
        return noTelp;
    }

    public void setNoTelp(String noTelp) {
        this.noTelp = noTelp;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}