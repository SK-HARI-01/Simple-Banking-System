package com.example.BankingSystem.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.BankingSystem.Entity.CustomerEntity;
import com.example.BankingSystem.Repository.CustomerRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private CustomerRepo customerRepo;

    @GetMapping({"/", "/home"})
    public String showHome() {
        return "Home";
    }
    @GetMapping("/login")
    public String showLoginForm() {
        return "LoginPage";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam String username, @RequestParam String password, HttpSession session) {
        CustomerEntity customer = customerRepo.findByUname(username)
                .filter(c -> c.getPassword().equals(password))
                .orElse(null);

        if (customer != null) {
            session.setAttribute("loggedInUser", customer);
            return "redirect:/customer/home";
        } else {
            return "redirect:/login?error=true";
        }
    }
}
