package DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import BEAN.Product;

public class ProductDAO {
	public static List<Product> listProduct(Connection conn) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ptmt = null;
		String sql = "select * from product inner join author on author.id_author = product.id_author "
				+ "inner join category_prod on category_prod.id_categoryprod = product.id_categoryprod "
				+ "inner join publisher on publisher.id_publisher = product.id_publisher";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();

				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));
				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setAuthor(rs.getString("name_author"));
				prod.setYear(rs.getInt("year"));
				prod.setPublisher(rs.getString("name_publisher"));
				prod.setCategoryprod(rs.getString("name_category"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_publisher(rs.getInt("id_publisher"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));

				list.add(prod);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static List<Product> listProduct_CategoryProd(Connection conn, int idProd, int id) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ptmt = null;
		String sql = "select * from product inner join author on author.id_author = product.id_author "
				+ "inner join category_prod on category_prod.id_categoryprod = product.id_categoryprod "
				+ "inner join publisher on publisher.id_publisher = product.id_publisher where product.id_categoryprod="
				+ id + " and product.id_product !=" + idProd;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();

				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));
				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setAuthor(rs.getString("name_author"));
				prod.setYear(rs.getInt("year"));
				prod.setPublisher(rs.getString("name_publisher"));
				prod.setCategoryprod(rs.getString("name_category"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_publisher(rs.getInt("id_publisher"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));

				list.add(prod);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static List<Product> listProduct_CategoryProd_Page(Connection conn, int id, int numberProd, int pos) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ptmt = null;
		String sql = "select * from product where id_categoryprod =" + id + " limit " + pos + "," + numberProd;

		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();
				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));
				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setYear(rs.getInt("year"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_publisher(rs.getInt("id_publisher"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));

				list.add(prod);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static int countProduct_CategoryProd(Connection conn, int id) {
		int count = 0;
		PreparedStatement ptmt = null;
		String sql = "select count(*) from product where id_categoryprod =" + id;

		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
	            count = rs.getInt(1);
	        }
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public static List<Product> listProduct_Year(Connection conn) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ptmt = null;
		String sql = "select * from product inner join author on author.id_author = product.id_author "
				+ "inner join category_prod on category_prod.id_categoryprod = product.id_categoryprod "
				+ "inner join publisher on publisher.id_publisher = product.id_publisher where year=year(now())";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();

				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));
				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setAuthor(rs.getString("name_author"));
				prod.setYear(rs.getInt("year"));
				prod.setPublisher(rs.getString("name_publisher"));
				prod.setCategoryprod(rs.getString("name_category"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_publisher(rs.getInt("id_publisher"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));

				list.add(prod);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static List<Product> listProduct_Amount(Connection conn) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ptmt = null;
		String sql = "select * from product inner join author on author.id_author = product.id_author "
				+ "inner join category_prod on category_prod.id_categoryprod = product.id_categoryprod "
				+ "inner join publisher on publisher.id_publisher = product.id_publisher where product.amount > 20";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();

				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));
				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setAuthor(rs.getString("name_author"));
				prod.setYear(rs.getInt("year"));
				prod.setPublisher(rs.getString("name_publisher"));
				prod.setCategoryprod(rs.getString("name_category"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_publisher(rs.getInt("id_publisher"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));

				list.add(prod);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static void addProduct(Connection conn, Product prod) {
		PreparedStatement ptmt = null;

		String sql = "insert into product(name, img, price, detail, amount, dimension, weight, id_author,"
				+ "id_publisher, id_categoryprod, year) values(?,?,?,?,?,?,?,?,?,?,?) ";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, prod.getName());
			ptmt.setString(2, prod.getImg());
			ptmt.setFloat(3, prod.getPrice());
			ptmt.setString(4, prod.getDetail());
			ptmt.setInt(5, prod.getAmount());
			ptmt.setString(6, prod.getDimension());
			ptmt.setInt(7, prod.getWeight());
			ptmt.setInt(8, prod.getId_author());
			ptmt.setInt(9, prod.getId_publisher());
			ptmt.setInt(10, prod.getId_categoryprod());
			ptmt.setInt(11, prod.getYear());
			int row = ptmt.executeUpdate();
			ptmt.close();
			if (row > 0) {
				System.out.print("add success");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("add not success");
		}
	}

	public static Product getProduct_id(Connection conn, int id) {
		Product prod = new Product();
		PreparedStatement ptmt = null;
		String sql = "select * from product, publisher, author, category_prod where "
				+ "product.id_author = author.id_author and product.id_publisher = publisher.id_publisher "
				+ "and product.id_categoryprod = category_prod.id_categoryprod and id_product=" + id;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));

				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setAuthor(rs.getString("name_author"));
				prod.setCategoryprod(rs.getString("name_category"));
				prod.setPublisher(rs.getString("name_publisher"));
				prod.setYear(rs.getInt("year"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));
				prod.setId_publisher(rs.getInt("id_publisher"));
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prod;
	}

	public static boolean updateProduct(Connection conn, Product prod) {
		PreparedStatement ptmt = null;

		String sql = "update product set name = ?, img = ?, price = ?, detail = ?, amount = ?, "
				+ "dimension = ?, weight = ? , id_author= ?, id_publisher = ?, id_categoryprod = ?, year = ? "
				+ "where id_product=" + prod.getId_product();
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, prod.getName());
			ptmt.setString(2, prod.getImg());
			ptmt.setFloat(3, prod.getPrice());
			ptmt.setString(4, prod.getDetail());
			ptmt.setInt(5, prod.getAmount());
			ptmt.setString(6, prod.getDimension());
			ptmt.setInt(7, prod.getWeight());
			ptmt.setInt(8, prod.getId_author());
			ptmt.setInt(9, prod.getId_publisher());
			ptmt.setInt(10, prod.getId_categoryprod());
			ptmt.setInt(11, prod.getYear());
			int row = ptmt.executeUpdate();
			ptmt.close();
			if (row > 0) {
				System.out.print("add success");
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			System.out.print("add not success");
		}
		return false;
	}

	public static List<Product> listProduct_Search(Connection conn, String name) {
		List<Product> list = new ArrayList<Product>();
		PreparedStatement ptmt = null;
		String sql = "select * from product inner join author on author.id_author = product.id_author "
				+ "inner join category_prod on category_prod.id_categoryprod = product.id_categoryprod "
				+ "inner join publisher on publisher.id_publisher = product.id_publisher where product.name like '%"
				+ name + "%'";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Product prod = new Product();

				prod.setId_product(rs.getInt("id_product"));
				prod.setName(rs.getString("name"));
				prod.setImg(rs.getString("img"));
				prod.setPrice(rs.getFloat("price"));
				prod.setDetail(rs.getString("detail"));
				prod.setAmount(rs.getInt("amount"));
				prod.setDimension(rs.getString("dimension"));
				prod.setWeight(rs.getInt("weight"));
				prod.setAuthor(rs.getString("name_author"));
				prod.setYear(rs.getInt("year"));
				prod.setPublisher(rs.getString("name_publisher"));
				prod.setCategoryprod(rs.getString("name_category"));
				prod.setId_author(rs.getInt("id_author"));
				prod.setId_publisher(rs.getInt("id_publisher"));
				prod.setId_categoryprod(rs.getInt("id_categoryprod"));

				list.add(prod);
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
