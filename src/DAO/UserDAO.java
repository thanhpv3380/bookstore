package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Users;

public class UserDAO {
	public static List<Users> listUsers(Connection conn) {
		List<Users> list = new ArrayList<Users>();
		PreparedStatement ptmt = null;
		String sql = "select * from users";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setId(rs.getInt("id_user"));
				users.setUserName(rs.getString("username"));
				users.setPassWord(rs.getString("password"));
				users.setDob(rs.getDate("dob"));
				users.setAddress(rs.getString("address"));
				users.setPhone(rs.getString("phone"));
				users.setRole(rs.getInt("role"));
				list.add(users);

			}
			ptmt.close();
			rs.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public static boolean addUsers(Connection conn, Users users) {
		PreparedStatement ptmt = null;
		String sql = "insert into users(username, password, email, dob, address, phone, role) values(?,?,?,?,?,?,?)";
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, users.getUserName());
			ptmt.setString(2, users.getPassWord());
			ptmt.setString(3, users.getEmail());
			ptmt.setDate(4, new java.sql.Date((users.getDob()).getTime()));
			ptmt.setString(5, users.getAddress());
			ptmt.setString(6,users.getPhone());
			ptmt.setInt(7,users.getRole());
			int temp = ptmt.executeUpdate();
			ptmt.close();
			return temp == 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	public static Users checkUsers(Connection conn, Users users) {
		PreparedStatement ptmt = null;
		String tmp1= users.getUserName();
		String tmp2 = users.getPassWord();
		Users user = new Users();
		
		String sql = "select * from bookstore.users where username = '" + tmp1 + "'and password ='" + tmp2 + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				user.setId(rs.getInt("id_user"));
				user.setUserName(rs.getString("username"));
				user.setPassWord(rs.getString("password"));
				user.setDob(rs.getDate("dob"));
				user.setAddress(rs.getString("address"));
				user.setPhone(rs.getString("phone"));
				user.setRole(rs.getInt("role"));
			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public static int checkUsername(Connection conn, String username) {
		PreparedStatement ptmt = null;
		int id_user = 0;
		String sql = "select * from bookstore.users where username = '" + username + "'";
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				id_user = rs.getInt("id_user");
			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id_user;
	}
	public static Users getUsers_Id(Connection conn, int id) {
		PreparedStatement ptmt = null;
		Users user = new Users();
		
		String sql = "select * from bookstore.users where id_user="+id;
		try {
			ptmt = conn.prepareStatement(sql);
			ResultSet rs = ptmt.executeQuery();
			while (rs.next()) {
				user.setEmail(rs.getString("email"));
			}
			ptmt.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public static boolean updatePassword(Connection conn, int id, String password) {
		PreparedStatement ptmt = null;
		String sql = "update users set password = ? where id_user = "+id;
		try {
			ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, password);
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
