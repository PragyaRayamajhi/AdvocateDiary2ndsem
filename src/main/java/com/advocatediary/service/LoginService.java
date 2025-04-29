package com.advocatediary.service;


import com.advocatediary.model.UserModel;
import com.advocatediary.config.DatabaseConnection;
import com.advocatediary.util.PasswordUtil;

import java.sql.*;

public class LoginService {

    // Method to authenticate the user
    public UserModel authenticate(String username, String password) {
        UserModel user = null;

        try (Connection con = DatabaseConnection.initializeDatabase()) {
            // Query the database for the user by username
            String sql = "SELECT * FROM user WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("password");  // Fetch the stored password hash

                // Encrypt the entered password and compare it with the stored hashed password
                String enteredHashedPassword = PasswordUtil.encrypt(password); // Encrypt the entered password

                // Compare the stored hash and entered hash
                if (storedHashedPassword.equals(enteredHashedPassword)) {
                    // If passwords match, set the user details
                    user = new UserModel();
                    user.setUsername(rs.getString("username"));
                    user.setAdmin(rs.getInt("isAdmin"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setAddress(rs.getString("address"));
                    user.setPhone(rs.getString("phone"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user; // Return the user if authentication is successful, else null
    }
}
