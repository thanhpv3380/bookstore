package Controller;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Users;
import DAO.CartDAO;
import DAO.MD5Library;
import DAO.UserDAO;
import DB.DBConnection;


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		Connection conn = DBConnection.CreateConnection();
		Users users = new Users();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email =  request.getParameter("email");
		String address = request.getParameter("address");
		String dobStr = request.getParameter("dob");
		String phone = request.getParameter("phone");
		
		
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dob;
		try {
			dob = (java.util.Date) formater.parse(dobStr);
			users.setDob(dob);
			System.out.println(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		users.setUserName(username);
		users.setPassWord(MD5Library.md5(password));
		users.setEmail(email);
		users.setAddress(address);
		users.setPhone(phone);
		users.setRole(2);	
		
		boolean check = UserDAO.addUsers(conn, users);
		
		if (check) {
			int id_user = UserDAO.checkUsername(conn, username);
			boolean check1 = CartDAO.addUserToCart(conn, id_user);
			response.sendRedirect("LoginController");
		}
	}
}
