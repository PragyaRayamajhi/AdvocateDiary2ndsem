package com.advocatediary.controller.admin;

import com.advocatediary.model.CaseModel;
import com.advocatediary.model.CourtModel;
import com.advocatediary.model.UserModel;
import com.advocatediary.service.CaseService;
import com.advocatediary.service.CourtService;
import com.advocatediary.service.UserService;
import com.advocatediary.util.ValidationUtil;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/admin/edit-case")
public class EditCase extends HttpServlet {

    private CaseService caseService = new CaseService();
    private CourtService courtService = new CourtService();
    private UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int caseId = Integer.parseInt(request.getParameter("id"));
        try {
            CaseModel caseModel = caseService.getCaseById(caseId);
            List<CourtModel> courts = courtService.getAllCourts();
            List<UserModel> users = userService.getAllUsers();

            request.setAttribute("caseModel", caseModel);
            request.setAttribute("courts", courts);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/WEB-INF/pages/admin/edit-case.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/admin/case?error=Unable to load case");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int caseId = Integer.parseInt(request.getParameter("caseId"));
            String title = request.getParameter("caseTitle");
            String clientName = request.getParameter("clientName");
            String caseType = request.getParameter("caseType");
            String status = request.getParameter("status");
            String lastHearingStr = request.getParameter("last_hearing");
            String nextHearingStr = request.getParameter("next_hearing");
            String description = request.getParameter("description");
            String userIdStr = request.getParameter("user");
            String courtIdStr = request.getParameter("court");

            // Validate required fields
            if (!ValidationUtil.isValidCaseName(title)) {
                request.setAttribute("error", "Case title must only contain letters/spaces and max 15 characters.");
                doGet(request, response);
                return;
            }

            if (!ValidationUtil.isValidName(clientName)) {
                request.setAttribute("error", "Client name must contain at most 3 words.");
                doGet(request, response);
                return;
            }

            if (ValidationUtil.isNullOrEmpty(userIdStr) || ValidationUtil.isNullOrEmpty(courtIdStr)) {
                request.setAttribute("error", "User and Court selection is required.");
                doGet(request, response);
                return;
            }

            int userId = Integer.parseInt(userIdStr);
            int courtId = Integer.parseInt(courtIdStr);

            // Validate dates
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

            // Build model
            CaseModel caseModel = new CaseModel();
            caseModel.setId(caseId);
            caseModel.setTitle(title);
            caseModel.setClientName(clientName);
            caseModel.setCaseType(caseType);
            caseModel.setStatus(status);
            caseModel.setLastHearing(lastHearing);
            caseModel.setNextHearing(nextHearing);
            caseModel.setDescription(description);
            caseModel.setUserId(userId);
            caseModel.setCourtId(courtId);

            if (caseService.updateCase(caseModel)) {
                response.sendRedirect(request.getContextPath() + "/admin/case?success=Case updated");
            } else {
                request.setAttribute("error", "Unable to update case.");
                doGet(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input data.");
            doGet(request, response);
        }
    }
}
