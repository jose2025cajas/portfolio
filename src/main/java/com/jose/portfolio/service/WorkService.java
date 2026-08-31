 package com.jose.portfolio.service;

import com.jose.portfolio.domain.work.Work;
import com.jose.portfolio.repository.WorkRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WorkService {

    private final WorkRepository workRepository;

    public WorkService(WorkRepository workRepository) {
        this.workRepository = workRepository;
    }

    @Transactional(readOnly = true)
    public List<Work> findAll() {
        return workRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Work findById(Long id) {

        return workRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException(
                                "Trabajo no encontrado: " + id
                        )
                );
    }

    @Transactional
    public Work save(Work work) {
        return workRepository.save(work);
    }

    @Transactional
    public void deleteById(Long id) {
        workRepository.deleteById(id);
    }
}

