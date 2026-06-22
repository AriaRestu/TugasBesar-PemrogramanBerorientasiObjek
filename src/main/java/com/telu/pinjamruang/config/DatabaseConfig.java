package com.telu.pinjamruang.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Membaca konfigurasi database dari db.properties (layaknya .env).
 * Nilai tidak di-hardcode di sini — ubah cukup di db.properties.
 */
public class DatabaseConfig {

    public static final String DRIVER;
    public static final String URL;
    public static final String USERNAME;
    public static final String PASSWORD;

    static {
        Properties props = new Properties();
        try (InputStream in = DatabaseConfig.class
                .getClassLoader()
                .getResourceAsStream("db.properties")) {
            if (in == null) throw new RuntimeException("db.properties tidak ditemukan di classpath");
            props.load(in);
        } catch (IOException e) {
            throw new RuntimeException("Gagal membaca db.properties", e);
        }
        DRIVER   = props.getProperty("db.driver");
        URL      = props.getProperty("db.url");
        USERNAME = props.getProperty("db.username");
        PASSWORD = props.getProperty("db.password");
    }

    private DatabaseConfig() {}
}
