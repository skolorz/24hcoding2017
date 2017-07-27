package com.ingbank.hackathon.dao.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "mappedbankaccount")
public class BankAccount implements Serializable {

    @Id
    @Column(name = "theaccountid")
    @JsonIgnore
    private String id;

    @Column
    private String holder;

    @Column(name = "accountiban")
    private String iban;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public BankAccount() {
    }

    public String getHolder() {
        return holder;
    }

    public void setHolder(String holder) {
        this.holder = holder;
    }

    public String getIban() {
        return iban;
    }

    public void setIban(String iban) {
        this.iban = iban;
    }

    public String getIbanHidden() {
        return iban != null ? iban.substring(0, 5)+"XXXX" : null;
    }
}
