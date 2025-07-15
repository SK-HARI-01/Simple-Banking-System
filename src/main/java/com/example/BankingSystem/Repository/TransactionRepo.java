package com.example.BankingSystem.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.BankingSystem.Entity.TransactionTable;
import com.example.BankingSystem.Entity.CustomerEntity;

public interface TransactionRepo extends JpaRepository<TransactionTable, Long> {

    List<TransactionTable> findByCustomer(CustomerEntity customer);

    List<TransactionTable> findByTransactionid(String transactionid); 
}
