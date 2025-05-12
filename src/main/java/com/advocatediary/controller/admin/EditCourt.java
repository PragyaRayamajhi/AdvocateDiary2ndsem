package com.advocatediary.controller.admin;

import com.advocatediary.model.CourtModel;
import com.advocatediary.service.CourtService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/edit-court")
public class EditCourt extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourtService courtService;

    @Override
    public void init() throws ServletException {
        courtService = new CourtService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int courtId = Integer.parseInt(request.getParameter("id"));

        try {
            CourtModel court = courtService.getCourtById(courtId);
            request.setAttribute("court", court);
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-court.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/court?error=error");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int courtId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name").trim();
        String location = request.getParameter("location").trim();

        if (name.isEmpty() || location.isEmpty()) {
            request.setAttribute("error", "Court name and location are required.");
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-court.jsp").forward(request, response);
            return;
        }

        CourtModel court = new CourtModel(courtId, name, location);

        try {
            boolean success = courtService.updateCourt(court);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/court");
            } else {
                request.setAttribute("error", "Failed to update court.");
                request.getRequestDispatcher("/WEB-INF/pages/admin/edit-court.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An internal error occurred.");
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-court.jsp").forward(request, response);
        }
    }
}
