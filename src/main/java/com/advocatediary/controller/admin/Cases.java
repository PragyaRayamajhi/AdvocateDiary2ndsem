package com.advocatediary.controller.admin;

import com.advocatediary.model.CaseModel;
import com.advocatediary.service.CaseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/admin/case")
public class Cases extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CaseService caseService;

    @Override
    public void init() throws ServletException {
        caseService = new CaseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query"); 

        try {
            List<CaseModel> caseList = caseService.getCases(query);  
            request.setAttribute("caseList", caseList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch cases.");
        }

        request.getRequestDispatcher("/WEB-INF/pages/admin/cases.jsp").forward(request, response);
    }

}
