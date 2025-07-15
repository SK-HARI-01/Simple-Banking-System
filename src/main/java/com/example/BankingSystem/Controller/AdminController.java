package com.example.BankingSystem.Controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.BankingSystem.Entity.CustomerEntity;
import com.example.BankingSystem.Repository.CustomerRepo;
import com.example.BankingSystem.Service.IdGeneratorService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private IdGeneratorService idGenerator;

    @GetMapping("/create-account")
    public String showCreateAccountPage() {
        return "CreateAccount";
    }

    @PostMapping("/create-account")
    public String createCustomer(@RequestParam String name,
                                 @RequestParam String uname,
                                 @RequestParam String password,
                                 @RequestParam String phno,
                                 @RequestParam String acctype,
                                 @RequestParam String aadhaarno,
                                 @RequestParam String panno) {

        String accno = idGenerator.generateAccountNumber();

        CustomerEntity customer = new CustomerEntity(uname, password, name, phno, accno, acctype,
<<<<<<< HEAD
                new BigDecimal("10000.00"), aadhaarno, panno);
=======
        		new BigDecimal("10000.00"), aadhaarno, panno);
>>>>>>> 369e78a (Update the Transaction generator)

        customerRepo.save(customer);
        return "redirect:/admin/create-account?success=true";
    }
}
