package com.advocatediary.controller.admin;

import com.advocatediary.model.CaseModel;
import com.advocatediary.model.UserModel;
import com.advocatediary.model.CourtModel;
import com.advocatediary.service.CaseService;
import com.advocatediary.service.UserService;
import com.advocatediary.service.CourtService;
import com.advocatediary.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;

@WebServlet("/admin/add-case")
public class AddCase extends HttpServlet {

    private CaseService caseService;
    private UserService userService;
    private CourtService courtService;

    @Override
    public void init() throws ServletException {
        caseService = new CaseService();
        userService = new UserService();
        courtService = new CourtService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<UserModel> users = userService.getAllUsers();
            List<CourtModel> courts = courtService.getAllCourts();
            request.setAttribute("users", users);
            request.setAttribute("courts", courts);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/admin/add-case.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String caseTitle = request.getParameter("caseTitle");
        String caseType = request.getParameter("caseType"); 
        String clientName = request.getParameter("clientName");
        String courtIdStr = request.getParameter("court");
        String lastHearingStr = request.getParameter("last_hearing");
        String nextHearingStr = request.getParameter("next_hearing");
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        String userIdStr = request.getParameter("user");

        // Input validation
        if (!ValidationUtil.isValidCaseName(caseTitle)) {
            request.setAttribute("error", "Case title must only contain letters/spaces and max 15 characters.");
            doGet(request, response);
            return;
        }

        if (!ValidationUtil.isValidName(clientName)) {
            request.setAttribute("error", "Client name must contain at most 3 words.");
            doGet(request, response);
            return;
        }

        if (ValidationUtil.isNullOrEmpty(courtIdStr) || ValidationUtil.isNullOrEmpty(userIdStr)) {
            request.setAttribute("error", "Court and User must be selected.");
            doGet(request, response);
            return;
        }

        int courtId;
        int userId;

        try {
            courtId = Integer.parseInt(courtIdStr);
            userId = Integer.parseInt(userIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid user or court selection.");
            doGet(request, response);
            return;
        }

        Date lastHearing = null;
        Date nextHearing = null;

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            if (!ValidationUtil.isNullOrEmpty(lastHearingStr)) {
                lastHearing = new Date(sdf.parse(lastHearingStr).getTime());
            }

            if (!ValidationUtil.isNullOrEmpty(nextHearingStr)) {
                nextHearing = new Date(sdf.parse(nextHearingStr).getTime());
            }

        } catch (Exception e) {
            request.setAttribute("error", "Invalid date format.");
            doGet(request, response);
            return;
        }

        // Build case model
        CaseModel caseModel = new CaseModel();
        caseModel.setTitle(caseTitle);
        caseModel.setCaseType(caseType);
        caseModel.setClientName(clientName);
        caseModel.setStatus(status);
        caseModel.setCourtId(courtId);
        caseModel.setUserId(userId);
        caseModel.setDescription(description);
        caseModel.setLastHearing(lastHearing);
        caseModel.setNextHearing(nextHearing);

        try {
            boolean isAdded = caseService.addCase(caseModel);
            if (isAdded) {
                response.sendRedirect("/advocatediary/admin/case");
            } else {
                request.setAttribute("error", "Error adding the case.");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error occurred while adding the case.");
            doGet(request, response);
        }
    }
}
