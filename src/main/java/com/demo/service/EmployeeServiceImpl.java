package com.demo.service;

import com.demo.exception.EmployeeNotFoundException;
import com.demo.model.Employee;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final List<Employee> employees = new ArrayList<>();

    public EmployeeServiceImpl() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            employees.add(new Employee("NV001", "Nguyễn Thị Lan", "Kế toán", 15000000, sdf.parse("2020-03-01"), "Đang làm"));
            employees.add(new Employee("NV002", "Trần Văn Hùng", "Kỹ thuật", 25000000, sdf.parse("2019-07-15"), "Đang làm"));
            employees.add(new Employee("NV003", "Lê Minh Đức", "Kinh doanh", 18500000, sdf.parse("2021-11-20"), "Nghỉ phép"));
            employees.add(new Employee("NV004", "Phạm Thu Hương", "Kỹ thuật", 22000000, sdf.parse("2022-01-05"), "Đang làm"));
            employees.add(new Employee("NV005", "Hoàng Văn Nam", "Kế toán", 12000000, sdf.parse("2023-06-10"), "Thử việc"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Employee> findAll() {
        return employees;
    }

    @Override
    public Employee findByCode(String code) {
        return employees.stream()
                .filter(e -> e.getCode().equalsIgnoreCase(code))
                .findFirst()
                .orElseThrow(() -> new EmployeeNotFoundException(code));
    }

    @Override
    public long getTechnicalDepartmentTotalSalary() {
        return employees.stream()
                .filter(e -> "Kỹ thuật".equalsIgnoreCase(e.getDepartment()))
                .mapToLong(Employee::getSalary)
                .sum();
    }
}