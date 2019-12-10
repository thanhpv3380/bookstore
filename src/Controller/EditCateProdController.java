package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Category_Prod;
import DAO.Category_ProdDAO;
import DB.DBConnection;

@WebServlet("/EditCateProdController")
public class EditCateProdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditCateProdController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Connection conn = DBConnection.CreateConnection();

		String idStr = request.getParameter("idCateProd");
		int id = Integer.parseInt(idStr);

		Category_Prod cateProd = Category_ProdDAO.getCategoryPrid_Id(conn, id);
		
		request.setAttribute("cateProd", cateProd);

		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/editCategoryProd.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	    request.setCharacterEncoding("UTF-8");
		
	    Connection conn = DBConnection.CreateConnection();
	    Category_Prod cateProd = new Category_Prod();
		
	    String name = request.getParameter("name");
		String idStr = request.getParameter("idCateProd");
		int id = Integer.parseInt(idStr);
		
		cateProd.setId_categoryprod(id);
		cateProd.setName(name);
		boolean check = Category_ProdDAO.updateCategory_Prod(conn, cateProd);
		
		if (check) response.sendRedirect("CategoryProdController");
	}

}
