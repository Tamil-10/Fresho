package com.niit.dao;

import java.util.List;

import com.niit.model.User;

public interface UserDAO {
	
	public List<User> list();
	
	public User getByUserId(int userid);
	
	public User getByUserName(String username);		
	
	public User getByEmailId(String email);
	
   public User getByPassword(String password);
    
    public User getByContactNumber(String contact);
    
    public User getByAddress(String address);
    
    public User getByRole(String role);
	
	public boolean isAllReadyRegister(String email, boolean b);
	
	public void saveOrUpdate(User user);
		
	public void delete(int UserId);
}
