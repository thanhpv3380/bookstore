package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/RegisterAjaxController")
public class RegisterAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		
		String username = request.getParameter("username");
		
		int id_user = UserDAO.checkUsername(conn, username);
		if (id_user > 0) request.setAttribute("msg", "true");
		else request.setAttribute("msg", "false");
	
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/registerAjax.jsp");
		rd.forward(request, response);
		
	}

}
