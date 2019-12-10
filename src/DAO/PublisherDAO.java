package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Author;
import BEAN.Publisher;

public class PublisherDAO {
	public static List<Publisher> listPublisher(Connection conn) {
		List<Publisher> list = new ArrayList<Publisher>();
		PreparedStatement ptmt = null;
		String sql = "select * from publisher";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Publisher publisher = new Publisher();
				publisher.setId_publisher(rs.getInt("id_publisher"));
				publisher.setName(rs.getString("name_publisher"));
				list.add(publisher);
			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean addPubliser(Connection conn, String name) {
		PreparedStatement ptmt = null;
		String sql = "insert into publisher(name_publisher) values(?)";
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
	public static Publisher getPublisher_Id(Connection conn, int id) {
		Publisher publisher = new Publisher();
		PreparedStatement ptmt = null;
		String sql = "select * from publisher where id_publisher = "+id;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			if (rs.next()) {
				publisher.setId_publisher(id);
				publisher.setName(rs.getString("name_publisher"));
			}
			
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("failed");
		}
		return publisher;
	}
	public static boolean updatePublisher(Connection conn, int id, String name) {
		PreparedStatement ptmt = null;
		String sql = "update publisher set name_publisher = ? where id_publisher = "+id;
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
