package com.advocatediary.controller.admin;

import com.advocatediary.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/delete-attorney")
public class DeleteAttorney extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        try {
            int userId = Integer.parseInt(idParam);

            boolean deleted = userService.deleteUser(userId);

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/admin/attorney?success=deleted");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/attorney?error=notfound");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/attorney?error=exception");
        }
    }
}
