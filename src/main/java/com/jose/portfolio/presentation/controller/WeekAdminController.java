package com.jose.portfolio.presentation.controller;

import com.jose.portfolio.domain.week.Week;
import com.jose.portfolio.service.WeekService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/weeks")
public class WeekAdminController {

    private final WeekService weekService;

    public WeekAdminController(WeekService weekService) {
        this.weekService = weekService;
    }


// ==========================================
// DETALLE
// ==========================================

    @GetMapping("/{id}")
    public String detail(
            @PathVariable Long id,
            Model model
    ) {

        Week week = weekService.findById(id);

        model.addAttribute("week", week);

        return "admin/weeks/detail";
    }


// ==========================================
// FORMULARIO NUEVO
// ==========================================

    @GetMapping("/new")
    public String createForm(Model model) {

        model.addAttribute("week", new Week());

        return "admin/weeks/form";
    }


// ==========================================
// CREAR
// ==========================================

    @PostMapping
    public String create(
            @ModelAttribute("week") Week week
    ) {

        weekService.save(week);

        return "redirect:/admin";
    }


// ==========================================
// FORMULARIO EDITAR
// ==========================================

    @GetMapping("/edit/{id}")
    public String editForm(
            @PathVariable Long id,
            Model model
    ) {

        Week week = weekService.findById(id);

        model.addAttribute("week", week);

        return "admin/weeks/form";
    }


// ==========================================
// ACTUALIZAR
// ==========================================

    @PostMapping("/update/{id}")
    public String update(
            @PathVariable Long id,
            @ModelAttribute("week") Week week
    ) {

        weekService.update(id, week);

        return "redirect:/admin/weeks/" + id;
    }


// ==========================================
// ELIMINAR
// ==========================================

    @PostMapping("/delete/{id}")
    public String delete(
            @PathVariable Long id
    ) {

        weekService.delete(id);

        return "redirect:/admin";
    }

}
