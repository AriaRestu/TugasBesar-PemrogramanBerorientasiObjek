package com.telu.pinjamruang.util;

import com.telu.pinjamruang.config.DatabaseConfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private DBConnection() {
    }

    public static Connection getConnection() {

        try {

            Class.forName(DatabaseConfig.DRIVER);
            Connection connection = DriverManager.getConnection(
                    DatabaseConfig.URL,
                    DatabaseConfig.USERNAME,
                    DatabaseConfig.PASSWORD
            );
            System.out.println("Berhasil terhubung ke database: " + DatabaseConfig.URL);
            return connection;

        } catch (ClassNotFoundException | SQLException e) {

            throw new RuntimeException(
                    "Gagal terhubung ke database",
                    e
            );
        }
    }
}