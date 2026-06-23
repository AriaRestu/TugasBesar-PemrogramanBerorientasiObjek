package com.telu.pinjamruang.common;

import com.telu.pinjamruang.exception.DatabaseException;
import com.telu.pinjamruang.util.DBConnection;

import java.sql.Connection;
import java.util.List;

/**
 * @param <T> tipe model yang dikelola DAO ini
 */

public abstract class BaseDAO<T> implements CrudRepository<T> {


    protected Connection getConnection() {
        try {
            return DBConnection.getConnection();
        } catch (RuntimeException e) {
            throw new DatabaseException("Gagal mendapatkan koneksi database", e);
        }
    }


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
