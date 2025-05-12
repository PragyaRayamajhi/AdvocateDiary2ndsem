package com.advocatediary.model;

public class CourtModel {
    private int id;
    private String name;
    private String location;

    // Constructors
    public CourtModel() {
    }

    public CourtModel(int id, String name, String location) {
        this.id = id;
        this.name = name;
        this.location = location;
    }

    public CourtModel(String name, String location) {
        this.name = name;
        this.location = location;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    // Optional: toString method
    @Override
    public String toString() {
        return "CourtModel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
