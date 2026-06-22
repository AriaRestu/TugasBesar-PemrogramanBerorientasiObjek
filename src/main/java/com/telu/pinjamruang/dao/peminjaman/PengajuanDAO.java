package com.telu.pinjamruang.dao.peminjaman;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.peminjaman.Pengajuan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PengajuanDAO extends BaseDAO {

    /** Buat pengajuan baru */
    public int insert(Pengajuan p) {

        String sql =
                "INSERT INTO pengajuan " +
                "(user_id, ruangan_id, pembina_id, no_tiket, jenis_pengajuan, " +
                "tanggal_pinjam, waktu_mulai, waktu_selesai, " +
                "keperluan, catatan, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            ps.setInt(1, p.getUserId());

            if (p.getRuanganId() != null) {
                ps.setInt(2, p.getRuanganId());
            } else {
                ps.setNull(2, java.sql.Types.INTEGER);
            }

            if (p.getPembinaId() != null) {
                ps.setInt(3, p.getPembinaId());
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
            }

            ps.setString(4, p.getNoTiket());
            ps.setString(5, p.getJenisPengajuan());
            ps.setDate(6, p.getTanggalPinjam());
            ps.setTime(7, p.getWaktuMulai());
            ps.setTime(8, p.getWaktuSelesai());
            ps.setString(9, p.getKeperluan());
            ps.setString(10, p.getCatatan());
            ps.setString(11, p.getStatus() != null ? p.getStatus() : "DRAFT");

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

    /** Cari pengajuan berdasarkan ID */
    public Pengajuan findById(int id) {

        String sql =
                "SELECT p.*, u.nama AS nama_user, r.nama_ruangan, pb.nama AS nama_pembina " +
                "FROM pengajuan p " +
                "JOIN users u ON p.user_id = u.id " +
                "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
                "LEFT JOIN users pb ON p.pembina_id = pb.id " +
                "WHERE p.id = ?";

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

    /** Ambil semua pengajuan milik user tertentu */
    public List<Pengajuan> findByUserId(int userId) {

        List<Pengajuan> list = new ArrayList<>();

        String sql =
                "SELECT p.*, u.nama AS nama_user, r.nama_ruangan, pb.nama AS nama_pembina " +
                "FROM pengajuan p " +
                "JOIN users u ON p.user_id = u.id " +
                "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
                "LEFT JOIN users pb ON p.pembina_id = pb.id " +
                "WHERE p.user_id = ? " +
                "ORDER BY p.tanggal_pengajuan DESC";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /** Ambil pengajuan berdasarkan status tertentu */
    public List<Pengajuan> findByStatus(String status) {

        List<Pengajuan> list = new ArrayList<>();

        String sql =
                "SELECT p.*, u.nama AS nama_user, r.nama_ruangan, pb.nama AS nama_pembina " +
                "FROM pengajuan p " +
                "JOIN users u ON p.user_id = u.id " +
                "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
                "LEFT JOIN users pb ON p.pembina_id = pb.id " +
                "WHERE p.status = ? " +
                "ORDER BY p.tanggal_pengajuan DESC";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /** Ambil semua pengajuan */
    public List<Pengajuan> findAll() {

        List<Pengajuan> list = new ArrayList<>();

        String sql =
                "SELECT p.*, u.nama AS nama_user, r.nama_ruangan, pb.nama AS nama_pembina " +
                "FROM pengajuan p " +
                "JOIN users u ON p.user_id = u.id " +
                "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
                "LEFT JOIN users pb ON p.pembina_id = pb.id " +
                "ORDER BY p.tanggal_pengajuan DESC";

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

    /** Update status pengajuan */
    public boolean updateStatus(int id, String status, String catatan) {

        String sql =
                "UPDATE pengajuan SET " +
                "status = ?, catatan = ? " +
                "WHERE id = ?";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, status);
            ps.setString(2, catatan);
            ps.setInt(3, id);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /** Update seluruh data pengajuan */
    public boolean update(Pengajuan p) {

        String sql =
                "UPDATE pengajuan SET " +
                "ruangan_id = ?, tanggal_pinjam = ?, " +
                "waktu_mulai = ?, waktu_selesai = ?, " +
                "keperluan = ?, catatan = ?, status = ? " +
                "WHERE id = ?";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            if (p.getRuanganId() != null) {
                ps.setInt(1, p.getRuanganId());
            } else {
                ps.setNull(1, java.sql.Types.INTEGER);
            }
            ps.setDate(2, p.getTanggalPinjam());
            ps.setTime(3, p.getWaktuMulai());
            ps.setTime(4, p.getWaktuSelesai());
            ps.setString(5, p.getKeperluan());
            ps.setString(6, p.getCatatan());
            ps.setString(7, p.getStatus());
            ps.setInt(8, p.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    /** Hapus pengajuan */
    public boolean delete(int id) {

        String sql =
                "DELETE FROM pengajuan WHERE id = ?";

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

    /**
     * Cari pengajuan dengan filter status, keyword, dan paginasi.
     * userId null berarti semua user (untuk role approver).
     */
    public List<Pengajuan> search(Integer userId, String status, String keyword, int page, int pageSize) {
        List<Pengajuan> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT p.*, u.nama AS nama_user, r.nama_ruangan, pb.nama AS nama_pembina " +
            "FROM pengajuan p JOIN users u ON p.user_id = u.id " +
            "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
            "LEFT JOIN users pb ON p.pembina_id = pb.id WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (userId != null)               { sql.append(" AND p.user_id = ?");  params.add(userId); }
        if (status != null && !status.isEmpty()) { sql.append(" AND p.status = ?");   params.add(status); }
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (p.no_tiket LIKE ? OR p.keperluan LIKE ? OR r.nama_ruangan LIKE ? OR u.nama LIKE ?)");
            String kw = "%" + keyword + "%";
            params.add(kw); params.add(kw); params.add(kw); params.add(kw);
        }
        sql.append(" ORDER BY p.tanggal_pengajuan DESC LIMIT ? OFFSET ?");
        params.add(pageSize);
        params.add((page - 1) * pageSize);

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    /** Hitung total baris untuk paginasi */
    public int count(Integer userId, String status, String keyword) {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(*) FROM pengajuan p JOIN users u ON p.user_id = u.id " +
            "LEFT JOIN ruangan r ON p.ruangan_id = r.id WHERE 1=1");
        List<Object> params = new ArrayList<>();

        if (userId != null)               { sql.append(" AND p.user_id = ?");  params.add(userId); }
        if (status != null && !status.isEmpty()) { sql.append(" AND p.status = ?");   params.add(status); }
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (p.no_tiket LIKE ? OR p.keperluan LIKE ? OR r.nama_ruangan LIKE ? OR u.nama LIKE ?)");
            String kw = "%" + keyword + "%";
            params.add(kw); params.add(kw); params.add(kw); params.add(kw);
        }

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    /** Generate nomor tiket unik */
    public String generateNoTiket() {

        String prefix = "TKT-";
        long timestamp = System.currentTimeMillis();
        return prefix + timestamp;
    }

    private Pengajuan mapRow(ResultSet rs) throws Exception {

        Pengajuan p = new Pengajuan();
        p.setId(rs.getInt("id"));
        p.setUserId(rs.getInt("user_id"));

        int ruanganId = rs.getInt("ruangan_id");
        if (!rs.wasNull()) {
            p.setRuanganId(ruanganId);
        }

        p.setNoTiket(rs.getString("no_tiket"));
        p.setJenisPengajuan(rs.getString("jenis_pengajuan"));
        p.setTanggalPengajuan(rs.getTimestamp("tanggal_pengajuan"));
        p.setTanggalPinjam(rs.getDate("tanggal_pinjam"));
        p.setWaktuMulai(rs.getTime("waktu_mulai"));
        p.setWaktuSelesai(rs.getTime("waktu_selesai"));
        p.setKeperluan(rs.getString("keperluan"));
        p.setCatatan(rs.getString("catatan"));
        p.setStatus(rs.getString("status"));

        // Relasi dari JOIN
        try {
            p.setNamaUser(rs.getString("nama_user"));
        } catch (Exception ignored) {
        }
        try {
            p.setNamaRuangan(rs.getString("nama_ruangan"));
        } catch (Exception ignored) {
        }
        try {
            int pembinaId = rs.getInt("pembina_id");
            if (!rs.wasNull()) p.setPembinaId(pembinaId);
        } catch (Exception ignored) {
        }
        try {
            p.setNamaPembina(rs.getString("nama_pembina"));
        } catch (Exception ignored) {
        }

        return p;
    }

    /** Cari pengajuan MENUNGGU_PEMBINA untuk pembina tertentu */
    public List<Pengajuan> searchByPembina(int pembinaId, String keyword, int page, int pageSize) {
        List<Pengajuan> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT p.*, u.nama AS nama_user, r.nama_ruangan, pb.nama AS nama_pembina " +
            "FROM pengajuan p JOIN users u ON p.user_id = u.id " +
            "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
            "LEFT JOIN users pb ON p.pembina_id = pb.id " +
            "WHERE p.pembina_id = ? AND p.status = 'MENUNGGU_PEMBINA'");
        List<Object> params = new ArrayList<>();
        params.add(pembinaId);

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (p.no_tiket LIKE ? OR p.keperluan LIKE ? OR r.nama_ruangan LIKE ? OR u.nama LIKE ?)");
            String kw = "%" + keyword + "%";
            params.add(kw); params.add(kw); params.add(kw); params.add(kw);
        }
        sql.append(" ORDER BY p.tanggal_pengajuan DESC LIMIT ? OFFSET ?");
        params.add(pageSize);
        params.add((page - 1) * pageSize);

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    /** Hitung total untuk searchByPembina */
    public int countByPembina(int pembinaId, String keyword) {
        StringBuilder sql = new StringBuilder(
            "SELECT COUNT(*) FROM pengajuan p JOIN users u ON p.user_id = u.id " +
            "LEFT JOIN ruangan r ON p.ruangan_id = r.id " +
            "WHERE p.pembina_id = ? AND p.status = 'MENUNGGU_PEMBINA'");
        List<Object> params = new ArrayList<>();
        params.add(pembinaId);

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (p.no_tiket LIKE ? OR p.keperluan LIKE ? OR r.nama_ruangan LIKE ? OR u.nama LIKE ?)");
            String kw = "%" + keyword + "%";
            params.add(kw); params.add(kw); params.add(kw); params.add(kw);
        }

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) ps.setObject(i + 1, params.get(i));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}
