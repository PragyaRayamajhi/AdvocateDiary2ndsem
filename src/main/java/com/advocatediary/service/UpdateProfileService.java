package com.advocatediary.service;

import com.advocatediary.model.UserModel;
import com.advocatediary.config.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateProfileService {

      public boolean updateProfile(UserModel user) {
        boolean isUpdated = false;

         String sql = "UPDATE user SET  name = ?, email = ?, address = ?, phone = ? WHERE username = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {


            
            preparedStatement.setString(1, user.getName()); 
            preparedStatement.setString(2, user.getEmail()); 
            preparedStatement.setString(3, user.getAddress()); 
            preparedStatement.setString(4, user.getPhone());
            preparedStatement.setString(5, user.getUsername()); 
            int rowsUpdated = preparedStatement.executeUpdate();
            isUpdated = rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            isUpdated =false;
        }catch (Exception e) {
            e.printStackTrace();
            isUpdated =false;
        }

        return isUpdated;
    }
}
