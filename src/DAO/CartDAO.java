package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Cart;
import BEAN.Category_Prod;
import BEAN.Product;

public class CartDAO {
	public static int addProdToCart(Connection conn, int id_user) {
		PreparedStatement ptmt = null;
		String sql = "select * from cart where id_user="+id_user;
		int id_cart = 0;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				id_cart = rs.getInt("id_cart");
			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return id_cart;
	}	
	public static boolean addProdToCartProd(Connection conn, int id_product, int id_cart) {
		PreparedStatement ptmt = null;
		String sql = "select * from cartprod where id_cart="+id_cart+" and id_product="+id_product;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				return true;
			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}	
	public static boolean updateProductInCart(Connection conn, int id_cart, int id_product) {
		PreparedStatement ptmt = null;
		String sql = "update cartprod set number = number+1 where id_cart="+id_cart+" and id_product="+id_product;
		try {
			ptmt = conn.prepareStatement(sql);
			int temp = ptmt.executeUpdate();
			ptmt.close();
            return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static boolean addProductInCart(Connection conn, int id_cart, int id_product) {
		PreparedStatement ptmt = null;
		String sql = "insert into cartprod(id_cart, id_product, number) values (?,?,1)";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id_cart);
			ptmt.setInt(2, id_product);
			int temp = ptmt.executeUpdate();
			ptmt.close();
            return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static boolean addUserToCart(Connection conn, int id_user) {
		PreparedStatement ptmt = null;
		String sql = "insert into cart(id_user) values (?)";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, id_user);
			int temp = ptmt.executeUpdate();
			ptmt.close();
            return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static List<Cart> listCart(Connection conn, int id_cart){
		PreparedStatement ptmt = null;
		List<Cart> list = new ArrayList<Cart>();
		String sql = "select product.id_product, product.name, product.img, product.price, product.detail, product.dimension, "
				+ "product.weight, product.year, product.id_author, product.id_publisher, "
				+ "product.id_categoryprod, cartprod.number as amountProduct from cartprod, product " 
				+"where cartprod.id_product = product.id_product and id_cart ="+id_cart;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart();
				cart.setId_product(rs.getInt("id_product"));
				cart.setName(rs.getString("name"));
				cart.setDimension(rs.getString("dimension"));
				cart.setPrice(rs.getFloat("price"));
				cart.setNumber(rs.getInt("amountProduct"));
				cart.setImg(rs.getString("img"));

				list.add(cart);
			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return list;
	}
}
