package com.example.BankingSystem.Entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.*;

@Entity
@Table(name = "customerentitytable")
public class CustomerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(unique = true)
    private String uname;
    private String password;
    private String name;
    private String phno;

    @Column(unique = true)
    private String accno;

    private String acctype;
    private BigDecimal balance;
    private String aadhaarno;
    private String panno;

    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<TransactionTable> transactions = new ArrayList<>();

    public CustomerEntity() {}

    public CustomerEntity(String uname, String password, String name, String phno, String accno, String acctype,
                          BigDecimal balance, String aadhaarno, String panno) {
        this.uname = uname;
        this.password = password;
        this.name = name;
        this.phno = phno;
        this.accno = accno;
        this.acctype = acctype;
        this.balance = balance;
        this.aadhaarno = aadhaarno;
        this.panno = panno;
    }

     
    public List<TransactionTable> getTransactions() {
        return transactions;
    }

    public String getUname() {
		return uname;
	}

	public long getId() {
    	return id;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getAccno() {
		return accno;
	}

	public void setAccno(String accno) {
		this.accno = accno;
	}

	public String getAcctype() {
		return acctype;
	}

	public void setAcctype(String acctype) {
		this.acctype = acctype;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public String getAadhaarno() {
		return aadhaarno;
	}

	public void setAadhaarno(String aadhaarno) {
		this.aadhaarno = aadhaarno;
	}

	public String getPanno() {
		return panno;
	}

	public void setPanno(String panno) {
		this.panno = panno;
	}

	public void setTransactions(List<TransactionTable> transactions) {
        this.transactions = transactions;
    }

    public void addTransaction(TransactionTable txn) {
        transactions.add(txn);
        txn.setCustomer(this);
    }

    public void removeTransaction(TransactionTable txn) {
        transactions.remove(txn);
        txn.setCustomer(null);
    }
}
