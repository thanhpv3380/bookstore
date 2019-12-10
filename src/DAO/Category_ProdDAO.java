package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Category_Prod;


public class Category_ProdDAO {
	public static List<Category_Prod> listCategory_Prod(Connection conn) {
		List<Category_Prod> list = new ArrayList<Category_Prod>();
		PreparedStatement ptmt = null;
		String sql = "select * from category_prod";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Category_Prod cateProd = new Category_Prod();
				cateProd.setId_categoryprod(rs.getInt("id_categoryprod"));
				cateProd.setName(rs.getString("name_category"));
				list.add(cateProd);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean addCategory_Prod(Connection conn, String name) {
		PreparedStatement ptmt = null;
		String sql = "insert into category_prod(name_category) values(?)";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, name);
			int temp = ptmt.executeUpdate();
			ptmt.close();
            return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}	
	public static Category_Prod getCategoryPrid_Id(Connection conn, int id) {
		Category_Prod cateProd = new Category_Prod();
		PreparedStatement ptmt = null;
		String sql = "select * from category_prod where id_categoryprod = "+id;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				cateProd.setId_categoryprod(id);
				cateProd.setName(rs.getString("name_category"));
			}
			
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("failed");
		}
		return cateProd;
	}
	public static boolean updateCategory_Prod(Connection conn, Category_Prod cateProd) {
		PreparedStatement ptmt = null;
		String sql = "update category_prod set name_category = ? where id_categoryprod = "+ cateProd.getId_categoryprod();
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, cateProd.getName());
			int temp = ptmt.executeUpdate();
			ptmt.close();
            return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}	
}
