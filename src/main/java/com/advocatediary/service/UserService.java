package com.advocatediary.service;

import com.advocatediary.config.DatabaseConnection;
import com.advocatediary.model.UserModel;
import com.advocatediary.util.PasswordUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserService {

	public List<UserModel> getAllUsers() throws Exception {
		List<UserModel> users = new ArrayList<>();
		String sql = "SELECT * FROM user WHERE isAdmin = 0";

		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql);
			 ResultSet resultSet = statement.executeQuery()) {

			while (resultSet.next()) {
				UserModel user = new UserModel();
				user.setId(resultSet.getInt("user_id"));
				user.setName(resultSet.getString("name"));
				user.setPhone(resultSet.getString("phone"));
				user.setUsername(resultSet.getString("username"));
				user.setEmail(resultSet.getString("email"));
				user.setAdmin(resultSet.getInt("isAdmin"));
				user.setAddress(resultSet.getString("address"));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	public List<UserModel> getUsers(String searchQuery) throws Exception {
		List<UserModel> users = new ArrayList<>();
		String sql = "SELECT * FROM user WHERE isAdmin = 0";

		boolean hasKeyword = searchQuery != null && !searchQuery.trim().isEmpty();
		if (hasKeyword) {
			sql += " AND (name LIKE ? OR username LIKE ? OR email LIKE ?)";
		}

		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql)) {

			if (hasKeyword) {
				String keyword = "%" + searchQuery.trim() + "%";
				statement.setString(1, keyword);
				statement.setString(2, keyword);
				statement.setString(3, keyword);
			}

			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				UserModel user = new UserModel();
				user.setId(resultSet.getInt("user_id"));
				user.setName(resultSet.getString("name"));
				user.setPhone(resultSet.getString("phone"));
				user.setUsername(resultSet.getString("username"));
				user.setEmail(resultSet.getString("email"));
				user.setAdmin(resultSet.getInt("isAdmin"));
				user.setAddress(resultSet.getString("address"));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	public static UserModel getUserById(int userId) throws Exception {
		String sql = "SELECT * FROM user WHERE user_id = ?";
		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setInt(1, userId);
			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				UserModel user = new UserModel();
				user.setId(resultSet.getInt("user_id"));
				user.setUsername(resultSet.getString("username"));
				user.setEmail(resultSet.getString("email"));
				user.setAdmin(resultSet.getInt("isAdmin"));
				user.setName(resultSet.getString("name"));
				user.setPhone(resultSet.getString("phone"));
				user.setAddress(resultSet.getString("address"));
				return user;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static boolean addUser(UserModel user) throws Exception {
		String sql = "INSERT INTO user (name, email, phone, address, username, password) VALUES (?, ?, ?, ?, ?, ?)";
		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql)) {

			String hashedPassword = PasswordUtil.encrypt(user.getPassword());

			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPhone());
			statement.setString(4, user.getAddress());
			statement.setString(5, user.getUsername());
			statement.setString(6, hashedPassword);

			return statement.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateUser(UserModel user) throws Exception {
		String sql = "UPDATE user SET name=?, username=?, email=?, phone=?, address=? WHERE user_id=?";

		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setString(1, user.getName());
			statement.setString(2, user.getUsername());
			statement.setString(3, user.getEmail());
			statement.setString(4, user.getPhone());
			statement.setString(5, user.getAddress());
			statement.setInt(6, user.getId());

			return statement.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean deleteUser(int userId) throws Exception {
		String sql = "DELETE FROM user WHERE user_id = ?";
		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql)) {

			statement.setInt(1, userId);
			return statement.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// ✅ Check if email or username already exists
	public boolean isEmailOrUsernameExists(String email, String username) throws Exception {
		String sql = "SELECT COUNT(*) FROM user WHERE email = ? OR username = ?";
		try (Connection connection = DatabaseConnection.getConnection();
			 PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, email);
			statement.setString(2, username);
			ResultSet rs = statement.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
