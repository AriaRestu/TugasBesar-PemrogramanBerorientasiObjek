package com.telu.pinjamruang.dao.dokumen;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.dokumen.F01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class F01DAO extends BaseDAO {

    public int insert(F01 f) {
        String sql = "INSERT INTO f01 (pengajuan_id, nama_ormawa, nama_ketua_pelaksana, nim, program_studi, no_handphone, nama_kegiatan, tanggal_kegiatan, tempat_kegiatan, waktu_mulai, waktu_selesai, total_peserta, catatan, file_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, f.getPengajuanId());
            ps.setString(2, f.getNamaOrmawa());
            ps.setString(3, f.getNamaKetuaPelaksana());
            ps.setString(4, f.getNim());
            ps.setString(5, f.getProgramStudi());
            ps.setString(6, f.getNoHandphone());
            ps.setString(7, f.getNamaKegiatan());
            ps.setDate(8, f.getTanggalKegiatan());
            ps.setString(9, f.getTempatKegiatan());
            ps.setTime(10, f.getWaktuMulai());
            ps.setTime(11, f.getWaktuSelesai());
            ps.setInt(12, f.getTotalPeserta());
            ps.setString(13, f.getCatatan());
            ps.setString(14, f.getFilePath());
            ps.executeUpdate();
            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public F01 findByPengajuanId(int pengajuanId) {
        String sql = "SELECT * FROM f01 WHERE pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pengajuanId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public boolean update(F01 f) {
        String sql = "UPDATE f01 SET nama_ormawa = ?, nama_ketua_pelaksana = ?, nim = ?, program_studi = ?, no_handphone = ?, nama_kegiatan = ?, tanggal_kegiatan = ?, tempat_kegiatan = ?, waktu_mulai = ?, waktu_selesai = ?, total_peserta = ?, catatan = ?, file_path = ? WHERE pengajuan_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, f.getNamaOrmawa());
            ps.setString(2, f.getNamaKetuaPelaksana());
            ps.setString(3, f.getNim());
            ps.setString(4, f.getProgramStudi());
            ps.setString(5, f.getNoHandphone());
            ps.setString(6, f.getNamaKegiatan());
            ps.setDate(7, f.getTanggalKegiatan());
            ps.setString(8, f.getTempatKegiatan());
            ps.setTime(9, f.getWaktuMulai());
            ps.setTime(10, f.getWaktuSelesai());
            ps.setInt(11, f.getTotalPeserta());
            ps.setString(12, f.getCatatan());
            ps.setString(13, f.getFilePath());
            ps.setInt(14, f.getPengajuanId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    private F01 mapRow(ResultSet rs) throws Exception {
        F01 f = new F01();
        f.setId(rs.getInt("id"));
        f.setPengajuanId(rs.getInt("pengajuan_id"));
        f.setNamaOrmawa(rs.getString("nama_ormawa"));
        f.setNamaKetuaPelaksana(rs.getString("nama_ketua_pelaksana"));
        f.setNim(rs.getString("nim"));
        f.setProgramStudi(rs.getString("program_studi"));
        f.setNoHandphone(rs.getString("no_handphone"));
        f.setNamaKegiatan(rs.getString("nama_kegiatan"));
        f.setTanggalKegiatan(rs.getDate("tanggal_kegiatan"));
        f.setTempatKegiatan(rs.getString("tempat_kegiatan"));
        f.setWaktuMulai(rs.getTime("waktu_mulai"));
        f.setWaktuSelesai(rs.getTime("waktu_selesai"));
        f.setTotalPeserta(rs.getInt("total_peserta"));
        f.setCatatan(rs.getString("catatan"));
        f.setFilePath(rs.getString("file_path"));
        f.setCreatedAt(rs.getTimestamp("created_at"));
        return f;
    }
}
