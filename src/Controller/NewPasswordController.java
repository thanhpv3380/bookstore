package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MD5Library;
import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/NewPasswordController")
public class NewPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewPasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/newPassword.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
	
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		int id = (int) session.getAttribute("id_user");
		boolean check = UserDAO.updatePassword(conn, id, MD5Library.md5(password));
		
		if (check) {
			response.sendRedirect("LoginController");
		}
	}

}
