package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping("/welcome")
    public String showWelcome(Model model) {
        model.addAttribute("employeeName", "Nguyễn Trung");
        return "ex1/welcome";
    }
}