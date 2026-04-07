package com.demo.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthController {

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLogin() {
        return "ex5/auth/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        if ("hr_manager".equals(username) && "hr123".equals(password)) {
            session.setAttribute("loggedUser", "hr_manager");
            session.setAttribute("role", "hr_manager");
            return "redirect:/employees";
        }

        if ("hr_staff".equals(username) && "staff456".equals(password)) {
            session.setAttribute("loggedUser", "hr_staff");
            session.setAttribute("role", "hr_staff");
            return "redirect:/employees";
        }

        model.addAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
        return "ex5/auth/login";
    }
}