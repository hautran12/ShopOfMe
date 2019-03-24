/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Category;
import Model.value;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HauTran
 */
public class ChartDAO {
    public ArrayList<value> getAll(){
        ProductDAO pdao = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<value> list = new ArrayList<>();
        try {
            for(Category category:categoryDAO.getlistCategory()){
                list.add(new value(category.getCategoryName(),
                        pdao.getListProductByCategory(category.getCategoryID()).size()));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ChartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(new ChartDAO().getAll());
        for(value v:new ChartDAO().getAll()){
            System.out.println(v.getName()+" "+v.getValue());
        }
    }
}
