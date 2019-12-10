package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DBConnection;


@WebServlet("/ForgotPassController")
public class ForgotPassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForgotPassController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/forgotPass.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code1Str = request.getParameter("code");
		int code1 = Integer.parseInt(code1Str);
		
		HttpSession session = request.getSession();
		int code = (int) session.getAttribute("code");
		
		if (code1 == code) {
			response.sendRedirect("NewPasswordController");
		} else {
			response.sendRedirect("ForgotPassController");
		}
	}

}
