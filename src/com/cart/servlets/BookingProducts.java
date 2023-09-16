package com.cart.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.dao.BookProductDao;
import com.cart.entities.Order;
import com.cart.entities.User;
import com.factory.helper.FactoryProvider;

/**
 * Servlet implementation class BookingProducts
 */
@WebServlet("/BookingProducts")
public class BookingProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final boolean String = false;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookingProducts() {
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
		
		PrintWriter out = response.getWriter();
		
		HttpSession httpsession = request.getSession();
		
		User user = (User) httpsession.getAttribute("current-user");
		
		ArrayList<Order> list = new ArrayList<Order>();
		Order ord = null;
		
		
		
		String ordname = request.getParameter("ordname");
		String ordph = request.getParameter("ordph");
		String ordadd = request.getParameter("ordadd");
		
		String[] ordIdArray = request.getParameterValues("ordId[]");
		String[] ordQuanArray = request.getParameterValues("ordQuan[]");

		
		out.println(user.getUserEmail());
		out.println(ordname);
		out.println(ordph);
		out.println(ordadd);
		
		ord.setUserEmail(user.getUserEmail());
		ord.setOrdName(ordname);
		ord.setOrdPhone(ordph);
		ord.setOrdAddress(ordadd);
		
		
		if(ordIdArray!=null) {
			for(int i=0;i<ordIdArray.length;i++) {
				ord = new Order();	
				ord.setpId(Integer.parseInt(ordIdArray[i]));
				ord.setpQuantity(Integer.parseInt(ordQuanArray[i]));
				list.add(ord);
			}	
		}	
		
		out.println(list);
		
		BookProductDao productBook = new BookProductDao(FactoryProvider.getFactory());
		
		//productBook.orderProducts(ord,list);
	
	}
}
