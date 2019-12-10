package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Category_ProdDAO;
import DB.DBConnection;


@WebServlet("/AddCategoryProdController")
public class AddCategoryProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AddCategoryProdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/addCategoryProd.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		
		String name = request.getParameter("name");
		boolean check = Category_ProdDAO.addCategory_Prod(conn, name);
		if (check) response.sendRedirect("CategoryProdController");
		else System.out.print("error");
	}

}
