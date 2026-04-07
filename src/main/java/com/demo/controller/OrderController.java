package com.demo.controller;

import com.demo.model.Order;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Controller
public class OrderController {

    @GetMapping("/orders")
    public String showOrders(HttpSession session, Model model, ServletContext application) {
        Object loggedUser = session.getAttribute("loggedUser");
        if (loggedUser == null) {
            return "redirect:/login";
        }

        List<Order> orders = new ArrayList<>();
        orders.add(new Order("DH001", "Chuột Logitech", 2500000, new Date()));
        orders.add(new Order("DH002", "Bàn phím cơ", 1800000, new Date()));
        orders.add(new Order("DH003", "Tai nghe Sony", 3200000, new Date()));
        orders.add(new Order("DH004", "Màn hình Dell", 5500000, new Date()));

        model.addAttribute("orders", orders);

        AtomicInteger totalViewCount = (AtomicInteger) application.getAttribute("totalViewCount");
        if (totalViewCount == null) {
            synchronized (application) {
                totalViewCount = (AtomicInteger) application.getAttribute("totalViewCount");
                if (totalViewCount == null) {
                    totalViewCount = new AtomicInteger(0);
                    application.setAttribute("totalViewCount", totalViewCount);
                }
            }
        }

        int currentCount = totalViewCount.incrementAndGet();
        model.addAttribute("totalViewCount", currentCount);

        return "ex3/orders";
    }
}