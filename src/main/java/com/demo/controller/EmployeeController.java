package com.demo.controller;

import com.demo.model.Employee;
import com.demo.service.EmployeeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    private final EmployeeService employeeService;

    @Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    private boolean isNotLoggedIn(HttpSession session) {
        return session.getAttribute("loggedUser") == null;
    }

    @GetMapping
    public String showEmployees(HttpSession session, Model model) {
        if (isNotLoggedIn(session)) {
            return "redirect:/login";
        }

        model.addAttribute("employees", employeeService.findAll());
        model.addAttribute("technicalTotalSalary", employeeService.getTechnicalDepartmentTotalSalary());
        return "employees/list";
    }

    @GetMapping("/{code}")
    public String showEmployeeDetail(@PathVariable("code") String code,
                                     HttpSession session,
                                     Model model) {
        if (isNotLoggedIn(session)) {
            return "redirect:/login";
        }

        Employee employee = employeeService.findByCode(code);
        model.addAttribute("employee", employee);
        return "employees/detail";
    }
}