package com.telu.pinjamruang.dao;

import com.telu.pinjamruang.util.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * Kelas dasar untuk semua DAO. Setiap anggota tim membuat DAO
 * di package masing-masing sesuai modul tugasnya.
 */
public abstract class BaseDAO {

    protected Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
}
