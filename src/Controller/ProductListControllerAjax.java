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

import BEAN.Author;
import BEAN.Category_Prod;
import BEAN.Product;
import DAO.AuthorDAO;
import DAO.Category_ProdDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/ProductListControllerAjax")
public class ProductListControllerAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListControllerAjax() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		
		/*
		 * String name = request.getParameter("name"); String idStr =
		 * request.getParameter("id"); int id = Integer.parseInt(idStr);
		 */
		String idStr = request.getParameter("id"); 
		String pageStr = request.getParameter("page");
		
		int id = Integer.parseInt(idStr);
		int page = Integer.parseInt(pageStr);
		
		int numberProd = 6;
		
		int pos = numberProd*(page- 1);
		
		List<Product> listProd_Category = ProductDAO.listProduct_CategoryProd_Page(conn, id, numberProd, pos);
	
		request.setAttribute("listProd_Category",listProd_Category);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/productListAjax.jsp");
		rd.forward(request, response);
	}

}
