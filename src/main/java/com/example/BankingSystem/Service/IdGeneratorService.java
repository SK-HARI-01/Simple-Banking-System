package com.example.BankingSystem.Service;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import org.springframework.stereotype.Service;

@Service
public class IdGeneratorService {

    public String generateAccountNumber() {
        Random random = new Random();
        return String.format("%05d", 10000 + random.nextInt(90000)); // 5-digit
    }

    public String generateTransactionId() {
        String prefix = "TXN";
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"));
        return prefix + timestamp;
    }
}
