package com.advocatediary.controller.admin;

import com.advocatediary.model.UserModel;
import com.advocatediary.service.UserService;
import com.advocatediary.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/add-attorney")
public class AddAttorney extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/admin/add-attorney.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = "user@123";

        UserModel user = new UserModel();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setUsername(username);
        user.setPassword(password);

        try {
            if (!ValidationUtil.isValidName(name)) {
                request.setAttribute("error", "Name must contain only letters and up to three words.");
            } else if (!ValidationUtil.isValidEmail(email)) {
                request.setAttribute("error", "Email must be a valid Gmail address.");
            } else if (!ValidationUtil.isValidPhoneNumber(phone)) {
                request.setAttribute("error", "Phone number must start with 97 or 98 and be 10 digits long.");
            } else if (!ValidationUtil.isValidUsername(username)) {
                request.setAttribute("error", "Username must be alphanumeric and up to 15 characters.");
            } else if (userService.isEmailOrUsernameExists(email, username)) {
                request.setAttribute("error", "Email or Username already exists.");
            }else if(!ValidationUtil.isValidAddress(address)) {
            	request.setAttribute("error", "Address cannot contain special characters.");
            }

            if (request.getAttribute("error") != null) {
                request.setAttribute("user", user); 
                request.getRequestDispatcher("/WEB-INF/pages/admin/add-attorney.jsp").forward(request, response);
                return;
            }

            // Proceed to add user
            boolean result = UserService.addUser(user);
            if (result) {
                response.sendRedirect(request.getContextPath() + "/admin/attorney");
            } else {
                request.setAttribute("error", "Failed to add attorney.");
                request.setAttribute("user", user);
                request.getRequestDispatcher("/WEB-INF/pages/admin/add-attorney.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while adding the attorney.");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/pages/admin/add-attorney.jsp").forward(request, response);
        }
    }
}
