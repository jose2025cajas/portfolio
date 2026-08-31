 package com.jose.portfolio.domain.work;

import com.jose.portfolio.domain.document.Document;
import com.jose.portfolio.domain.week.Week;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "works")
public class Work {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(length = 1000)
    private String description;

    @Column(name = "technologies", length = 500)
    private String technologies;

    @Column(name = "github_url", length = 500)
    private String githubUrl;

    @Column(name = "demo_url", length = 500)
    private String demoUrl;

    @Column(name = "image_url", length = 500)
    private String imageUrl;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    /*
     * Muchos trabajos pertenecen a una semana.
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "week_id", nullable = false)
    private Week week;

    /*
     * Un trabajo puede tener varios documentos.
     *
     * Usamos Set en lugar de List para evitar
     * problemas de múltiples bags con Hibernate.
     */
    @OneToMany(
            mappedBy = "work",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.LAZY
    )
    private Set<Document> documents = new HashSet<>();

    // ==========================================
    // CONSTRUCTORES
    // ==========================================

    public Work() {
    }

    public Work(
            String title,
            String description,
            String technologies,
            String githubUrl,
            String demoUrl,
            String imageUrl
    ) {
        this.title = title;
        this.description = description;
        this.technologies = technologies;
        this.githubUrl = githubUrl;
        this.demoUrl = demoUrl;
        this.imageUrl = imageUrl;
    }

    // ==========================================
    // GETTERS Y SETTERS
    // ==========================================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTechnologies() {
        return technologies;
    }

    public void setTechnologies(String technologies) {
        this.technologies = technologies;
    }

    public String getGithubUrl() {
        return githubUrl;
    }

    public void setGithubUrl(String githubUrl) {
        this.githubUrl = githubUrl;
    }

    public String getDemoUrl() {
        return demoUrl;
    }

    public void setDemoUrl(String demoUrl) {
        this.demoUrl = demoUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Week getWeek() {
        return week;
    }

    public void setWeek(Week week) {
        this.week = week;
    }

    public Set<Document> getDocuments() {
        return documents;
    }

    public void setDocuments(Set<Document> documents) {
        this.documents = documents;
    }

    // ==========================================
    // MÉTODOS DE RELACIÓN
    // ==========================================

    public void addDocument(Document document) {
        documents.add(document);
        document.setWork(this);
    }

    public void removeDocument(Document document) {
        documents.remove(document);
        document.setWork(null);
    }

    // ==========================================
    // CICLO DE VIDA JPA
    // ==========================================

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}

