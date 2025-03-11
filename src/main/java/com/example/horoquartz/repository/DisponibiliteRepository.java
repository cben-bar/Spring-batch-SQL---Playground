package com.example.horoquartz.repository;

import com.example.horoquartz.model.Disponibilite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface DisponibiliteRepository extends JpaRepository<Disponibilite, Long> {
    
    @Query("SELECT d FROM Disponibilite d WHERE d.employe.id = :employeId AND " +
           "((d.dateDebut BETWEEN :debut AND :fin) OR (d.dateFin BETWEEN :debut AND :fin))")
    List<Disponibilite> findByEmployeAndPeriode(
        @Param("employeId") Long employeId,
        @Param("debut") LocalDate debut,
        @Param("fin") LocalDate fin
    );

    @Query("SELECT d FROM Disponibilite d WHERE " +
           "((d.dateDebut BETWEEN :debut AND :fin) OR (d.dateFin BETWEEN :debut AND :fin))")
    List<Disponibilite> findByPeriode(
        @Param("debut") LocalDate debut,
        @Param("fin") LocalDate fin
    );
} 