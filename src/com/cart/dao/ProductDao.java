package com.cart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.cart.entities.Product;

public class ProductDao {

	private SessionFactory factory;
	
	// constructor
	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// save product's
	public int SaveProduct(Product product) {

		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		// save into database
		int pId = (int) session.save(product);
		tx.commit();
		session.close();
		return pId;
	}

	// get all products
	public List<Product> getAllProducts() {
		Session session = factory.openSession();
		Query q = session.createQuery("from Product");
		List<Product> list = q.list();
		session.close();
		return list;
	}

	// get all products by id
	public List<Product> getAllProductsById(int cid) {
		Session session = factory.openSession();
		Query q = session.createQuery("from Product as p where p.category.categoryId =: id");
		q.setParameter("id", cid);
		List<Product> list = q.list();
		session.close();
		return list;
	}

}
