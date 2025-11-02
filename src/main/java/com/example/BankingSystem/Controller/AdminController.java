package com.example.BankingSystem.Controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.BankingSystem.Entity.CustomerEntity;
import com.example.BankingSystem.Repository.CustomerRepo;
import com.example.BankingSystem.Repository.TransactionRepo;
import com.example.BankingSystem.Service.IdGeneratorService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CustomerRepo customerRepo;

    @Autowired
    private TransactionRepo transactionRepo;

    @Autowired
    private IdGeneratorService idGenerator;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        // Check if admin is logged in
        Boolean isAdminLoggedIn = (Boolean) session.getAttribute("adminLoggedIn");
        if (isAdminLoggedIn == null || !isAdminLoggedIn) {
            return "redirect:/login";
        }
        
        try {
            // Add data to model
            var customers = customerRepo.findAll();
            var transactions = transactionRepo.findAll();
            
            model.addAttribute("customers", customers);
            model.addAttribute("transactions", transactions);
            
            // Add counts for summary cards
            model.addAttribute("customerCount", customers.size());
            model.addAttribute("transactionCount", transactions.size());
            
            return "AdminDashboard";
        } catch (Exception e) {
            e.printStackTrace();
            // In case of error, add empty lists to prevent JSP errors
            model.addAttribute("customers", java.util.Collections.emptyList());
            model.addAttribute("transactions", java.util.Collections.emptyList());
            model.addAttribute("error", "Failed to load dashboard data: " + e.getMessage());
            return "AdminDashboard";
        }
    }

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
                new BigDecimal("10000.00"), aadhaarno, panno);


        customerRepo.save(customer);
        return "redirect:/admin/create-account?success=true";
    }

    @GetMapping("/customer/{id}")
    public String viewCustomerDetails(@PathVariable Long id, HttpSession session, Model model) {
        // Ensure admin is logged in
        Boolean isAdminLoggedIn = (Boolean) session.getAttribute("adminLoggedIn");
        if (isAdminLoggedIn == null || !isAdminLoggedIn) {
            return "redirect:/login";
        }

        try {
            var customerOpt = customerRepo.findById(id);
            if (customerOpt.isEmpty()) {
                model.addAttribute("error", "Customer not found");
                return "redirect:/admin/dashboard";
            }

            CustomerEntity customer = customerOpt.get();
            var transactions = transactionRepo.findByCustomer(customer);

            model.addAttribute("customer", customer);
            model.addAttribute("transactions", transactions);

            return "AdminCustomerDetails";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Failed to load customer details: " + e.getMessage());
            return "redirect:/admin/dashboard";
        }
    }
}
