package com.advocatediary.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.advocatediary.model.CourtModel;
import com.advocatediary.service.CourtService;

@WebServlet("/admin/court")
public class Court extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CourtService courtService;

	@Override
	public void init() throws ServletException {
		courtService = new CourtService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String query = request.getParameter("query");

		try {
			List<CourtModel> courtList = courtService.getCourts(query);
			request.setAttribute("courtList", courtList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Unable to fetch courts.");
		}

		request.getRequestDispatcher("/WEB-INF/pages/admin/court.jsp").forward(request, response);
	}
}
