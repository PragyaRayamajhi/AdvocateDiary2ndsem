package com.advocatediary.controller;

import com.advocatediary.model.UserModel;
import com.advocatediary.service.LoginService;
import com.advocatediary.util.CookieUtil;
import com.advocatediary.util.SessionUtil;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

//@WebServlet("/login")
public class LoginController extends HttpServlet {
	private LoginService loginService = new LoginService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
			request.setAttribute("error", "All fields are required.");
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
			return;
		}

		UserModel user = loginService.authenticate(username, password);
		if (user != null) {
			SessionUtil.createSession(request, user); 
			CookieUtil.addCookie(response, "user", user.getUsername(), 60 * 60); 
//			HttpSession session = request.getSession();
//            session.setAttribute("user", user);
			
			if (user.isAdmin() == 1) {
				response.sendRedirect(request.getContextPath() + "/admin/dashboard");
			} else {
				response.sendRedirect(request.getContextPath() + "/user/dashboard");
			}
		} else {
			request.setAttribute("error", "Invalid login credentials.");
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/login.jsp");
		dispatcher.forward(request, response);
	}
}
