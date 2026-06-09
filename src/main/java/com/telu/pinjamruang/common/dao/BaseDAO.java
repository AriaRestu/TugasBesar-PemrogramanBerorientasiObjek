package com.telu.pinjamruang.common.dao;

import com.telu.pinjamruang.util.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;

public abstract class BaseDAO {

    protected Connection getConnection() throws SQLException {
        return DBConnection.getConnection();
    }
}
