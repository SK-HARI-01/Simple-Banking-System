package com.example.BankingSystem.Controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.BankingSystem.Entity.CustomerEntity;
import com.example.BankingSystem.Entity.TransactionTable;
import com.example.BankingSystem.Repository.CustomerRepo;
import com.example.BankingSystem.Repository.TransactionRepo;
import com.example.BankingSystem.Service.IdGeneratorService;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private TransactionRepo transactionRepo;

    @Autowired
    private IdGeneratorService idGenerator;

    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
        CustomerEntity customer = (CustomerEntity) session.getAttribute("loggedInUser");
        if (customer == null) return "redirect:/login";
        
        List<TransactionTable> transactions = transactionRepo.findByCustomer(customer);
        model.addAttribute("transactions", transactions);
        return "CustomerHome";
    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    
    @PostMapping("/update")
    public String updateInfo(@RequestParam String phno,
                             @RequestParam String email,
                             HttpSession session) {
        CustomerEntity customer = (CustomerEntity) session.getAttribute("loggedInUser");
        if (customer == null) return "redirect:/login";

        customer.setPhno(phno);
        customer.setUname(email); 
        customerRepo.save(customer);
        session.setAttribute("loggedInUser", customer); 
        return "redirect:/customer/home";
    }

    @PostMapping("/transfer")
    @Transactional
    public String transferMoney(@RequestParam String toAccno,
                                @RequestParam BigDecimal amount,
                                @RequestParam String detail,
                                HttpSession session) {
        CustomerEntity sender = (CustomerEntity) session.getAttribute("loggedInUser");
        toAccno = toAccno.trim();
        if (sender == null) return "redirect:/login";
        System.out.println("Looking for accno: " + toAccno);
        System.out.println("Receiver exists: " + customerRepo.findByAccno(toAccno).isPresent());

        CustomerEntity receiver = customerRepo.findByAccno(toAccno).orElse(null);
        if (receiver == null || sender.getAccno().equals(toAccno)) return "redirect:/customer/home?invalid=true";

        if (sender.getBalance().compareTo(amount) < 0) return "redirect:/customer/home?lowbalance=true";

        // Debit sender
        sender.setBalance(sender.getBalance().subtract(amount));
        TransactionTable debitTxn = new TransactionTable(
                idGenerator.generateTransactionId(), detail, "DEBIT", amount, LocalDate.now());
        debitTxn.setCustomer(sender);
        transactionRepo.save(debitTxn);
        customerRepo.save(sender);

        // Credit receiver
        receiver.setBalance(receiver.getBalance().add(amount));
        TransactionTable creditTxn = new TransactionTable(
                idGenerator.generateTransactionId(), "Received from " + sender.getAccno(), "CREDIT", amount, LocalDate.now());
        creditTxn.setCustomer(receiver);
        transactionRepo.save(creditTxn);
        customerRepo.save(receiver);

        return "redirect:/customer/home";
    }
}
