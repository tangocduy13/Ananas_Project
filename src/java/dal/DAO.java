/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.*;

/**
 *
 * @author tango
 */
public class DAO extends DBContext {
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList();
        String sql = "SELECT * FROM Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Product p = new Product(rs.getInt("id"),
                                        rs.getString("name"),
                                        rs.getInt("price"),
                                        rs.getString("image"),
                                        rs.getString("category"));
                list.add(p);
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public Product getProductById(int id) {
        String sql = "SELECT * FROM Product WHERE id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                Product p = new Product(rs.getInt("id"),
                                        rs.getString("name"),
                                        rs.getInt("price"),
                                        rs.getString("image"),
                                        rs.getString("category"));
                return p;
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Image> getImageById(int id) {
        List<Image> list = new ArrayList();
        String sql = "SELECT * FROM Image WHERE pid=?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Image img = new Image(rs.getInt(1),
                                        rs.getString(2));
                list.add(img);
            }
            return list;
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public User getAccount(String username, String password) {
        String sql = "select * from [user] where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                User user = new User(rs.getInt("id"),
                                    rs.getString("name"),
                                    rs.getString("username"),
                                    rs.getString("password"),
                                    rs.getInt("role"));
                return user;
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void placeOrder(User u, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        String sql = "insert into [order] values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setString(2, date);
            st.setInt(3, cart.getTotalMoney());
            st.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 id from [order] order by id desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            if(rs.next()) {
                int oid = rs.getInt("id");
                for(Item i:cart.getItems()) {
                    String sql2 = "insert into [orderline] values(?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProduct().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setInt(4, i.getPrice());
                    st2.executeUpdate();
                    
                }
            }
            //cap nhat lai so luong san pham
        } catch(SQLException e) {
            System.out.println(e);
        }
    }
    public List<Product> searchByCategory(String[] category) {
        List<Product> list = new ArrayList();
        StringBuilder sb = new StringBuilder("select * from Product where category = ");
        String cate = "";
        for(String c:category) {
            if(cate.isEmpty()) {
                cate = "'"+c+"'";
            } else {
                cate += " or category = "+"'"+c+"'";
            }          
        }
        sb.append(cate);
        String sql = sb.toString();
        try {           
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add(new Product(rs.getInt("id"),
                                    rs.getString("name"),
                                    rs.getInt("price"),
                                    rs.getString("image"),
                                    rs.getString("category")));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public List<Product> searchByPrice(String[] price) {
        List<Product> list = new ArrayList();
        StringBuilder sb = new StringBuilder("select * from Product where price ");
        String str= "";
        for(String s:price) {
           if(str.isEmpty()) {
               str = s;
           } else {
               str += " or price "+" "+s;
           }
        }
        sb.append(str);
        String sql = sb.toString();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add(new Product(rs.getInt("id"),
                                    rs.getString("name"),
                                    rs.getInt("price"),
                                    rs.getString("image"),
                                    rs.getString("category")));           
            }
            return list;
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Product> searchByName(String name) {
        try {
            List<Product> list = new ArrayList();
            String sql = "select * from Product where name like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%"+name+"%");
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                list.add(new Product(rs.getInt("id"),
                                    rs.getString("name"),
                                    rs.getInt("price"),
                                    rs.getString("image"),
                                    rs.getString("category")));           
            }
            return list;
            } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
