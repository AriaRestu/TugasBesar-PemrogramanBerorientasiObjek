package com.telu.pinjamruang.dao.auth;

import com.telu.pinjamruang.common.BaseDAO;
import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.HashUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends BaseDAO {

    /** Login: cari user berdasarkan email & password (hashed) */
    public User login(String email, String password) {

        String hashedPassword = HashUtil.hashPassword(password);

        String sql =
                "SELECT * FROM users " +
                "WHERE email = ? " +
                "AND password = ?";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, email);
            ps.setString(2, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /** Cari user berdasarkan ID (untuk restore session dari cookie) */
    public User findById(int id) {

        String sql =
                "SELECT * FROM users WHERE id = ?";

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

    /** Cari user berdasarkan email */
    public User findByEmail(String email) {

        String sql =
                "SELECT * FROM users WHERE email = ?";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    /** Ambil semua user */
    public List<User> findAll() {

        List<User> list = new ArrayList<>();

        String sql =
                "SELECT * FROM users ORDER BY nama";

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

    /** Ambil semua user berdasarkan role */
    public List<User> findByRole(String role) {

        List<User> list = new ArrayList<>();

        String sql =
                "SELECT * FROM users WHERE role = ? ORDER BY nama";

        try (
                Connection conn = getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {
            ps.setString(1, role);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    private User mapRow(ResultSet rs) throws Exception {

        User user = new User();
        user.setId(rs.getInt("id"));
        user.setNama(rs.getString("nama"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setNoTelp(rs.getString("no_telp"));
        user.setRole(rs.getString("role"));
        return user;
    }
}