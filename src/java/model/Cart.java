/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tango
 */
public class Cart {
    List<Item> items;

    public Cart() {
        this.items = new ArrayList();
    }
    public List<Item> getItems() {
        return items;
    }
    public Item getItemByIdAndSize(int id, int size) {
        for(Item i:items) {
            if((i.getProduct().getId()==id) && (i.getSize()==size)) {
                return i;
            }
        }
        return null;
    }
    public int getQuantityByIdAndSize(int id, int size) {
        Item i = getItemByIdAndSize(id, size);
        return i.getQuantity();
    }
    public void addItem(Item t) {
        if(getItemByIdAndSize(t.getProduct().getId(), t.getSize())!=null) {
            Item m = getItemByIdAndSize(t.getProduct().getId(), t.getSize());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        } else {
            items.add(t);
        }
//        for(Item i:items) {
//            int id = t.getProduct().getId();
//            int size = t.getSize();
//            if(getItemByIdAndSize(id, size) != null) {
//                Item m = getItemByIdAndSize(id, size);
//                m.setQuantity(m.getQuantity()+t.getQuantity());
//            } else {
//                items.add(t);
//            }
//        }
    }
    public void removeItem(int id, int size) {
        if(getItemByIdAndSize(id, size) != null) {
            items.remove(getItemByIdAndSize(id, size));
        }
    }
    public int getTotalMoney() {
        int total=0;
        for(Item i:items) {
            total += i.getQuantity()*i.getPrice();
        }
        return total;
    }
    public Product getProductById(int id, List<Product> list) {
        for(Product p:list) {
            if(id == p.getId()) {
                return p;
            }
        }
        return null;
    }
    public Cart(String txt, List<Product> list) {
        items = new ArrayList();
        try {
            if(txt!=null && txt.length()!=0) {
                String[] arr = txt.split("/");
                for(String i:arr) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int size = Integer.parseInt(n[1]);    
                    int quantity = Integer.parseInt(n[2]);
                    Product p = getProductById(id, list);
                    int price = p.getPrice()*quantity;
                    Item t = new Item(p, quantity, size, price);
                    addItem(t);
                }        
            }
        } catch(NumberFormatException e) {
            System.out.println(e);
        }
        
    }
}
