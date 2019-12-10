package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.Users;
import DAO.EmailUtility;
import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/TypeUsernameController")
public class TypeUsernameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}     
    public TypeUsernameController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/typeUsername.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.CreateConnection();
		Random random = new Random();
		String username = request.getParameter("username");
		
		int id_user = UserDAO.checkUsername(conn, username);
		if (id_user > 0) {
			Users users = UserDAO.getUsers_Id(conn, id_user);
			int code = 100000 + random.nextInt(899999);
			
			HttpSession session = request.getSession();
			session.setAttribute("code", code);
			session.setAttribute("id_user", id_user);
			String resultMessage = "";
			String recipient = users.getEmail();
			String subject = "Forgot Password";
			String content = "Your code is: "+code;

			try {
				EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
						content);
				resultMessage = "The e-mail was sent successfully";
			} catch (Exception ex) {
				ex.printStackTrace();
				resultMessage = "There were an error: " + ex.getMessage();
			}
			response.sendRedirect("ForgotPassController");
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/View/Client/typeUsername.jsp");
			rd.forward(request, response);
		}
		
	}

}
