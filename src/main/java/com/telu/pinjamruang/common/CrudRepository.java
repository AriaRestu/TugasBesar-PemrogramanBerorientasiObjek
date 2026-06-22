package com.telu.pinjamruang.common;

import java.util.List;

/**
 * [INTERFACE] Generic CRUD contract yang harus diimplementasikan setiap DAO.
 * Contoh penggunaan OOP: Interface → diimplementasikan oleh BaseDAO dan subclass-nya.
 *
 * @param <T> tipe model (User, Ruangan, Pengajuan, dst)
 */
public interface CrudRepository<T> {

    /** Ambil semua data */
    List<T> findAll();

    /** Cari berdasarkan primary key */
    T findById(int id);

    /** Simpan data baru, kembalikan generated ID */
    int insert(T entity);

    /** Update data yang sudah ada */
    boolean update(T entity);

    /** Hapus berdasarkan ID */
    boolean delete(int id);
}
