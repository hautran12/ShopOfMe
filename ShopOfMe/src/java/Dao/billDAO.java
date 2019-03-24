/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Bill;
import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HauTran
 */
public class billDAO {
    
    public void insertBill(Bill bill) throws SQLException{
        Connection connection = DBconnect.getConnection();
        String sql = "INSERT INTO bill VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bill.getBillID());
        ps.setLong(2, bill.getUsersID());
        ps.setDouble(3, bill.getTotal());
        ps.setString(4, bill.getPayment());
        ps.setString(5, bill.getAddress());
        ps.setTimestamp(6, bill.getDate());
        ps.executeUpdate();
    }
    
    public ArrayList<Bill> getListBill(){
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM bill";
        PreparedStatement ps;
        try {
            ArrayList<Bill> list = new ArrayList<>();
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill();
                bill.setBillID(rs.getLong("bill_id"));
                bill.setUsersID(rs.getLong("user_id"));
                bill.setTotal(rs.getDouble("total"));
                bill.setPayment(rs.getString("payment"));
                bill.setAddress(rs.getString("address"));
                bill.setDate(rs.getTimestamp("date"));
                list.add(bill);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(billDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public boolean deleteBill(long Bill_id){
        Connection connection = DBconnect.getConnection();
        String sql = "DELETE FROM bill WHERE bill_id=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1,Bill_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String[] args) throws SQLException {
        new billDAO().insertBill(new Bill(0, 1, 1, "s", "s", new Timestamp(new Date().getTime())));
    }
}
