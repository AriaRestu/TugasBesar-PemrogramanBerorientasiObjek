package com.telu.pinjamruang.dao.approval;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.approval.Approval;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ApprovalDAO extends BaseDAO {

    public int insert(Approval a) {
        String sql = "INSERT INTO approval (pengajuan_id, approver_id, role_approver, status, catatan) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, a.getPengajuanId());
            ps.setInt(2, a.getApproverId());
            ps.setString(3, a.getRoleApprover());
            ps.setString(4, a.getStatus());
            ps.setString(5, a.getCatatan());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public Approval findById(int id) {
        String sql = "SELECT a.*, u.nama AS nama_approver FROM approval a JOIN users u ON a.approver_id = u.id WHERE a.id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public List<Approval> findByPengajuanId(int pengajuanId) {
        List<Approval> list = new ArrayList<>();
        String sql = "SELECT a.*, u.nama AS nama_approver FROM approval a JOIN users u ON a.approver_id = u.id WHERE a.pengajuan_id = ? ORDER BY a.tanggal_approval";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pengajuanId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    /** Ambil pengajuan yang menunggu approval dari role tertentu */
    public List<Approval> findPendingByRole(String roleApprover) {
        List<Approval> list = new ArrayList<>();
        String sql = "SELECT a.*, u.nama AS nama_approver, p.no_tiket FROM approval a JOIN users u ON a.approver_id = u.id JOIN pengajuan p ON a.pengajuan_id = p.id WHERE a.role_approver = ? AND a.status = 'MENUNGGU' ORDER BY a.tanggal_approval DESC";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roleApprover);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Approval a = mapRow(rs);
                try { a.setNoTiket(rs.getString("no_tiket")); } catch (Exception ignored) {}
                list.add(a);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    /** Update status approval */
    public boolean updateStatus(int id, String status, String catatan) {
        String sql = "UPDATE approval SET status = ?, catatan = ?, tanggal_approval = CURRENT_TIMESTAMP WHERE id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, catatan);
            ps.setInt(3, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    private Approval mapRow(ResultSet rs) throws Exception {
        Approval a = new Approval();
        a.setId(rs.getInt("id"));
        a.setPengajuanId(rs.getInt("pengajuan_id"));
        a.setApproverId(rs.getInt("approver_id"));
        a.setRoleApprover(rs.getString("role_approver"));
        a.setStatus(rs.getString("status"));
        a.setCatatan(rs.getString("catatan"));
        a.setTanggalApproval(rs.getTimestamp("tanggal_approval"));
        try { a.setNamaApprover(rs.getString("nama_approver")); } catch (Exception ignored) {}
        return a;
    }
}
