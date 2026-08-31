package com.jose.portfolio.service;

import com.jose.portfolio.domain.week.Week;
import com.jose.portfolio.repository.WeekRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WeekService {

    private final WeekRepository weekRepository;

    public WeekService(WeekRepository weekRepository) {
        this.weekRepository = weekRepository;
    }

// ==========================================
// LISTAR
// ==========================================

    @Transactional(readOnly = true)
    public List<Week> findAll() {

        List<Week> weeks =
                weekRepository.findAllByOrderByNumberAsc();

        weeks.forEach(week ->
                week.getWorks().forEach(work ->
                        work.getDocuments().size()
                )
        );

        return weeks;
    }


// ==========================================
// BUSCAR POR ID
// ==========================================

    @Transactional(readOnly = true)
    public Week findById(Long id) {

        return weekRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException(
                                "Semana no encontrada: " + id
                        )
                );
    }


// ==========================================
// CREAR
// ==========================================

    @Transactional
    public Week save(Week week) {

        return weekRepository.save(week);
    }


// ==========================================
// ACTUALIZAR
// ==========================================

    @Transactional
    public Week update(Long id, Week data) {

        Week week = findById(id);

        week.setNumber(data.getNumber());
        week.setTitle(data.getTitle());
        week.setDescription(data.getDescription());

        return weekRepository.save(week);
    }


// ==========================================
// ELIMINAR
// ==========================================

    @Transactional
    public void delete(Long id) {

        Week week = findById(id);

        weekRepository.delete(week);
    }


}
