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
    public String showLoginPage() {
        return "ex3/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {

        if ("admin".equals(username) && "admin123".equals(password)) {
            session.setAttribute("loggedUser", "admin");
            session.setAttribute("role", "ADMIN");
            return "redirect:/orders";
        }

        if ("staff".equals(username) && "staff123".equals(password)) {
            session.setAttribute("loggedUser", "staff");
            session.setAttribute("role", "STAFF");
            return "redirect:/orders";
        }

        model.addAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
        return "ex3/login";
    }

    
}

