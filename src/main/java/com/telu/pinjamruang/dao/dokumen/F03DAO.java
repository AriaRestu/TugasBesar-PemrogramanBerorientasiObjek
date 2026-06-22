package com.telu.pinjamruang.dao.dokumen;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.dokumen.F03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class F03DAO extends BaseDAO {

    public int insert(F03 f) {
        String sql = "INSERT INTO f03 (pengajuan_id, no_tiket, diterbitkan_oleh, file_pdf) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, f.getPengajuanId());
            ps.setString(2, f.getNoTiket());
            if (f.getDiterbitkanOleh() != null) {
                ps.setInt(3, f.getDiterbitkanOleh());
            } else {
                ps.setNull(3, java.sql.Types.INTEGER);
            }
            ps.setString(4, f.getFilePdf());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public F03 findByPengajuanId(int pengajuanId) {
        String sql = "SELECT f.*, u.nama AS nama_penerbit FROM f03 f LEFT JOIN users u ON f.diterbitkan_oleh = u.id WHERE f.pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pengajuanId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public F03 findById(int id) {
        String sql = "SELECT f.*, u.nama AS nama_penerbit FROM f03 f LEFT JOIN users u ON f.diterbitkan_oleh = u.id WHERE f.id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    private F03 mapRow(ResultSet rs) throws Exception {
        F03 f = new F03();
        f.setId(rs.getInt("id"));
        f.setPengajuanId(rs.getInt("pengajuan_id"));
        f.setNoTiket(rs.getString("no_tiket"));
        f.setTanggalTerbit(rs.getTimestamp("tanggal_terbit"));
        int diterbitkan = rs.getInt("diterbitkan_oleh");
        if (!rs.wasNull()) f.setDiterbitkanOleh(diterbitkan);
        f.setFilePdf(rs.getString("file_pdf"));
        f.setCreatedAt(rs.getTimestamp("created_at"));
        try { f.setNamaPenerbit(rs.getString("nama_penerbit")); } catch (Exception ignored) {}
        return f;
    }
}
