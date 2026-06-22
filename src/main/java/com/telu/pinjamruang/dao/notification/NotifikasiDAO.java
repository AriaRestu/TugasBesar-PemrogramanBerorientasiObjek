package com.telu.pinjamruang.dao.notification;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.notification.Notifikasi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NotifikasiDAO extends BaseDAO {

    /** Buat notifikasi baru */
    public int insert(Notifikasi n) {
        String sql = "INSERT INTO notifikasi (user_id, pengajuan_id, pesan, tipe, link) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, n.getUserId());
            if (n.getPengajuanId() != null) {
                ps.setInt(2, n.getPengajuanId());
            } else {
                ps.setNull(2, java.sql.Types.INTEGER);
            }
            ps.setString(3, n.getPesan());
            ps.setString(4, n.getTipe());
            ps.setString(5, n.getLink());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    /** Ambil notifikasi milik user, terbaru duluan */
    public List<Notifikasi> findByUserId(int userId) {
        List<Notifikasi> list = new ArrayList<>();
        String sql = "SELECT * FROM notifikasi WHERE user_id = ? ORDER BY tanggal DESC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    /** Ambil notifikasi yang belum dibaca */
    public List<Notifikasi> findUnreadByUserId(int userId) {
        List<Notifikasi> list = new ArrayList<>();
        String sql = "SELECT * FROM notifikasi WHERE user_id = ? AND dibaca = FALSE ORDER BY tanggal DESC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    /** Hitung jumlah notifikasi belum dibaca */
    public int countUnread(int userId) {
        String sql = "SELECT COUNT(*) FROM notifikasi WHERE user_id = ? AND dibaca = FALSE";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    /** Tandai satu notifikasi sebagai dibaca */
    public boolean markAsRead(int id) {
        String sql = "UPDATE notifikasi SET dibaca = TRUE WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    /** Tandai semua notifikasi user sebagai dibaca */
    public boolean markAllAsRead(int userId) {
        String sql = "UPDATE notifikasi SET dibaca = TRUE WHERE user_id = ? AND dibaca = FALSE";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            return ps.executeUpdate() >= 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    private Notifikasi mapRow(ResultSet rs) throws Exception {
        Notifikasi n = new Notifikasi();
        n.setId(rs.getInt("id"));
        n.setUserId(rs.getInt("user_id"));
        int pengajuanId = rs.getInt("pengajuan_id");
        if (!rs.wasNull()) n.setPengajuanId(pengajuanId);
        n.setPesan(rs.getString("pesan"));
        n.setTanggal(rs.getTimestamp("tanggal"));
        n.setDibaca(rs.getBoolean("dibaca"));
        n.setTipe(rs.getString("tipe"));
        n.setLink(rs.getString("link"));
        return n;
    }
}
