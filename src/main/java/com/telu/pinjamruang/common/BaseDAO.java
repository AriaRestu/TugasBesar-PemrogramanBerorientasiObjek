package com.telu.pinjamruang.common;

import com.telu.pinjamruang.exception.DatabaseException;
import com.telu.pinjamruang.util.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

/**
 * [ABSTRACT CLASS] Base untuk semua DAO.
 * Menyediakan koneksi database dan mendefinisikan kontrak CRUD melalui interface.
 *
 * OOP Concepts:
 * - ABSTRACT CLASS  : tidak bisa diinstansiasi langsung
 * - IMPLEMENTS      : memenuhi kontrak interface CrudRepository<T>
 * - INHERITANCE     : semua DAO (RuanganDAO, UserDAO, dst) extends BaseDAO
 * - POLYMORPHISM    : setiap DAO override method findAll(), findById(), insert(), update(), delete()
 *
 * @param <T> tipe model yang dikelola DAO ini
 */
public abstract class BaseDAO<T> implements CrudRepository<T> {

    /**
     * Ambil koneksi JDBC ke database.
     * Throws DatabaseException jika koneksi gagal.
     */
    protected Connection getConnection() {
        try {
            return DBConnection.getConnection();
        } catch (RuntimeException e) {
            throw new DatabaseException("Gagal mendapatkan koneksi database", e);
        }
    }

    // ── Default implementations (subclass wajib override) ──────────────────

    @Override
    public List<T> findAll() {
        throw new UnsupportedOperationException("findAll() belum diimplementasikan di " + getClass().getSimpleName());
    }

    @Override
    public T findById(int id) {
        throw new UnsupportedOperationException("findById() belum diimplementasikan di " + getClass().getSimpleName());
    }

    @Override
    public int insert(T entity) {
        throw new UnsupportedOperationException("insert() belum diimplementasikan di " + getClass().getSimpleName());
    }

    @Override
    public boolean update(T entity) {
        throw new UnsupportedOperationException("update() belum diimplementasikan di " + getClass().getSimpleName());
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("delete() belum diimplementasikan di " + getClass().getSimpleName());
    }
}
