package com.example.BankingSystem.Repository;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.BankingSystem.Entity.CustomerEntity;

public interface CustomerRepo extends JpaRepository<CustomerEntity, Long> {
    
    Optional<CustomerEntity> findByUname(String uname);

    boolean existsByAccno(String accno);

    Optional<CustomerEntity> findByAccno(String accno); 
}

