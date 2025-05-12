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

@WebServlet("/admin/edit-attorney")
public class EditAttorney extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int attorneyId = Integer.parseInt(request.getParameter("id"));

        try {
            UserModel attorney = userService.getUserById(attorneyId);

            if (attorney == null) {
                response.sendRedirect(request.getContextPath() + "/admin/attorney?error=notfound");
                return;
            }

            request.setAttribute("attorney", attorney);
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-attorney.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/attorney?error=exception");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        int attorneyId = Integer.parseInt(request.getParameter("id"));

        UserModel attorney = null;
        try {
            attorney = UserService.getUserById(attorneyId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (attorney == null) {
            response.sendRedirect(request.getContextPath() + "/admin/attorney?error=notfound");
            return;
        }

        if (!ValidationUtil.isValidName(name)) {
            request.setAttribute("error", "Name must contain only letters and up to three words.");
        } else if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Email must be a valid Gmail address.");
        } else if (!ValidationUtil.isValidPhoneNumber(phone)) {
            request.setAttribute("error", "Phone number must start with 97 or 98 and be 10 digits.");
        } else if (!ValidationUtil.isValidUsername(username)) {
            request.setAttribute("error", "Username must be alphanumeric and up to 15 characters.");
        }else if(!ValidationUtil.isValidAddress(address)) {
        	request.setAttribute("error", "Address cannot contain special characters.");
        }

        if (request.getAttribute("error") != null) {
            attorney.setName(name);
            attorney.setEmail(email);
            attorney.setPhone(phone);
            attorney.setAddress(address);
            attorney.setUsername(username);
            request.setAttribute("attorney", attorney);
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-attorney.jsp").forward(request, response);
            return;
        }

        // ✅ Update values and proceed
        attorney.setName(name);
        attorney.setEmail(email);
        attorney.setAddress(address);
        attorney.setPhone(phone);
        attorney.setUsername(username);
        attorney.setId(attorneyId);

        try {
            boolean isUpdated = userService.updateUser(attorney);
            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/admin/attorney?success=updated");
            } else {
                request.setAttribute("error", "Unable to update attorney profile. Please try again.");
                request.setAttribute("attorney", attorney);
                request.getRequestDispatcher("/WEB-INF/pages/admin/edit-attorney.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating the attorney.");
            request.setAttribute("attorney", attorney);
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-attorney.jsp").forward(request, response);
        }
    }
}
