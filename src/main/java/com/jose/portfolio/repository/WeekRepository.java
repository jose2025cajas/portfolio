package com.jose.portfolio.repository;

import com.jose.portfolio.domain.week.Week;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface WeekRepository extends JpaRepository<Week, Long> {

    @EntityGraph(attributePaths = {
            "works",
            "works.documents"
    })
    List<Week> findAllByOrderByNumberAsc();

    @EntityGraph(attributePaths = {
            "works",
            "works.documents"
    })
    Optional<Week> findById(Long id);


}
