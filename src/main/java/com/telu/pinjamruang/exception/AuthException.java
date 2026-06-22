package com.telu.pinjamruang.exception;

/**
 * [EXCEPTION] Dilempar saat terjadi error autentikasi / otorisasi.
 * Contoh: login gagal, akses tidak diizinkan, role tidak cocok.
 *
 * OOP Concept: INHERITANCE — extends AppException
 */
public class AuthException extends AppException {

    public AuthException(String message) {
        super(message);
    }

    public AuthException(String message, Throwable cause) {
        super(message, cause);
    }
}
