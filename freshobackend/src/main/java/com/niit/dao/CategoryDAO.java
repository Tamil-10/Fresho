package com.niit.dao;

import java.util.List;

import com.niit.model.Category;
public interface CategoryDAO {
	
	
	public List<Category> list();
	
	public Category getByCategoryId(int categoryid);
	
	public Category getByCategoryName(String categoryname);
	
	public void saveOrUpdate(Category category);
	
	public void delete(int category_id);
}
