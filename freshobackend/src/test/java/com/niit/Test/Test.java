package com.niit.Test;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.dao.BillingaddressDAO;
import com.niit.dao.CartDAO;
import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.RoleDAO;
import com.niit.dao.ShippingaddressDAO;
import com.niit.dao.SupplierDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Billingaddress;
import com.niit.model.Cart;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Role;
import com.niit.model.Shippingaddress;
import com.niit.model.Supplier;
import com.niit.model.User;

public class Test {

	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit.*");
		context.refresh();

		CategoryDAO categoryDAO = (CategoryDAO) context.getBean("CategoryDAO");
		UserDAO UserDao = (UserDAO) context.getBean("UserDAO");
		ProductDAO ProductDao = (ProductDAO) context.getBean("ProductDAO");
		BillingaddressDAO BillingaddressDao = (BillingaddressDAO) context.getBean("BillingaddressDAO");
		CartDAO CartDao = (CartDAO) context.getBean("CartDAO");
		SupplierDAO SupplierDao = (SupplierDAO) context.getBean("SupplierDAO");
		ShippingaddressDAO ShippingaddressDao = (ShippingaddressDAO) context.getBean("ShippingaddressDAO");
		RoleDAO RoleDao = (RoleDAO) context.getBean("RoleDAO");
		
		Category category = (Category) context.getBean("category");
		User user = (User) context.getBean("user");
		Product product = (Product) context.getBean("product");
		Billingaddress billingaddress = (Billingaddress) context.getBean("billingaddress");
		Cart cart = (Cart) context.getBean("cart");
		Supplier supplier = (Supplier) context.getBean("supplier");
		Shippingaddress shippingaddress = (Shippingaddress) context.getBean("shippingaddress");
		Role role = (Role) context.getBean("role");
		
		
		category.setCategoryName("Watches");
		
		categoryDAO.saveOrUpdate(category);
		
		
		user.setUserName("skfr");
		user.setEmailId("jhvd@gmail.com");
		user.setPassword("jfkd");
		
		user.setContactNumber("98765");
		user.setAddress("s12,sejkajdh");
		user.setZipcode(75426);

		role.setUserName("kjgdffd");
		role.setEmailId("hgfshdghj");
		role.setContactNumber("6567");
		
		user.setRole(role);
		role.setUser(user);
		
		UserDao.saveOrUpdate(user);
		RoleDao.saveOrUpdate(role);
		
		
		product.setProductName("fdknmfg");
		ProductDao.saveOrUpdate(product);
		
		billingaddress.setAddress("hfdjdufuinv");
		billingaddress.setContactNumber("897465");
		BillingaddressDao.saveOrUpdate(billingaddress);
		
		
		cart.setProductName("dfhjj");
		CartDao.saveOrUpdate(cart);
		
		
		supplier.setSupplierName("hddsjk");
		supplier.setContactNumber(87968764);
		SupplierDao.saveOrUpdate(supplier);
		
		
		shippingaddress.setAddress("fdgfs");
		shippingaddress.setUserName("jkfgjd");
		ShippingaddressDao.saveOrUpdate(shippingaddress);

	}

}
