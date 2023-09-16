package com.cart.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Order extends Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ordId;
	private String userEmail;
	private String ordName;
	private String ordPhone;
	private String ordAddress;
	
	private int pId;
	private int pQuantity;

	
	//@OneToMany(mappedBy = "order")
	//private List<Product> products;
	
	//@ManyToOne
	//private User user;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int pId, String pname, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category, int ordId, String userEmail, String ordName, String ordPhone, String ordAddress) {
		super(pId, pname, pDesc, pPhoto, pPrice, pDiscount, pQuantity, category);
		this.ordId = ordId;
		this.userEmail = userEmail;
		this.ordName = ordName;
		this.ordPhone = ordPhone;
		this.ordAddress = ordAddress;
	}

	public Order(int pId, String pname, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,
			Category category, String userEmail, String ordName, String ordPhone, String ordAddress) {
		super(pId, pname, pDesc, pPhoto, pPrice, pDiscount, pQuantity, category);
		this.userEmail = userEmail;
		this.ordName = ordName;
		this.ordPhone = ordPhone;
		this.ordAddress = ordAddress;
	}

	public int getOrdId() {
		return ordId;
	}

	public void setOrdId(int ordId) {
		this.ordId = ordId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getOrdName() {
		return ordName;
	}

	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}

	public String getOrdPhone() {
		return ordPhone;
	}

	public void setOrdPhone(String ordPhone) {
		this.ordPhone = ordPhone;
	}

	public String getOrdAddress() {
		return ordAddress;
	}

	public void setOrdAddress(String ordAddress) {
		this.ordAddress = ordAddress;
	}

}
