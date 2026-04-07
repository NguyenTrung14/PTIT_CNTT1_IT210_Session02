package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ReportController {

    @GetMapping("/report")
    public String showReport(Model model) {

        // fake data
        List<Object[]> students = List.of(
                new Object[] { "SV01", "Nguyễn Văn A", "CNTT1", 8.5 },
                new Object[] { "SV02", "Trần Văn B", "CNTT2", 6.5 },
                new Object[] { "SV03", "Lê Văn C", "CNTT3", 4.0 });

        model.addAttribute("students", students);
        model.addAttribute("keyword", "demo");

        return "ex2/report";
    }
}