package com.jose.portfolio.presentation.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jose.portfolio.domain.week.Week;
import com.jose.portfolio.service.WeekService;

@Controller
public class HomeController {

    private final WeekService weekService;

    public HomeController(WeekService weekService) {
        this.weekService = weekService;
    }

    @GetMapping("/")
    public String home(Model model) {

        List<Week> weeks = weekService.findAll();

        model.addAttribute("weeks", weeks);

        return "home/index";
    }
}