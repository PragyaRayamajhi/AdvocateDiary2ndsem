package com.advocatediary.model;


public class UserModel{
	private int id;
    private String name;
    private String email;
    private String address;
    private String password;
    private int isAdmin;
    private String username;
    private String phone;

    
 public UserModel() {
        
        
    }
    

    // Parameterized constructor
    public UserModel(String name, String email, String address, String password, int isAdmin, String username, String phone) {
     
        this.name = name;
        this.email = email;
        this.address = address;
        this.password = password;
        this.isAdmin = isAdmin;
        this.username = username;
        this.phone = phone;
    }

    public int getId() {
    	return id;
    }
    public void setId(int id) {
    	this.id=id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int isAdmin() {
        return isAdmin;
    }

    public void setAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
