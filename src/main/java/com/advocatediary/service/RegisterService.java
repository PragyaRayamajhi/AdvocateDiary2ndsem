package com.advocatediary.service;

import com.advocatediary.model.UserModel;
import com.advocatediary.config.DatabaseConnection;
import com.advocatediary.util.PasswordUtil;

import java.sql.*;

public class RegisterService {

    public boolean isDuplicate(UserModel user) {
        String sql = "SELECT COUNT(*) FROM user WHERE email = ? OR phone = ? OR username = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getUsername());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to register a new user
    public boolean registerUser(UserModel user) {
        if (isDuplicate(user)) {
            return false;
        }

        
        String hashedPassword = PasswordUtil.encrypt(user.getPassword());

        String sql = "INSERT INTO user (name, email, address, password, isAdmin, username, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getAddress());
            ps.setString(4, hashedPassword); 
            ps.setInt(5, user.isAdmin());
            ps.setString(6, user.getUsername());
            ps.setString(7, user.getPhone());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0; 

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false; // Return false if an error occurs or insertion fails
    }
}
