package com.demo.exception;

public class EmployeeNotFoundException extends RuntimeException {
    private final String employeeCode;

    public EmployeeNotFoundException(String employeeCode) {
        super("Nhân viên " + employeeCode + " không tồn tại trong hệ thống");
        this.employeeCode = employeeCode;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }
}