package com.advocatediary.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.advocatediary.service.CaseService;
import com.advocatediary.model.UserModel;

@WebServlet("/user/dashboard")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CaseService caseService;

    @Override
    public void init() throws ServletException {
        super.init();
        caseService = new CaseService(); 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserModel user = (UserModel) request.getSession().getAttribute("user");

            if (user != null) {
                int activeCases = caseService.getActiveCasesCount(user.getUsername());
                int pendingHearings = caseService.getPendingHearingsCount(user.getUsername());
                int completedCases = caseService.getCompletedCasesCount(user.getUsername());
                int urgentMatters = caseService.getUrgentMattersCount(user.getUsername());
                System.out.print(activeCases);
                System.out.print(user.getUsername());

                request.setAttribute("activeCases", activeCases);
                request.setAttribute("pendingHearings", pendingHearings);
                request.setAttribute("completedCases", completedCases);
                request.setAttribute("urgentMatters", urgentMatters);

                
                request.getRequestDispatcher("/WEB-INF/pages/user/dashboard.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() +"/login");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred");
        }
    }
}
