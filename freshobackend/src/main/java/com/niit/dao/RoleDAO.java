package com.niit.dao;

import java.util.List;

import com.niit.model.Role;

public interface RoleDAO {
	public List<Role> list();	
	
	public Role getByUserName(String username);
	
	public Role getByEmailId(String email);
	
	public Role getByContactNumber(String contactnumber);
	
	public void saveOrUpdate(Role role);
		
    public void delete(String username);
}
