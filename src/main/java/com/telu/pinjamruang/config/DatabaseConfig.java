package com.telu.pinjamruang.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public final class DatabaseConfig {

    private static final String PROPERTIES_FILE = "db.properties";
    private static final Properties PROPERTIES = new Properties();

    static {
        try (InputStream input = DatabaseConfig.class.getClassLoader()
                .getResourceAsStream(PROPERTIES_FILE)) {
            if (input == null) {
                throw new IllegalStateException(
                        "File " + PROPERTIES_FILE + " tidak ditemukan. "
                        + "Salin db.properties.example ke db.properties.");
            }
            PROPERTIES.load(input);
        } catch (IOException e) {
            throw new ExceptionInInitializerError("Gagal memuat konfigurasi database: " + e.getMessage());
        }
    }

    private DatabaseConfig() {
    }

    public static String getDriver() {
        return PROPERTIES.getProperty("db.driver");
    }

    public static String getUrl() {
        return PROPERTIES.getProperty("db.url");
    }

    public static String getUsername() {
        return PROPERTIES.getProperty("db.username");
    }

    public static String getPassword() {
        return PROPERTIES.getProperty("db.password");
    }
}
