package com.advocatediary.controller.admin;

import com.advocatediary.service.CourtService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/delete-court")
public class DeleteCourt extends HttpServlet {

    private CourtService courtService;

    @Override
    public void init() throws ServletException {
        courtService = new CourtService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        try {
            int courtId = Integer.parseInt(idParam);

            boolean deleted = courtService.deleteCourt(courtId);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/admin/court?success=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/court?error=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/court?error=exception");
        }
    }
}
