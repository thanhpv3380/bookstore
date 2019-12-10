package DB;
import java.sql.*;
public class DBConnection {
	public static Connection CreateConnection() {
		Connection conn =  null;
		String url = "jdbc:mysql://localhost:3306/bookstore?useUnicode=true&characterEncoding=UTF-8";
		String username = "root";
		String password =  "9999";
		 
		try {
			//load Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			// creare connection
			conn =  DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return conn;
	}
}
