/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;

/**
 *
 * @author HauTran
 */
public class Bill {
    private long billID;
    private long usersID;
    private double total;
    private String payment;
    private String address;
    private Timestamp date;

    public Bill() {
    }
    
    

    public Bill(long billID, long usersID, double total, String payment, String address, Timestamp date) {
        this.billID = billID;
        this.usersID = usersID;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
    }
    

    public long getBillID() {
        return billID;
    }

    public void setBillID(long billID) {
        this.billID = billID;
    }

    public long getUsersID() {
        return usersID;
    }

    public void setUsersID(long usersID) {
        this.usersID = usersID;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
}
