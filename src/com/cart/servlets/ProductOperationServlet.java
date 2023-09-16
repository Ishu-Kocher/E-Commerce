package com.cart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.cart.dao.CategoryDao;
import com.cart.dao.ProductDao;
import com.cart.entities.Category;
import com.cart.entities.Product;
import com.factory.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String op = request.getParameter("operation");

			if (op.trim().equals("addCategory")) {
				// add category
				String title = request.getParameter("catTitle");
				String desc = request.getParameter("catDesc");

				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(desc);

				CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = catDao.SaveCategory(category);
				if (catId != 0) {
					HttpSession httpsession = request.getSession();
					httpsession.setAttribute("message", "Category added successfully !!");
					response.sendRedirect("admin.jsp");
					return;
				}
			} else if (op.trim().equals("addProduct")) {
				// add product
				String title = request.getParameter("pTitle");
				String desc = request.getParameter("pDesc");
				int price = Integer.parseInt(request.getParameter("pPrice"));
				int discount = Integer.parseInt(request.getParameter("pdiscount"));
				int quantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catID = Integer.parseInt(request.getParameter("pCat"));
				Part part = request.getPart("pPic");

				// create object product
				Product p = new Product();
				p.setPname(title);
				p.setpDesc(desc);
				p.setpPrice(price);
				p.setpDiscount(discount);
				p.setpQuantity(quantity);
				p.setpPhoto(part.getSubmittedFileName());

				// create object CategoryDao
				
				CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
				Category category = catDao.getCategoryById(catID);
				
				p.setCategory(category);
				
				ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
				int pId = pDao.SaveProduct(p);
				
				
				// Get Path
				String path = "D:\\EclipseJee2020-09\\E-commerce Project\\WebContent\\ProductsImg" + File.separator + part.getSubmittedFileName();
				try {
				// Upload image
				FileOutputStream fos = new 	FileOutputStream(path);
				
				InputStream is = part.getInputStream();
				
				//reading data
				byte []data = new byte[is.available()];
				is.read(data);
				
				//writing data
				fos.write(data);
				fos.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				if (pId != 0) {
					HttpSession httpsession = request.getSession();
					httpsession.setAttribute("message", "Product added successfully !!");
					response.sendRedirect("admin.jsp");
					return;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
