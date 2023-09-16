package com.cart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cart.dao.UserDao;
import com.cart.entities.User;
import com.factory.helper.FactoryProvider;

/**
 * Servlet implementation class UserRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegister() {
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
	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String user_name = request.getParameter("username");
			String user_email = request.getParameter("useremail");
			String user_pass = request.getParameter("userpass");
			String user_ph = request.getParameter("userph");
			String user_add = request.getParameter("useradd");

			// Authenticating User Email
			UserDao userdao = new UserDao(FactoryProvider.getFactory());
			User u = userdao.getUserByEmail(user_email);
			
			if(u != null) {
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("message", "User Email Already Register !! Try with another one");
				response.sendRedirect("register.jsp");
				return;
			}else{

			// Create User Object
			User user = new User(user_name, user_email, user_pass, user_ph, "default.png", user_add, "normal");

			// Open Session
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();

			// Save Object
			session.save(user);

			tx.commit();
			session.close();

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Registration Successfully !!");
			response.sendRedirect("register.jsp");
			return;
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
