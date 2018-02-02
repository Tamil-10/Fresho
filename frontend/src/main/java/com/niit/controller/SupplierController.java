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

import com.niit.dao.SupplierDAO;
import com.niit.model.Supplier;

@Controller
public class SupplierController {
		
	@Autowired
	private SupplierDAO SupplierDao;
	@RequestMapping("Supplier")
	public ModelAndView newSupplier(){
		
		ModelAndView mv = new ModelAndView("Supplier");
		mv.addObject("AddSupplierButtonClicked", true);
		return mv;
	}
	
	
	@RequestMapping("addSupplier")
	public String addSupplier(@ModelAttribute Supplier supplier,@RequestParam("file") MultipartFile file ,Model model){
		SupplierDao.saveOrUpdate(supplier);
		String path = "E://My project/frontend/src/main/webapp/WEB-INF/resources/Supplier/";
		FileUtil.upload(path, file, supplier.getSupplierId()+".jpg");
		return "redirect:SupplierView";
		
	}
	
	@RequestMapping("SupplierView")
	public String viewSupplier(Model model){
		
		List<Supplier> supplierList = SupplierDao.list();
		model.addAttribute("supplierList", supplierList);
		model.addAttribute("ViewSupplierButtonClicked", true);
		
		return "Supplier";
		
	}
	
	@RequestMapping("DeleteSupplier")
	public String deleteSupplier(@RequestParam("supplierId") int supplierid ,Model model){
		
		SupplierDao.delete(supplierid);
		return "redirect:SupplierView";
		
	}
	
	@RequestMapping("EditSupplier")
	public String editSupplier(@RequestParam ("supplierId") int supplierId, Model model){
		Supplier supplier = SupplierDao.getBySupplierId(supplierId);
		model.addAttribute("supplier", supplier);
		model.addAttribute("EditSupplierClicked", true);
		return "Supplier";
		
	}
	@RequestMapping("supplierEdit")
	public String supplierEdited(@ModelAttribute Supplier supplier){
		
		SupplierDao.saveOrUpdate(supplier);
		return "redirect:SupplierView";
	}
}
