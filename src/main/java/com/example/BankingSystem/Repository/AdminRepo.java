package com.example.BankingSystem.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.BankingSystem.Entity.AdminEntity;
import java.util.Optional;

public interface AdminRepo extends JpaRepository<AdminEntity, String> {
    Optional<AdminEntity> findByUsername(String username);
}