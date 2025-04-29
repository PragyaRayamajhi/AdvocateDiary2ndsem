package com.advocatediary.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.advocatediary.model.UserModel;
import com.advocatediary.util.ValidationUtil;
import com.advocatediary.service.UpdateProfileService;


public class UserProfileController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/update-profile.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");

        UserModel user = (UserModel) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Email must be a valid Gmail address.");
            request.getRequestDispatcher("/WEB-INF/pages/update-profile.jsp").forward(request, response);
            return;
        }

        if (!ValidationUtil.isValidPhoneNumber(phone)) {
            request.setAttribute("error", "Phone number must start with 97 or 98 and be 10 digits.");
            request.getRequestDispatcher("/WEB-INF/pages/update-profile.jsp").forward(request, response);
            return;
        }

        user.setName(name);
        user.setEmail(email);
        user.setAddress(address);
        user.setPhone(phone);
        user.setUsername(username);

        UpdateProfileService updateService = new UpdateProfileService();
        boolean isUpdated = updateService.updateProfile(user);

        if (isUpdated) {
            request.getSession().setAttribute("user", user);
            if(user.isAdmin()==1) {
            	response.sendRedirect("/advocatediary/admin/dashboard");
            }else {
            	response.sendRedirect("/advocatediary/user/dashboard");
            }
            
        } else {
            request.setAttribute("error", "Unable to update profile. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/update-profile.jsp").forward(request, response);
        }
    }
}
