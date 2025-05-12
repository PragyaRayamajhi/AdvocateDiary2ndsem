package com.advocatediary.model;

import java.sql.Date;

public class CaseModel {
    private int id;
    private String title;
    private String clientName;
    private String caseType;
    private String status;
    private Date lastHearing;  
    private Date nextHearing;  
    private String description;
    private int userId;
    private int courtId;

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getLastHearing() {
        return lastHearing;
    }

    public void setLastHearing(Date lastHearing) {
        this.lastHearing = lastHearing;
    }

    public Date getNextHearing() {
        return nextHearing;
    }

    public void setNextHearing(Date nextHearing) {
        this.nextHearing = nextHearing;
    }
    public String getDescription() {
    	return description;
    }
    public void setDescription(String description) {
    	this.description=description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCourtId() {
        return courtId;
    }

    public void setCourtId(int courtId) {
        this.courtId = courtId;
    }
}
