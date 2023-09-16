package com.cart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.cart.entities.Product;
import com.cart.entities.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {

			String query = "from User where userEmail=: e and userPassword= : p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user = (User) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public User getUserByEmail(String email) {
		User u = null;
		try {

			String query = "from User where userEmail=: e";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			u = (User) q.uniqueResult();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

	// get all users
	public List<User> getAllUsers() {
		Session session = factory.openSession();
		Query q = session.createQuery("from User");
		List<User> list = q.list();
		session.close();
		return list;
	}

}
