package Controller;

import java.io.File;

import java.io.IOException;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import BEAN.Author;
import BEAN.Category_Prod;
import BEAN.Product;
import BEAN.Publisher;
import DAO.AuthorDAO;
import DAO.Category_ProdDAO;
import DAO.ProductDAO;
import DAO.PublisherDAO;
import DB.DBConnection;

@WebServlet("/AddProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class AddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "uploadDir";

	public AddProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		Connection conn = DBConnection.CreateConnection();
		List<Author> listAuthor = AuthorDAO.listAuthor(conn);
		List<Publisher> listPublisher = PublisherDAO.listPublisher(conn);
		List<Category_Prod> listCategoryProd = Category_ProdDAO.listCategory_Prod(conn);

		request.setAttribute("listAuthor", listAuthor);
		request.setAttribute("listPublisher", listPublisher);
		request.setAttribute("listCategoryProd", listCategoryProd);

		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/addProduct.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Connection conn = DBConnection.CreateConnection();
		Product prod = new Product();

		String name = request.getParameter("name");
		System.out.println(name);
		String priceStr = request.getParameter("price");
		String detail = request.getParameter("detail");
		String amountStr = request.getParameter("amount");
		String weightStr = request.getParameter("weight");
		String dimension = request.getParameter("dimension");
		String yearStr = request.getParameter("year");
		float price = Float.parseFloat(priceStr);
		int amount = Integer.parseInt(amountStr);
		int weight = Integer.parseInt(weightStr);
		int year = Integer.parseInt(yearStr);
		String author = request.getParameter("author");
		String categoryprod = request.getParameter("categoryprod");
		String publisher = request.getParameter("publisher");
		
		int id_author = Integer.parseInt(author);
		int id_publisher = Integer.parseInt(publisher);
		int id_categoryprod = Integer.parseInt(categoryprod);
		
		prod.setName(name);
		prod.setPrice(price);
		prod.setAmount(amount);
		prod.setDimension(dimension);
		prod.setDetail(detail);
		prod.setWeight(weight);
		prod.setId_author(id_author);
		prod.setId_categoryprod(id_categoryprod);
		prod.setId_publisher(id_publisher);
		prod.setYear(year);
		try {  
			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = request.getServletContext().getRealPath("");
			appPath = appPath.replace('\\', '/');
	 
	  
	        // Thư mục để save file tải lên.
			String fullSavePath = null;
			if (appPath.endsWith("/")) {
	           fullSavePath = appPath + SAVE_DIRECTORY;
			} else {
	    	   fullSavePath = appPath + "/" + SAVE_DIRECTORY;
	        }
	 
	  
		   // Tạo thư mục nếu nó không tồn tại.
		   File fileSaveDir = new File(fullSavePath);
		   if (!fileSaveDir.exists()) {
		       fileSaveDir.mkdir();
		   }
	  
	       Part part = request.getPart("image");
	       String fileName = extractFileName(part);
	       System.out.println(fileName);
	       prod.setImg(fileName);
	       if (fileName != null && fileName.length() > 0) {
	    	   String filePath = fullSavePath + File.separator + fileName;
	           System.out.println("Write attachment to file: " + filePath);
	           // Ghi vào file.
               part.write(filePath);
	       }
		} catch (Exception e) {
	       e.printStackTrace();
	   	}
		ProductDAO.addProduct(conn,prod);
		response.sendRedirect("ProductController");
	}
	private String extractFileName(Part part) {
	    // form-data; name="file"; filename="C:\file1.zip"
	    // form-data; name="file"; filename="C:\Note\file2.zip"
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	    	if (s.trim().startsWith("filename")) {
	    		// C:\file1.zip
	    		// C:\Note\file2.zip
	    		String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
	    		clientFileName = clientFileName.replace("\\", "/");
	    		int i = clientFileName.lastIndexOf('/');
	    		// file1.zip
	    		// file2.zip
	    		return clientFileName.substring(i + 1);
	       }
	    }
	    return null;
	}
}
