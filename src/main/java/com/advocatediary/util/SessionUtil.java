package com.advocatediary.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.advocatediary.model.UserModel;

public class SessionUtil {

    public static void createSession(HttpServletRequest request, UserModel user) {
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);  
    }

    public static void destroySession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("user") != null;
    }
}
