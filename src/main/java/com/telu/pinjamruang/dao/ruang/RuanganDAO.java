package com.telu.pinjamruang.dao.ruang;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.exception.DatabaseException;
import com.telu.pinjamruang.model.ruang.Ruangan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * [INHERITANCE] RuanganDAO extends BaseDAO<Ruangan>
 * [POLYMORPHISM] Override findAll(), findById(), insert(), update(), delete() dari CrudRepository
 * [EXCEPTION]   Throws DatabaseException saat operasi JDBC gagal
 * [OBJECT]      Instansiasi Ruangan dari ResultSet (mapRow)
 */
public class RuanganDAO extends BaseDAO<Ruangan> {

    /** [POLYMORPHISM] Override dari CrudRepository.findAll() */
    @Override
    public List<Ruangan> findAll() {
        List<Ruangan> list = new ArrayList<>();
        String sql = "SELECT * FROM ruangan ORDER BY nama_ruangan";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            throw new DatabaseException("Gagal mengambil semua ruangan", e);
        }
        return list;
    }

    /** Ambil semua ruangan yang aktif */
    public List<Ruangan> findAllAktif() {
        List<Ruangan> list = new ArrayList<>();
        String sql = "SELECT * FROM ruangan WHERE status_aktif = TRUE ORDER BY nama_ruangan";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            throw new DatabaseException("Gagal mengambil ruangan aktif", e);
        }
        return list;
    }

    /** [POLYMORPHISM] Override dari CrudRepository.findById() */
    @Override
    public Ruangan findById(int id) {
        String sql = "SELECT * FROM ruangan WHERE id = ?";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapRow(rs);
            }
        } catch (Exception e) {
            throw new DatabaseException("Gagal mencari ruangan id=" + id, e);
        }
        return null;
    }

    /** [POLYMORPHISM] Override dari CrudRepository.insert() */
    @Override
    public int insert(Ruangan ruangan) {
        String sql = "INSERT INTO ruangan (nama_ruangan, jenis, kapasitas, lokasi, deskripsi, status_aktif) VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            ps.setString(1, ruangan.getNamaRuangan());
            ps.setString(2, ruangan.getJenis());
            ps.setInt(3, ruangan.getKapasitas());
            ps.setString(4, ruangan.getLokasi());
            ps.setString(5, ruangan.getDeskripsi());
            ps.setBoolean(6, ruangan.isStatusAktif());
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) {
            throw new DatabaseException("Gagal insert ruangan", e);
        }
        return -1;
    }

    /** [POLYMORPHISM] Override dari CrudRepository.update() */
    @Override
    public boolean update(Ruangan ruangan) {
        String sql = "UPDATE ruangan SET nama_ruangan=?, jenis=?, kapasitas=?, lokasi=?, deskripsi=?, status_aktif=? WHERE id=?";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, ruangan.getNamaRuangan());
            ps.setString(2, ruangan.getJenis());
            ps.setInt(3, ruangan.getKapasitas());
            ps.setString(4, ruangan.getLokasi());
            ps.setString(5, ruangan.getDeskripsi());
            ps.setBoolean(6, ruangan.isStatusAktif());
            ps.setInt(7, ruangan.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            throw new DatabaseException("Gagal update ruangan id=" + ruangan.getId(), e);
        }
    }

    /** [POLYMORPHISM] Override dari CrudRepository.delete() */
    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM ruangan WHERE id = ?";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            throw new DatabaseException("Gagal hapus ruangan id=" + id, e);
        }
    }

    /** Cek ketersediaan ruangan pada tanggal & waktu tertentu */
    public boolean isAvailable(int ruanganId, String tanggal, String waktuMulai, String waktuSelesai) {
        String sql =
            "SELECT COUNT(*) FROM pengajuan WHERE ruangan_id=? AND tanggal_pinjam=? " +
            "AND status NOT IN ('DITOLAK','DRAFT') AND waktu_mulai<? AND waktu_selesai>?";

        try (
            Connection conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, ruanganId);
            ps.setString(2, tanggal);
            ps.setString(3, waktuSelesai);
            ps.setString(4, waktuMulai);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1) == 0;
        } catch (Exception e) {
            throw new DatabaseException("Gagal cek ketersediaan ruangan", e);
        }
        return false;
    }

    /** [OBJECT] Mapping ResultSet → object Ruangan */
    private Ruangan mapRow(ResultSet rs) throws Exception {
        Ruangan r = new Ruangan();   // OBJECT instantiation
        r.setId(rs.getInt("id"));
        r.setNamaRuangan(rs.getString("nama_ruangan"));
        r.setJenis(rs.getString("jenis"));
        r.setKapasitas(rs.getInt("kapasitas"));
        r.setLokasi(rs.getString("lokasi"));
        r.setDeskripsi(rs.getString("deskripsi"));
        r.setStatusAktif(rs.getBoolean("status_aktif"));
        return r;
    }
}
