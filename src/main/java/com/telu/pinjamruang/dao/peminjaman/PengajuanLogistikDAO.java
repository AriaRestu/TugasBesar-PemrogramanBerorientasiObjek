package com.telu.pinjamruang.dao.peminjaman;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.peminjaman.PengajuanLogistik;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PengajuanLogistikDAO extends BaseDAO {

    public int insert(PengajuanLogistik pl) {
        String sql = "INSERT INTO pengajuan_logistik (pengajuan_id, logistik_id, jumlah, keterangan) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, pl.getPengajuanId());
            ps.setInt(2, pl.getLogistikId());
            ps.setInt(3, pl.getJumlah());
            ps.setString(4, pl.getKeterangan());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public List<PengajuanLogistik> findByPengajuanId(int pengajuanId) {
        List<PengajuanLogistik> list = new ArrayList<>();
        String sql = "SELECT pl.*, l.nama_logistik, l.satuan FROM pengajuan_logistik pl JOIN logistik l ON pl.logistik_id = l.id WHERE pl.pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pengajuanId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapRow(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public boolean deleteByPengajuanId(int pengajuanId) {
        String sql = "DELETE FROM pengajuan_logistik WHERE pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pengajuanId);
            return ps.executeUpdate() >= 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    private PengajuanLogistik mapRow(ResultSet rs) throws Exception {
        PengajuanLogistik pl = new PengajuanLogistik();
        pl.setId(rs.getInt("id"));
        pl.setPengajuanId(rs.getInt("pengajuan_id"));
        pl.setLogistikId(rs.getInt("logistik_id"));
        pl.setJumlah(rs.getInt("jumlah"));
        pl.setKeterangan(rs.getString("keterangan"));
        try { pl.setNamaLogistik(rs.getString("nama_logistik")); } catch (Exception ignored) {}
        try { pl.setSatuan(rs.getString("satuan")); } catch (Exception ignored) {}
        return pl;
    }
}
