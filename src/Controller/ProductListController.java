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

@WebServlet("/ProductListController")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		
		/*
		 * String name = request.getParameter("name"); String idStr =
		 * request.getParameter("id"); int id = Integer.parseInt(idStr);
		 */
		String idStr = request.getParameter("id"); 
		int id = Integer.parseInt(idStr);
		String pageStr = request.getParameter("page");
		int page = Integer.parseInt(pageStr);
		
		List<Category_Prod> listCateProd = Category_ProdDAO.listCategory_Prod(conn);
		List<Author> listAuthor = AuthorDAO.listAuthor(conn);
		int numberProd = 6;
		int pos = (page - 1)*numberProd;
		
		List<Product> listProd_Category = ProductDAO.listProduct_CategoryProd_Page(conn, id, numberProd, pos);
		
		int n = ProductDAO.countProduct_CategoryProd(conn, id);
		int numberPage = 0;
		if ( n % numberProd == 0) numberPage = n/numberProd; else numberPage = n/numberProd + 1;
		
		request.setAttribute("id_categoryprod", id);
		request.setAttribute("page", numberPage);
		request.setAttribute("listProd_Category",listProd_Category);
		request.setAttribute("listCateProd", listCateProd);
		/* request.setAttribute("listAuthor", listAuthor); */
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Client/productList.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
