package com.ingbank.hackathon.dao.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "consumer")
public class Consumer extends BaseEntity implements Serializable {

    @Column
    private String name;

    @Column
    private String description;

    public Consumer() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
