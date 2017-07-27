package com.ingbank.hackathon.dao.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonUnwrapped;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "mappedtransactionrequest")
public class TransactionRequest implements Serializable {

    @Id
    @Column
    @JsonIgnore
    private Long id;

    @Column(name = "mchallenge_id")
    private String token;

    @Column(name = "createdat")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Europe/Warsaw")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "mtype")
    private String type;

    @Column(name = "mstatus")
    private String status;

    @Column(name = "mcharge_currency")
    private String currency;

    @Column(name = "mbody_value_amount")
    private String amount;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mfrom_accountid")
    @JsonUnwrapped
    private BankAccount account;

    public TransactionRequest() {
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public BankAccount getAccount() {
        return account;
    }

    public void setAccount(BankAccount account) {
        this.account = account;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
