package com.jose.portfolio.presentation.controller;

import com.jose.portfolio.domain.document.Document;
import com.jose.portfolio.domain.week.Week;
import com.jose.portfolio.domain.work.Work;
import com.jose.portfolio.service.DocumentService;
import com.jose.portfolio.service.WeekService;
import com.jose.portfolio.service.WorkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/works")
public class WorkAdminController {

    private final WorkService workService;
    private final WeekService weekService;
    private final DocumentService documentService;

    public WorkAdminController(
            WorkService workService,
            WeekService weekService,
            DocumentService documentService
    ) {
        this.workService = workService;
        this.weekService = weekService;
        this.documentService = documentService;
    }

    /**
     * Detalle del trabajo.
     */
    @GetMapping("/{id}")
    public String detail(
            @PathVariable Long id,
            Model model
    ) {

        Work work = workService.findById(id);

        // Cargar documentos directamente mediante el repositorio
        // dentro de la transacción del servicio.
        List<Document> documents = documentService.findByWorkId(id);

        model.addAttribute("work", work);
        model.addAttribute("documents", documents);

        return "admin/works/detail";
    }

    /**
     * Formulario para crear un trabajo
     * dentro de una semana.
     */
    @GetMapping("/new/{weekId}")
    public String newWork(
            @PathVariable Long weekId,
            Model model
    ) {

        Week week = weekService.findById(weekId);

        Work work = new Work();
        work.setWeek(week);

        model.addAttribute("work", work);
        model.addAttribute("week", week);

        return "admin/works/form";
    }

    /**
     * Crear trabajo.
     */
    @PostMapping
    public String create(
            @ModelAttribute Work work,
            @RequestParam Long weekId
    ) {

        Week week = weekService.findById(weekId);

        work.setWeek(week);

        Work savedWork = workService.save(work);

        return "redirect:/admin/works/" + savedWork.getId();
    }

    /**
     * Formulario de edición.
     */
    @GetMapping("/edit/{id}")
    public String edit(
            @PathVariable Long id,
            Model model
    ) {

        Work work = workService.findById(id);

        model.addAttribute("work", work);
        model.addAttribute("week", work.getWeek());

        return "admin/works/form";
    }

    /**
     * Actualizar trabajo.
     */
    @PostMapping("/update/{id}")
    public String update(
            @PathVariable Long id,
            @ModelAttribute Work work,
            @RequestParam Long weekId
    ) {

        Work existingWork = workService.findById(id);
        Week week = weekService.findById(weekId);

        existingWork.setTitle(work.getTitle());
        existingWork.setDescription(work.getDescription());
        existingWork.setTechnologies(work.getTechnologies());
        existingWork.setGithubUrl(work.getGithubUrl());
        existingWork.setDemoUrl(work.getDemoUrl());
        existingWork.setImageUrl(work.getImageUrl());
        existingWork.setWeek(week);

        workService.save(existingWork);

        return "redirect:/admin/works/" + id;
    }

    /**
     * Eliminar trabajo.
     */
    @PostMapping("/delete/{id}")
    public String delete(
            @PathVariable Long id
    ) {

        Work work = workService.findById(id);

        Long weekId = work.getWeek().getId();

        workService.deleteById(id);

        return "redirect:/admin/weeks/" + weekId;
    }
}