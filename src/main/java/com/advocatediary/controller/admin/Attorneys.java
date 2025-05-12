package com.advocatediary.controller.admin;

import com.advocatediary.model.UserModel;
import com.advocatediary.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/attorney")
public class Attorneys extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService(); // Initialize service in init()
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query"); // Get search query
        List<UserModel> userList = null;

        try {
            if (query != null && !query.trim().isEmpty()) {
                userList = userService.getUsers(query); // Search users
            } else {
                userList = userService.getAllUsers(); // Get all if no search
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch users.");
        }

        request.setAttribute("users", userList);
        request.setAttribute("searchQuery", query); // Optional: so search box keeps its value
        request.getRequestDispatcher("/WEB-INF/pages/admin/attorney.jsp").forward(request, response);
    }
}
