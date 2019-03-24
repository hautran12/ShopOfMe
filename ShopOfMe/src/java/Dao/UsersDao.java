/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Users;
import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HauTran
 */
public class UsersDao {

    public boolean checkMail(String email) {
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM user WHERE user_email='" + email + "'";
        PreparedStatement ps;

        try {
            ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insertUser(Users u) {
        Connection connection = DBconnect.getConnection();
        String sql = "INSERT INTO user VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, u.getUserID());
            ps.setString(2, u.getUserEmail());
            ps.setString(3, u.getUserPassword());
            ps.setBoolean(4, u.isUserRole());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

   public Users login(String email, String password){
        Connection con = DBconnect.getConnection();
        String sql = "SELECT * FROM user WHERE user_email='" + email + "' and user_password='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users u = new Users();
                u.setUserID(rs.getLong("user_id"));
                u.setUserEmail(rs.getString("user_email"));
                u.setUserPassword(rs.getString("user_password"));
                u.setUserRole(rs.getBoolean("user_role"));
                con.close();
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
   }
   public Users getUser (Long usersID){
       Connection connection = DBconnect.getConnection();
       String sql = "SELECT * FROM user WHERE user_id = ? ";
       PreparedStatement ps;
        try {
            ps = connection.prepareCall(sql);
            ps.setLong(1, usersID);
            ResultSet rs = ps.executeQuery();
            
            Users u = new Users();
            while (rs.next()) {
                u.setUserEmail(rs.getString("user_email"));
            }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, ex);
        }
       return null;
   }
    public static void main(String[] args) {
        UsersDao ud = new UsersDao();
        System.out.println(ud.insertUser(new Users(0,"trung@gmail.com" , "12345", true)));
    }
}
