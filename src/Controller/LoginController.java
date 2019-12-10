package Controller;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.Date;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Users;
import DAO.CartDAO;
import DAO.MD5Library;
import DAO.UserDAO;
import DB.DBConnection;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		Connection conn = DBConnection.CreateConnection();
		Users users = new Users();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//System.out.println(password);	
		
		users.setUserName(username);
		users.setPassWord(MD5Library.md5(password));
		
		Users user = UserDAO.checkUsers(conn, users);

		if (user.getRole() == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", user);
			response.sendRedirect("ProductController");
		}
		else if (user.getRole() == 2) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			int id_cart = 0;
			id_cart = CartDAO.addProdToCart(conn, user.getId());
			session.setAttribute("id_cart", id_cart);
			response.sendRedirect("TrangchuController");
		}
		else {
			response.sendRedirect("LoginController");
		}
	}

}
