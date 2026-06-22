package com.telu.pinjamruang.dao.dokumen;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.dokumen.F02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class F02DAO extends BaseDAO {

    public int insert(F02 f) {
        String sql = "INSERT INTO f02 (pengajuan_id, catatan, file_path) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, f.getPengajuanId());
            ps.setString(2, f.getCatatan());
            ps.setString(3, f.getFilePath());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public F02 findByPengajuanId(int pengajuanId) {
        String sql = "SELECT * FROM f02 WHERE pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pengajuanId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public boolean update(F02 f) {
        String sql = "UPDATE f02 SET catatan = ?, file_path = ? WHERE pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, f.getCatatan());
            ps.setString(2, f.getFilePath());
            ps.setInt(3, f.getPengajuanId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    private F02 mapRow(ResultSet rs) throws Exception {
        F02 f = new F02();
        f.setId(rs.getInt("id"));
        f.setPengajuanId(rs.getInt("pengajuan_id"));
        f.setCatatan(rs.getString("catatan"));
        f.setFilePath(rs.getString("file_path"));
        f.setCreatedAt(rs.getTimestamp("created_at"));
        return f;
    }
}
