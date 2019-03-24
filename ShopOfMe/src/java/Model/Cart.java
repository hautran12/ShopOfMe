/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HauTran
 */
public class Cart {

    public Cart() {
        cartItem = new HashMap<>();
    }
    
    
    private HashMap<Long,Item> cartItem;
    

    public Cart(HashMap<Long, Item> cartItem) {
        this.cartItem = cartItem;
    }
    

    public HashMap<Long, Item> getCartItem() {
        return cartItem;
    }

    public void setCartItem(HashMap<Long, Item> cartItem) {
        this.cartItem = cartItem;
    }
    public void plusToCart(Long key,Item item){
        boolean check = cartItem.containsKey(key);
        if(check){
            int quantity_old = item.getQuantity();
            cartItem.put(key, item);
        }else{
            cartItem.put(key, item);
        }
    }
    
    public void subToCart(Long key, Item item){
        boolean check = cartItem.containsKey(key);
        if(check){
            int quantity_old = item.getQuantity();
            if(quantity_old<=1){
                cartItem.remove(key);
            }else {
                item.setQuantity(quantity_old-1);
                cartItem.put(key, item);
            }
        }
    }
    public void removeToCart(Long key){
        boolean check = cartItem.containsKey(key);
        if(check){
            cartItem.remove(key);
        }
    }
    
    public int countItems(){
        return cartItem.size();
    } 
    public double totalToCart(){
        double count = 0;
        for(Map.Entry<Long,Item> list: cartItem.entrySet()){
            count += list.getValue().getProduct().getProductPrice() + list.getValue().getQuantity();
        }
        return count;
    }
}

