/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author HauTran
 */
public class Product {
    private long productID;
    private String productName;
    private String productImage;
    private double productPrice;
    private String productDescription;
    private long idcategory;

    public Product() {
    }

    public Product(long productID, String productName, String productImage, double productPrice, String productDescription, long idcategory) {
        this.productID = productID;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productDescription = productDescription;
        this.idcategory = idcategory;
    }
    

    public long getIdcategory() {
        return idcategory;
    }

    public void setIdcategory(long idcategory) {
        this.idcategory = idcategory;
    }    

    public long getProductID() {
        return productID;
    }

    public void setProductID(long productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }
    
}
