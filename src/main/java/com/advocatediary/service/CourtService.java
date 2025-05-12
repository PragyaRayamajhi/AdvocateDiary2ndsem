package com.advocatediary.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.advocatediary.model.CourtModel;
import com.advocatediary.config.DatabaseConnection;
import com.advocatediary.controller.admin.Court;

public class CourtService {

	public boolean addCourt(CourtModel court) throws Exception {
		String sql = "INSERT INTO court (name, location) VALUES (?, ?)";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, court.getName());
			stmt.setString(2, court.getLocation());

			int rows = stmt.executeUpdate();
			return rows > 0;
		}
	}

	 public List<CourtModel> getAllCourts() throws Exception {
	        List<CourtModel> courts = new ArrayList<>();
	        String sql = "SELECT * FROM court";
	        try (Connection conn = DatabaseConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(sql)) {

	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                CourtModel court = new CourtModel();
	                court.setId(rs.getInt("court_id"));  // Assuming column name is 'court_id'
	                court.setName(rs.getString("name"));
	                court.setLocation(rs.getString("location"));
	                courts.add(court);
	            }
	        }

	        return courts;
	    }

	public List<CourtModel> getCourts(String searchQuery) throws Exception {
		List<CourtModel> courts = new ArrayList<>();
		String sql = "SELECT * FROM court";
		if (searchQuery != null && !searchQuery.trim().isEmpty()) {
			sql += " WHERE name LIKE ? OR location LIKE ?";
		}

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			if (searchQuery != null && !searchQuery.trim().isEmpty()) {
				String likeQuery = "%" + searchQuery + "%";
				stmt.setString(1, likeQuery);
				stmt.setString(2, likeQuery);
			}

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				CourtModel court = new CourtModel();
				court.setId(rs.getInt("court_id")); // corrected column name
				court.setName(rs.getString("name"));
				court.setLocation(rs.getString("location"));
				courts.add(court);
			}
		}

		return courts;
	}

	public boolean updateCourt(CourtModel court) throws Exception {
		String sql = "UPDATE court SET name = ?, location = ? WHERE court_id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, court.getName());
			stmt.setString(2, court.getLocation());
			stmt.setInt(3, court.getId());
			return stmt.executeUpdate() > 0;
		}
	}

	public boolean deleteCourt(int courtId) throws Exception {
		String sql = "DELETE FROM court WHERE court_id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, courtId);
			return stmt.executeUpdate() > 0;
		}
	}

	public CourtModel getCourtById(int courtId) throws Exception {
		String sql = "SELECT * FROM court WHERE court_id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setInt(1, courtId);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return new CourtModel(rs.getInt("court_id"), // corrected
						rs.getString("name"), rs.getString("location"));
			}
			return null;
		}
	}
}
