package com.jose.portfolio.service;

import com.jose.portfolio.domain.document.Document;
import com.jose.portfolio.repository.DocumentRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DocumentService {

    private final DocumentRepository documentRepository;

    public DocumentService(DocumentRepository documentRepository) {
        this.documentRepository = documentRepository;
    }

    @Transactional(readOnly = true)
    public List<Document> findByWorkId(Long workId) {
        return documentRepository.findByWorkIdOrderByCreatedAtDesc(workId);
    }

    @Transactional(readOnly = true)
    public Document findById(Long id) {
        return documentRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Documento no encontrado: " + id)
                );
    }

    @Transactional
    public Document save(Document document) {
        return documentRepository.save(document);
    }

    @Transactional
    public void deleteById(Long id) {
        documentRepository.deleteById(id);
    }
}