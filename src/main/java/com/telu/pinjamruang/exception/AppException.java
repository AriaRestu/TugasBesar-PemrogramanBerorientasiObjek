package com.telu.pinjamruang.exception;

/**
 * [EXCEPTION] Base custom exception untuk seluruh aplikasi.
 * Semua custom exception lain mewarisi (extends) class ini.
 *
 * OOP Concept: CLASS + CONSTRUCTOR + INHERITANCE (sebagai parent)
 */
public class AppException extends RuntimeException {

    public AppException(String message) {
        super(message);
    }

    public AppException(String message, Throwable cause) {
        super(message, cause);
    }
}
