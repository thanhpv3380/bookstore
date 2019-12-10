package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import BEAN.Author;
import BEAN.Category_Prod;
import BEAN.Product;
import BEAN.Publisher;
import DAO.AuthorDAO;
import DAO.Category_ProdDAO;
import DAO.ProductDAO;
import DAO.PublisherDAO;
import DB.DBConnection;

@WebServlet("/EditProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "uploadDir";

	public EditProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = DBConnection.CreateConnection();

		String idStr = request.getParameter("idProd");
		int id = Integer.parseInt(idStr);

		List<Author> listAuthor = AuthorDAO.listAuthor(conn);
		List<Publisher> listPublisher = PublisherDAO.listPublisher(conn);
		List<Category_Prod> listCateProd = Category_ProdDAO.listCategory_Prod(conn);

		Product prod = ProductDAO.getProduct_id(conn, id);

		request.setAttribute("listAuthor", listAuthor);
		request.setAttribute("listPublisher", listPublisher);
		request.setAttribute("listCateProd", listCateProd);
		request.setAttribute("prod", prod);

		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/editProduct.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		Connection conn = DBConnection.CreateConnection();
		Product prod = new Product();
		
		String idProd= request.getParameter("idProd");
		String name = request.getParameter("name");
		String priceStr = request.getParameter("price");
		String detail = request.getParameter("detail");
		String amountStr = request.getParameter("amount");
		String weightStr = request.getParameter("weight");
		String dimension = request.getParameter("dimension");
		String img = request.getParameter("img");
		String yearStr = request.getParameter("year");
		float price = Float.parseFloat(priceStr);
		int amount = Integer.parseInt(amountStr);
		int weight = Integer.parseInt(weightStr);
		int year = Integer.parseInt(yearStr);
		
		String author = request.getParameter("author");
		String categoryprod = request.getParameter("categoryprod");
		String publisher = request.getParameter("publisher");

		int id_product= Integer.parseInt(idProd);
		int id_author = Integer.parseInt(author);
		int id_publisher = Integer.parseInt(publisher);
		int id_categoryprod = Integer.parseInt(categoryprod);

		prod.setId_product(id_product);
		prod.setName(name);
		prod.setPrice(price);
		prod.setAmount(amount);
		prod.setDetail(detail);
		prod.setWeight(weight);
		prod.setId_author(id_author);
		prod.setId_categoryprod(id_categoryprod);
		prod.setId_publisher(id_publisher);
		prod.setDimension(dimension);
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

			// Danh mục các phần đã upload lên (Có thể là nhiều file).
			Part part = request.getPart("image");
			String fileName = extractFileName(part);
		
			if (fileName != null && fileName.length() > 0) {
				String filePath = fullSavePath + File.separator + fileName;
				// Ghi vào file.
				part.write(filePath);
			} else {
				fileName = img; 
			}
			prod.setImg(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		boolean check = ProductDAO.updateProduct(conn, prod);
		if (check) response.sendRedirect("ProductController");
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
