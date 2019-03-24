/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Billdetail;
import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author HauTran
 */
public class billDetailDAO {
    public void insertBillDetail(Billdetail bd) throws SQLException{
        Connection connection = DBconnect.getConnection();
        String sql = "INSERT INTO billdetail VALUES (?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bd.getBillDetailID());
        ps.setLong(2, bd.getBillID());
        ps.setLong(3, bd.getProductID());
        ps.setDouble(4, bd.getPrice());
        ps.setInt(5, bd.getQuantity());
        ps.executeUpdate();
    }
    public static void main(String[] args) throws SQLException {
        new billDetailDAO().insertBillDetail(new Billdetail(0, 0, 0,0 ,1));
    }
}