package com.advocatediary.controller.user;

import com.advocatediary.model.CaseModel;
import com.advocatediary.model.UserModel;
import com.advocatediary.service.CaseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/case")
public class CaseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CaseService caseService;

    @Override
    public void init() throws ServletException {
        caseService = new CaseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/advocatediary/login");
            return;
        }

        String query = request.getParameter("query");

        try {
            System.out.println("Username: " + user.getUsername());  // This will now log the username
            List<CaseModel> caseList = caseService.getCasesByUsername(query, user.getUsername());
            request.setAttribute("caseList", caseList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch user cases.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/user/case.jsp").forward(request, response);
    }
}
