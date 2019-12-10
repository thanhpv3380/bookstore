package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Author;
import BEAN.Category_Prod;

public class AuthorDAO {
	public static List<Author> listAuthor(Connection conn) {
		List<Author> list = new ArrayList<Author>();
		PreparedStatement ptmt = null;
		String sql = "select * from author";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Author author = new Author();
				author.setId_author(rs.getInt("id_author"));
				author.setName(rs.getString("name_author"));
				list.add(author);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean addAuthor(Connection conn, String name) {
		PreparedStatement ptmt = null;
		String sql = "insert into author(name_author) values(?)";
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
	public static Author getAuthor_Id(Connection conn, int id) {
		Author author = new Author();
		PreparedStatement ptmt = null;
		String sql = "select * from author where id_author = "+id;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				author.setId_author(id);
				author.setName(rs.getString("name_author"));
			}
			
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("failed");
		}
		return author;
	}
	public static boolean updateAuthor(Connection conn, int id, String name) {
		PreparedStatement ptmt = null;
		String sql = "update author set name_author = ? where id_author = "+id;
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
}
