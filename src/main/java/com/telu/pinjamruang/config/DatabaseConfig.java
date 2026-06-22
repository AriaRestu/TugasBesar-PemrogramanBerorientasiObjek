package com.telu.pinjamruang.config;

public class DatabaseConfig {

    public static final String DRIVER =
            "com.mysql.cj.jdbc.Driver";

    public static final String URL =
            "jdbc:mysql://localhost:3306/db_pinjamruangtelu";

    public static final String USERNAME =
            "root";

    public static final String PASSWORD =
            "gibran99";
    private DatabaseConfig() {
        // Prevent Instantiation
    }
}