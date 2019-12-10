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

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/ProductListPageAjaxController")
public class ProductListPageAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListPageAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		int n = ProductDAO.countProduct_CategoryProd(conn, id);
		int numberPage = 0;
		if ( n % numberProd == 0) numberPage = n/numberProd; else numberPage = n/numberProd + 1;
		
		request.setAttribute("id_categoryprod", id);
		request.setAttribute("page", numberPage);
		request.setAttribute("listProd_Category",listProd_Category);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/productListPageAjax.jsp");
		rd.forward(request, response);
	}

}
