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

    

    public static boolean doPasswordsMatch(String password, String retypePassword) {
        return password != null && password.equals(retypePassword);
    }
}
