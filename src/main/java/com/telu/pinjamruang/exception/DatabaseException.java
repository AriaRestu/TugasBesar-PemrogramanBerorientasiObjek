package com.telu.pinjamruang.exception;

/**
 * [EXCEPTION] Dilempar saat terjadi error pada operasi database / JDBC.
 *
 * OOP Concept: INHERITANCE — extends AppException
 */
public class DatabaseException extends AppException {

    public DatabaseException(String message) {
        super(message);
    }

    public DatabaseException(String message, Throwable cause) {
        super(message, cause);
    }
}
