/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Category;
import connect.DBconnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HauTran
 */
public class CategoryDAO {
    public ArrayList<Category> getlistCategory() throws SQLException{
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM category";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Category> list = new ArrayList<>();
        while(rs.next()){
            Category category = new Category();
            category.setCategoryID(rs.getInt("categoryID"));
            category.setCategoryName(rs.getString("categoryName"));
            list.add(category);
        }
        return list;
    }
    
    public boolean insertCategory(Category c){
        Connection connection = DBconnect.getConnection();
        String sql = "INSERT INTO category VALUES (?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, c.getCategoryID());
            ps.setString(2, c.getCategoryName());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
        public boolean updateCategory(Category c){
        Connection connection = DBconnect.getConnection();
        String sql = "UPDATE category SET categoryName = ? WHERE categoryID = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setLong(2,c.getCategoryID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteCategory(long categoryID){
        Connection connection = DBconnect.getConnection();
        String sql = "DELETE FROM category WHERE categoryID=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1,categoryID);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}