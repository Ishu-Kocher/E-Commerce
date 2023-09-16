package com.cart.dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.cart.entities.Order;
import com.cart.entities.Product;

public class BookProductDao {

	private SessionFactory factory;

	private Boolean flag;

	// constructor
	public BookProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public Boolean orderProducts(Order ord, ArrayList<Order> list) {
		flag = false;

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		// save into database
		int ordId = (int) session.save(ord);
		tx.commit();
		session.close();
		
		//return ordId;

		return flag;
	}

}
