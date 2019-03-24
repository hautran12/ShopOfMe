/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Category;
import Model.Product;
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
public class ProductDAO {

    public ArrayList<Product> getListProductByCategory(long categoryID) throws SQLException {
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM product WHERE categoryID='" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            list.add(product);
        }
        return list;
    }
    public ArrayList<Product> getAllListProduct() throws SQLException{
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM product";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            list.add(product);
        }
        return list;
    }

    public Product getProduct(long productID) throws SQLException {
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM product WHERE product_id='" + productID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) {
            product.setProductID(rs.getInt("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getInt("product_price"));
            product.setProductDescription(rs.getString("product_description"));
        }
        return product;
    }
    
    public ArrayList<Product> getListProductByNav(long categoryID,int firstResult,int maxResult) throws SQLException{
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT * FROM product WHERE categoryID = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setProductID(rs.getLong("product_id"));
            product.setProductName(rs.getString("product_name"));
            product.setProductImage(rs.getString("product_image"));
            product.setProductPrice(rs.getDouble("product_price"));
            product.setProductDescription(rs.getString("product_description"));
            list.add(product);
        }
       return list;
    }
    
    public int countProductByCategory(long categoryID) throws SQLException{
        Connection connection = DBconnect.getConnection();
        String sql = "SELECT count(product_id) FROM product WHERE categoryID = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
       int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
       return count;
    }

    public boolean insertProduct(Product p){
        Connection connection = DBconnect.getConnection();
        String sql = "INSERT INTO product VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, p.getProductID());
            ps.setString(2, p.getProductName());
            ps.setString(3, p.getProductImage());
            ps.setDouble(4, p.getProductPrice());
            ps.setString(5, p.getProductDescription());
            ps.setLong(6, p.getIdcategory());
            return ps.executeUpdate()==1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false; 
    }
    public  boolean updateCategory(Product p){
        Connection connection = DBconnect.getConnection();
        String sql = "UPDATE product SET product_name = ?,product_image=?,product_price=?,product_description=?,categoryID=? WHERE product_id = ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, p.getProductName());
            ps.setString(2, p.getProductImage());
            ps.setDouble(3, p.getProductPrice());
            ps.setString(4, p.getProductDescription());
            ps.setLong(5, p.getIdcategory());
            ps.setLong(6, p.getProductID());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean deleteProduct(long product_id){
        Connection connection = DBconnect.getConnection();
        String sql = "DELETE FROM product WHERE product_id=?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1,product_id);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();
        System.out.println(dao.insertProduct(new Product(0, "trung", "", 0, "hihihi",1)));
    }
}
