package com.demo.service;

import com.demo.model.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAll();
    Employee findByCode(String code);
    long getTechnicalDepartmentTotalSalary();
}