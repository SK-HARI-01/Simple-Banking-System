package com.example.BankingSystem.Entity;

import java.math.BigDecimal;
import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "transactiontable")
public class TransactionTable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(unique = true)
    private String transactionid;

    private String detail;
    private String type; 
    private BigDecimal amount;
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "customer_id") 
    private CustomerEntity customer;

    public TransactionTable() {}

    public TransactionTable(String transactionid, String detail, String type, BigDecimal amount, LocalDate date) {
        this.transactionid = transactionid;
        this.detail = detail;
        this.type = type;
        this.amount = amount;
        this.date = date;
    }

    

    public String getTransactionid() {
		return transactionid;
	}

	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }

   
}
