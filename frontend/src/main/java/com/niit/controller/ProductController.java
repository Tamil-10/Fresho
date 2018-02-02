package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;

@Controller
public class ProductController {

	@Autowired
	private ProductDAO ProductDao;
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private SupplierDAO SupplierDao;
	
	@RequestMapping("ViewProduct")
	public String ViewProduct(){
		
		return "ViewProduct";
	}
	@RequestMapping("Product")
	public ModelAndView newProduct(){
		
		ModelAndView mv = new ModelAndView("Product");
		List<Category> categoryList = categoryDAO.list();
		List<Supplier> supplierList = SupplierDao.list();
		mv.addObject("supplierList", supplierList);
		mv.addObject("categoryList", categoryList);
		mv.addObject("AddProductButtonClicked", true);
		return mv;
	}
	@RequestMapping("addProduct")
	public String addProduct(@ModelAttribute Product product, @RequestParam("file") MultipartFile file ,Model model){
		ProductDao.saveOrUpdate(product);
		
		String path = "E://My project/frontend/src/main/webapp/WEB-INF/resources/product/";
		FileUtil.upload(path, file, product.getProductId()+".jpg");
		
		model.addAttribute("ViewProductButtonClicked", true);
		
		return "redirect:viewProduct";
		
	}
	@RequestMapping("viewProduct")
	public String viewProducts(Model model){
		
		List<Product> productList = ProductDao.list();
		model.addAttribute("productList", productList);
		model.addAttribute("ViewProductButtonClicked", true);
		return "Product";
		
		
	}
	
	@RequestMapping("deleteProduct")
	public String deleteProducts(@RequestParam("productId") int productid, Model model){
		
		ProductDao.delete(productid);
		return "redirect:viewProduct";
	}
	
	@RequestMapping("editProduct")
	public ModelAndView editProduct(@RequestParam ("productId") int productId, Model model){
		ModelAndView mv = new ModelAndView("Product");
		List<Category> categoryList = categoryDAO.list();
		List<Supplier> supplierList = SupplierDao.list();
		Product product = ProductDao.getByProductId(productId);
		model.addAttribute("product", product);
		mv.addObject("supplierList", supplierList);
		mv.addObject("categoryList", categoryList);
		model.addAttribute("editProductClicked", true);
		return mv;
	}
	@RequestMapping("productEdited")
	public String productEdited(@ModelAttribute Product product){
		
		ProductDao.saveOrUpdate(product);
		return "redirect:viewProduct";
	}
	
	@RequestMapping("productdescription")
	public String ProductDescription(@RequestParam ("productId") int productId, Model model){
		Product product = ProductDao.getByProductId(productId);
		model.addAttribute("product", product);
		return "productdescription";
	}
	
	/*@RequestMapping("displayproduct")
	public String ProductDisplay(@RequestParam ("suppliername") String suppliername, Model model){
		List<Product> product = ProductDao.getBySupplierName(suppliername);
		model.addAttribute("product", product);
		return "displayproduct";
	}*/
}
