package com.advocatediary.controller;

import com.advocatediary.util.CookieUtil;
import com.advocatediary.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

//@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SessionUtil.destroySession(request);
        CookieUtil.deleteCookie(response, "user");
        response.sendRedirect("/advocatediary/login");
    }
}
