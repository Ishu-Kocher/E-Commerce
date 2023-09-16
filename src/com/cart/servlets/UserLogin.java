package com.cart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.dao.UserDao;
import com.cart.entities.User;
import com.factory.helper.FactoryProvider;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLogin() {
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
			
			PrintWriter out = response.getWriter();

			String userEmail = request.getParameter("useremail");
			String userPass = request.getParameter("userpass");

			// Authenticating User
			UserDao userdao = new UserDao(FactoryProvider.getFactory());
			User user = userdao.getUserByEmailAndPassword(userEmail, userPass);
			
			HttpSession httpsession = request.getSession();
			
			if(user==null) {
				httpsession.setAttribute("message", "Invalid Login Details !! Try with another one");
				response.sendRedirect("login.jsp");
				return;
			}else {
				httpsession.setAttribute("current-user", user);
				// admin login
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				}
				// normal login
				else if(user.getUserType().equals("normal")) {
					response.sendRedirect("normal-user.jsp");
				}else {
					httpsession.setAttribute("message", "We have not identified user");
					response.sendRedirect("login.jsp");
					return;
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
