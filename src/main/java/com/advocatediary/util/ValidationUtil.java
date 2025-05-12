package com.advocatediary.util;

import java.util.regex.Pattern;

public class ValidationUtil {

    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    public static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w-\\.]+@gmail\\.com$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    public static boolean isValidPhoneNumber(String number) {
        return number != null && number.matches("^(97|98)\\d{8}$");
    }

    public static boolean isAlphanumericStartingWithLetter(String value) {
        return value != null && value.matches("^[a-zA-Z][a-zA-Z0-9]*$");
    }
    public static boolean isValidName(String name) {
        if (isNullOrEmpty(name)) return false;

        if (!name.matches("^[a-zA-Z\\s]+$")) return false;

        String[] words = name.trim().split("\\s+");
        return words.length <= 3;
    }



    public static boolean isValidAddress(String address) {
        if (isNullOrEmpty(address)) return false;
        return address.matches("^[a-zA-Z0-9\\s,.-]{1,100}$");
    }

    public static boolean isValidUsername(String username) {
        return username != null && username.matches("^[a-zA-Z0-9]{1,15}$");
    }
    public static boolean isValidCaseName(String caseName) {
        return caseName != null && caseName.matches("^[a-zA-Z\\s]{1,15}$");
    }

    

    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }
}
