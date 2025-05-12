package com.advocatediary.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.advocatediary.model.CourtModel;
import com.advocatediary.service.CourtService;

@WebServlet("/admin/add-court")
public class AddCourt extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CourtService courtService;

    @Override
    public void init() throws ServletException {
        courtService = new CourtService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/admin/add-court.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name").trim();
        String location = request.getParameter("location").trim();

        if (name.isEmpty() || location.isEmpty()) {
            request.setAttribute("error", "Court name and location are required.");
            request.getRequestDispatcher("/WEB-INF/pages/admin/add-court.jsp").forward(request, response);
            return;
        }

        CourtModel court = new CourtModel(name, location);

        try {
            boolean success = courtService.addCourt(court);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/court");
            } else {
                request.setAttribute("error", "Failed to add court.");
                request.getRequestDispatcher("/WEB-INF/pages/admin/add-court.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An internal error occurred.");
            request.getRequestDispatcher("/WEB-INF/pages/admin/add-court.jsp").forward(request, response);
        }
    }
}
