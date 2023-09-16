package com.cart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.cart.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public int SaveCategory(Category cat) {
		
		Session session=factory.openSession();
		Transaction tx=session.beginTransaction();
		//save into database
		int catId=(int)session.save(cat);
		tx.commit();
		session.close();
		return catId;
	}
	
	public List<Category> getCategory(){
		Session session=factory.openSession();
		Query q = session.createQuery("from Category");
		List<Category> list = q.list();
		session.close();
		return list;
	}
	
	public Category getCategoryById(int cid) {
		Category cat=null;
		Session session=factory.openSession();
		cat = session.get(Category.class, cid);
		session.close();
		return cat;
	}
}
