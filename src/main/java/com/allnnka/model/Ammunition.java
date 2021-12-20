package com.allnnka.model;

import com.sun.istack.NotNull;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
public class Ammunition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ammunitionId;

    @NotNull
    @NotBlank(message = "Typ pocisku nie może być pusty")
    private String type;

    @Min(value=1, message = "Ilość pocisków musi być minimum 1")
    @NotNull
    private int amount;

    public Ammunition(String type, int amount) {
        this.type = type;
        this.amount = amount;
    }

    public Ammunition() {

    }

    public Long getAmmunitionId() {
        return ammunitionId;
    }

    public void setAmmunitionId(Long ammunitionId) {
        this.ammunitionId = ammunitionId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
