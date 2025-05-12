package com.advocatediary.controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.advocatediary.model.UserModel;
import com.advocatediary.service.RegisterService;
import com.advocatediary.util.PasswordUtil;
import com.advocatediary.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

//@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private RegisterService registerService;

    @Override
    public void init() throws ServletException {
        registerService = new RegisterService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");

      
        if (ValidationUtil.isNullOrEmpty(name) ||
            ValidationUtil.isNullOrEmpty(email) ||
            ValidationUtil.isNullOrEmpty(address) ||
            ValidationUtil.isNullOrEmpty(password) ||
            ValidationUtil.isNullOrEmpty(username) ||
            ValidationUtil.isNullOrEmpty(phone)) {
            forwardWithError(request, response, "All fields are required.");
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            forwardWithError(request, response, "Invalid email format. Must be a valid email.");
            return;
        }

        if (!ValidationUtil.isValidPhoneNumber(phone)) {
            forwardWithError(request, response, "Phone number must be 10 digits and start with 97 or 98.");
            return;
        }

        if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) {
            forwardWithError(request, response, "Username must start with a letter and contain only letters and numbers.");
            return;
        }
        if (!ValidationUtil.isValidName(name)) {
            forwardWithError(request, response, "Name must contain only letters and up to three words.");
            return;
        }

        if(!ValidationUtil.isValidAddress(address)) {
       	 forwardWithError(request, response, "Address must have letter and number only");
            return;
       }


        UserModel user = new UserModel(name, email, address, password, 0, username, phone);

        boolean isRegistered = registerService.registerUser(user);

        if (isRegistered) {
            request.setAttribute("message", "Registration successful! Please log in.");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        } else {
            forwardWithError(request, response, "Email, phone, or username already exists.");
        }
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMsg)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMsg);
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }
}
