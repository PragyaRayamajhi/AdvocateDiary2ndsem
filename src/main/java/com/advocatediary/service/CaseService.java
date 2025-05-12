package com.advocatediary.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.advocatediary.model.CaseModel;
import com.advocatediary.config.DatabaseConnection;

public class CaseService {

	// Add a new case
	public boolean addCase(CaseModel caseModel) throws Exception {
		String sql = "INSERT INTO `case` (title, client_name, case_type, status, last_hearing, next_hearing, description, user_id, court_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, caseModel.getTitle());
			stmt.setString(2, caseModel.getClientName());
			stmt.setString(3, caseModel.getCaseType());
			stmt.setString(4, caseModel.getStatus());
			stmt.setDate(5, caseModel.getLastHearing());
			stmt.setDate(6, caseModel.getNextHearing());
			stmt.setString(7, caseModel.getDescription());
			stmt.setInt(8, caseModel.getUserId());
			stmt.setInt(9, caseModel.getCourtId());

			int rows = stmt.executeUpdate();
			return rows > 0;
		}
	}

	public List<CaseModel> getCases(String searchQuery) throws Exception {
		List<CaseModel> cases = new ArrayList<>();
		String sql = "SELECT * FROM `case`";
		boolean hasSearch = (searchQuery != null && !searchQuery.trim().isEmpty());

		if (hasSearch) {
			sql += " WHERE title LIKE ? OR client_name LIKE ? OR case_type LIKE ?";
		}

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			if (hasSearch) {
				String likeQuery = "%" + searchQuery + "%";
				stmt.setString(1, likeQuery);
				stmt.setString(2, likeQuery);
				stmt.setString(3, likeQuery);
			}

			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				CaseModel caseModel = new CaseModel();
				caseModel.setId(rs.getInt("case_id"));
				caseModel.setTitle(rs.getString("title"));
				caseModel.setClientName(rs.getString("client_name"));
				caseModel.setCaseType(rs.getString("case_type"));
				caseModel.setStatus(rs.getString("status"));
				caseModel.setLastHearing(rs.getDate("last_hearing"));
				caseModel.setNextHearing(rs.getDate("next_hearing"));
				caseModel.setDescription(rs.getString("description"));
				caseModel.setUserId(rs.getInt("user_id"));
				caseModel.setCourtId(rs.getInt("court_id"));
				cases.add(caseModel);
			}
		}

		return cases;
	}

	public boolean updateCase(CaseModel caseModel) throws Exception {
		String sql = "UPDATE `case` SET title=?, client_name=?, case_type=?, status=?, last_hearing=?, next_hearing=?, description=?, user_id=?, court_id=? WHERE case_id=?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, caseModel.getTitle());
			stmt.setString(2, caseModel.getClientName());
			stmt.setString(3, caseModel.getCaseType());
			stmt.setString(4, caseModel.getStatus());
			stmt.setDate(5, caseModel.getLastHearing());
			stmt.setDate(6, caseModel.getNextHearing());
			stmt.setString(7, caseModel.getDescription());
			stmt.setInt(8, caseModel.getUserId());
			stmt.setInt(9, caseModel.getCourtId());
			stmt.setInt(10, caseModel.getId());

			return stmt.executeUpdate() > 0;
		}
	}

	public boolean deleteCase(int caseId) throws Exception {
		String sql = "DELETE FROM `case` WHERE case_id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, caseId);
			return stmt.executeUpdate() > 0;
		}
	}

	public CaseModel getCaseById(int caseId) throws Exception {
		String sql = "SELECT * FROM `case` WHERE case_id = ?";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, caseId);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				CaseModel caseModel = new CaseModel();
				caseModel.setId(rs.getInt("case_id"));
				caseModel.setTitle(rs.getString("title"));
				caseModel.setClientName(rs.getString("client_name"));
				caseModel.setCaseType(rs.getString("case_type"));
				caseModel.setStatus(rs.getString("status"));
				caseModel.setLastHearing(rs.getDate("last_hearing"));
				caseModel.setNextHearing(rs.getDate("next_hearing"));
				caseModel.setDescription(rs.getString("description"));
				caseModel.setUserId(rs.getInt("user_id"));
				caseModel.setCourtId(rs.getInt("court_id"));
				return caseModel;
			}
			return null;
		}
	}

	public int getActiveCasesCount() throws Exception {
		String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Active'";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getPendingHearingsCount() throws Exception {
		String sql = "SELECT COUNT(*) FROM `case` WHERE status='Pending'";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getCompletedCasesCount() throws Exception {
		String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Complete'";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getUrgentMattersCount() throws Exception {
		String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Urgent'";
		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}

	public int getActiveCasesCount(String username) throws Exception {
	    String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Active' AND user_id = (SELECT user_id FROM user WHERE username = ?)";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	    }
	    return 0;
	}

	public int getPendingHearingsCount(String username) throws Exception {
	    String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Pending' AND user_id = (SELECT user_id FROM user WHERE username = ?)";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	    }
	    return 0;
	}

	public int getCompletedCasesCount(String username) throws Exception {
	    String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Complete' AND user_id = (SELECT user_id FROM user WHERE username = ?)";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	    }
	    return 0;
	}

	public int getUrgentMattersCount(String username) throws Exception {
	    String sql = "SELECT COUNT(*) FROM `case` WHERE status = 'Urgent' AND user_id = (SELECT user_id FROM user WHERE username = ?)";
	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	    }
	    return 0;
	}

	public List<CaseModel> getCasesByUsername(String query, String username) throws Exception {
	    List<CaseModel> caseList = new ArrayList<>();

	    String sql = "SELECT * FROM `case` WHERE user_id = (SELECT user_id FROM user WHERE username = ?)";

	    if (query != null && !query.trim().isEmpty()) {
	        sql += " AND (title LIKE ? OR description LIKE ? OR status LIKE ?)";
	    }

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, username);
	        if (query != null && !query.trim().isEmpty()) {
	            String q = "%" + query.trim() + "%";
	            stmt.setString(2, q);
	            stmt.setString(3, q);
	            stmt.setString(4, q);
	        }

	        ResultSet rs = stmt.executeQuery();
	        while (rs.next()) {
	            CaseModel c = new CaseModel();
	            c.setId(rs.getInt("case_id")); 
	            c.setTitle(rs.getString("title"));
	            c.setClientName(rs.getString("client_name"));
	            c.setCaseType(rs.getString("case_type"));
	            c.setDescription(rs.getString("description"));
	            c.setCourtId(rs.getInt("court_id"));
	            c.setUserId(rs.getInt("user_id"));
	            c.setStatus(rs.getString("status"));
	            c.setLastHearing(rs.getDate("last_hearing"));
	            c.setNextHearing(rs.getDate("next_hearing"));
	            
	            caseList.add(c);
	        }
	    }

	    return caseList;
	}


	

}