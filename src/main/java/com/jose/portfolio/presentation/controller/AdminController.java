package com.jose.portfolio.presentation.controller;

import com.jose.portfolio.service.WeekService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    private final WeekService weekService;

    public AdminController(WeekService weekService) {
        this.weekService = weekService;
    }

    @GetMapping("/admin")
    public String dashboard(Model model) {

        model.addAttribute("weeks", weekService.findAll());

        return "admin/index";
    }
}