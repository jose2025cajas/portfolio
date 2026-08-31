package com.jose.portfolio.repository;

import com.jose.portfolio.domain.document.Document;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DocumentRepository extends JpaRepository<Document, Long> {

    List<Document> findByWorkIdOrderByCreatedAtDesc(Long workId);

}