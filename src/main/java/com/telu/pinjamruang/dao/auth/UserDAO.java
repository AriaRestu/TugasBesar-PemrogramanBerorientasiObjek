package com.telu.pinjamruang.dao.auth;

import com.telu.pinjamruang.model.auth.User;
import com.telu.pinjamruang.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public User login(
            String email,
            String password) {

        String hashedPassword = com.telu.pinjamruang.util.HashUtil.hashPassword(password);

        String sql =
                "SELECT * FROM users " +
                "WHERE email = ? " +
                "AND password = ?";

        try (
                Connection conn =
                        DBConnection.getConnection();

                PreparedStatement ps =
                        conn.prepareStatement(sql)
        ) {

            ps.setString(1, email);
            ps.setString(2, hashedPassword);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setId(
                        rs.getInt("id"));

                user.setNama(
                        rs.getString("nama"));

                user.setEmail(
                        rs.getString("email"));

                user.setPassword(
                        rs.getString("password"));

                user.setNoTelp(
                        rs.getString("no_telp"));

                user.setRole(
                        rs.getString("role"));

                return user;
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }
}