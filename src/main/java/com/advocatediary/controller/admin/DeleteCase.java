package com.advocatediary.controller.admin;

import com.advocatediary.service.CaseService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/delete-case")
public class DeleteCase extends HttpServlet {

    private CaseService caseService = new CaseService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int caseId = Integer.parseInt(request.getParameter("id"));
        try {
            boolean success = caseService.deleteCase(caseId);
            if (success) {
                response.sendRedirect("case?success=Case deleted");
            } else {
                response.sendRedirect("case?error=Delete failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("case?error=Error occurred");
        }
    }
}
