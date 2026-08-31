 package com.jose.portfolio.repository;

import com.jose.portfolio.domain.work.Work;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface WorkRepository extends JpaRepository<Work, Long> {

    /**
     * Obtiene un trabajo junto con su semana
     * y sus documentos.
     */
    @Override
    @EntityGraph(attributePaths = {"week", "documents"})
    Optional<Work> findById(Long id);

    /**
     * Obtiene los trabajos de una semana
     * ordenados del más reciente al más antiguo.
     */
    List<Work> findByWeekIdOrderByCreatedAtDesc(Long weekId);
}
