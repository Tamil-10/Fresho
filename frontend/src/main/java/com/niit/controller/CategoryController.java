package com.niit.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CategoryDAO;
import com.niit.model.Category;

@Controller
public class CategoryController {
	

	@Autowired
	private CategoryDAO categoryDAO;
	/*@Autowired
	private CartDao cartDao;*/
	
	@RequestMapping("Category")
	public String NewCategory(Model model)	{
		
		model.addAttribute("AddCategoryButtonClicked", true);
		return "Category";
		
	}
	
	@RequestMapping("addCategory")
	public String addCategory(@ModelAttribute Category category, Model model){
		categoryDAO.saveOrUpdate(category);
		
		return "redirect:CategoryView";
	
	}
	@RequestMapping("CategoryView")
	public String ViewCategory(Model model){
		List<Category> categoryList = categoryDAO.list();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("ViewCategoryButtonClicked", true);
		return "Category";
	}
	@RequestMapping("DeleteCategory")
	public String deleteCategory(@RequestParam ("categoryId") int categoryId){
		
		categoryDAO.delete(categoryId);
		
		return "redirect:CategoryView";
					
	}
	@RequestMapping("EditCategory")
	public String editCategory(@RequestParam ("categoryId") int categoryId, Model model){
		Category category = categoryDAO.getByCategoryId(categoryId);
		model.addAttribute("category", category);
		model.addAttribute("EditCategoryClicked", true);
		return "Category";
		
	}
	@RequestMapping("categoryEdit")
	public String categoryEdited(@ModelAttribute Category category){
		
		categoryDAO.saveOrUpdate(category);
		return "redirect:CategoryView";
	}

}
