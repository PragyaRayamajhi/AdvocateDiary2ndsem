package com.advocatediary.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.advocatediary.service.CaseService;


@WebServlet("/admin/dashboard")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	 private CaseService caseService;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        caseService = new CaseService(); 
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        try {
	            // Retrieve necessary data from CaseService
	            int activeCases = caseService.getActiveCasesCount();
	            int pendingHearings = caseService.getPendingHearingsCount();
	            int completedCases = caseService.getCompletedCasesCount();
	            int urgentMatters = caseService.getUrgentMattersCount();

	            // Set the retrieved data as request attributes to make it accessible in the JSP
	            request.setAttribute("activeCases", activeCases);
	            request.setAttribute("pendingHearings", pendingHearings);
	            request.setAttribute("completedCases", completedCases);
	            request.setAttribute("urgentMatters", urgentMatters);

	            
	            request.getRequestDispatcher("/WEB-INF/pages/admin/dashboard.jsp").forward(request, response);

	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred");
	        }
	    }

	
}
