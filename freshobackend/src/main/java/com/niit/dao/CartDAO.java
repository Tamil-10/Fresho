package com.niit.dao;

import java.util.List;

import com.niit.model.Cart;

public interface CartDAO {

	public List<Cart> list();
	
	
	
	public Cart getByItemId(int itemId);

	public Cart getByCartId(int cartid);

	public Cart getByProductId(int productid);		

	public  List<Cart> getByEmailId(String email);
	
	public List<Cart> getCartItems(String username);
	
	public void deleteCartItem(Cart cart);

	public Cart getByProductName(String productname);	

	public void saveOrUpdate(Cart cart);
		
	public void delete(int cartId);

	public Long getTotalAmount(int id);

	public boolean itemAlreadyExist(String username, int productId);

	public Cart getByUserandProduct(String emailId, int productId);

	public void updateshipping(String emailId, int shippingId);
	
	public List<Cart> getDispatchItems(String username);
	
	public List<Cart> getAllItems();
	
	public void save(Cart cart);
	
	public boolean getByUserName(String username);
}
