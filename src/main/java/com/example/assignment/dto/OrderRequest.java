package com.example.assignment.dto;


import java.util.List;

public class OrderRequest {
    List<Integer> chk;
    List<Integer> quantity;

    public OrderRequest() {
    }

    public OrderRequest(List<Integer> chk, List<Integer> quantity) {
        this.chk = chk;
        this.quantity = quantity;
    }

    public List<Integer> getChk() {
        return chk;
    }

    public void setChk(List<Integer> chk) {
        this.chk = chk;
    }

    public List<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(List<Integer> quantity) {
        this.quantity = quantity;
    }
}
