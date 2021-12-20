package com.allnnka.repository;

import com.allnnka.model.Ammunition;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AmmunitionRepository extends JpaRepository<Ammunition,Long> {
    Ammunition findByType(String type);
}
