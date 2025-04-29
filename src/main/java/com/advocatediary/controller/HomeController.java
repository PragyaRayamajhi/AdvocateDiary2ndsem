package com.advocatediary.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

//@WebServlet("/home")
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false); 
		

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("/advocatediary/login");
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/home.jsp");
		dispatcher.forward(request, response);

		// If session exists and user is logged in, display the home page
	}
}
