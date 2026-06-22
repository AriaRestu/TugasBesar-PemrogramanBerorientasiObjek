package com.telu.pinjamruang.dao.ruang;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.ruang.Logistik;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LogistikDAO extends BaseDAO {

    /** Ambil semua logistik yang aktif */
    public List<Logistik> findAllAktif() {

        List<Logistik> list = new ArrayList<>();

        String sql =
                "SELECT * FROM logistik " +
                "WHERE status_aktif = TRUE " +
                "ORDER BY nama_logistik";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /** Ambil semua logistik */
    public List<Logistik> findAll() {

        List<Logistik> list = new ArrayList<>();

        String sql =
                "SELECT * FROM logistik " +
                "ORDER BY nama_logistik";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {
            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /** Cari berdasarkan ID */
    public Logistik findById(int id) {

        String sql =
                "SELECT * FROM logistik " +
                "WHERE id = ?";

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
            e.printStackTrace();
        }

        return null;
    }

    /** Tambah logistik baru */
    public int insert(Logistik logistik) {

        String sql =
                "INSERT INTO logistik " +
                "(nama_logistik, kategori, satuan, jumlah_tersedia, deskripsi, status_aktif) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            ps.setString(1, logistik.getNamaLogistik());
            ps.setString(2, logistik.getKategori());
            ps.setString(3, logistik.getSatuan());
            ps.setInt(4, logistik.getJumlahTersedia());
            ps.setString(5, logistik.getDeskripsi());
            ps.setBoolean(6, logistik.isStatusAktif());

            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                return keys.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    /** Update logistik */
    public boolean update(Logistik logistik) {

        String sql =
                "UPDATE logistik SET " +
                "nama_logistik = ?, kategori = ?, satuan = ?, " +
                "jumlah_tersedia = ?, deskripsi = ?, status_aktif = ? " +
                "WHERE id = ?";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, logistik.getNamaLogistik());
            ps.setString(2, logistik.getKategori());
            ps.setString(3, logistik.getSatuan());
            ps.setInt(4, logistik.getJumlahTersedia());
            ps.setString(5, logistik.getDeskripsi());
            ps.setBoolean(6, logistik.isStatusAktif());
            ps.setInt(7, logistik.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /** Hapus logistik */
    public boolean delete(int id) {

        String sql =
                "DELETE FROM logistik WHERE id = ?";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /** Cek ketersediaan logistik (jumlah tersedia cukup) */
    public boolean isAvailable(int logistikId, int jumlahDiminta) {

        Logistik logistik = findById(logistikId);
        if (logistik == null) {
            return false;
        }
        return logistik.getJumlahTersedia() >= jumlahDiminta;
    }

    private Logistik mapRow(ResultSet rs) throws Exception {

        Logistik l = new Logistik();
        l.setId(rs.getInt("id"));
        l.setNamaLogistik(rs.getString("nama_logistik"));
        l.setKategori(rs.getString("kategori"));
        l.setSatuan(rs.getString("satuan"));
        l.setJumlahTersedia(rs.getInt("jumlah_tersedia"));
        l.setDeskripsi(rs.getString("deskripsi"));
        l.setStatusAktif(rs.getBoolean("status_aktif"));
        return l;
    }
}
