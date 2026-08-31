
        package com.jose.portfolio.domain.week;

import com.jose.portfolio.domain.work.Work;
import jakarta.persistence.*;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "weeks")
public class Week {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private Integer number;

    @Column(nullable = false, length = 150)
    private String title;

    @Column(length = 500)
    private String description;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    /**
     * Una semana puede tener muchos trabajos.
     *
     * La relación inversa está definida en Work
     * mediante el atributo "week".
     */
    @OneToMany(
            mappedBy = "week",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private Set<Work> works = new LinkedHashSet<>();

    // ==========================================
    // CONSTRUCTORES
    // ==========================================

    public Week() {
    }

    public Week(Integer number, String title, String description) {
        this.number = number;
        this.title = title;
        this.description = description;
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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Set<Work> getWorks() {
        return works;
    }

    public void setWorks(Set<Work> works) {
        this.works = works;
    }

    // ==========================================
    // MÉTODOS DE RELACIÓN
    // ==========================================

    public void addWork(Work work) {
        if (work == null) {
            return;
        }

        works.add(work);
        work.setWeek(this);
    }

    public void removeWork(Work work) {
        if (work == null) {
            return;
        }

        works.remove(work);
        work.setWeek(null);
    }

    // ==========================================
    // CICLO DE VIDA JPA
    // ==========================================

    @PrePersist
    protected void onCreate() {
        LocalDateTime now = LocalDateTime.now();
        createdAt = now;
        updatedAt = now;
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
