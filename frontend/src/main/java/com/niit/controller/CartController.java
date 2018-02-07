package com.niit.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDAO;
import com.niit.dao.ProductDAO;
import com.niit.dao.SupplierDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Cart;
import com.niit.model.Product;
import com.niit.model.User;

@Controller
public class CartController {
	
	@Autowired
	ProductDAO ProductDao;

	@Autowired
	CartDAO CartDao;

	@Autowired
	Cart cart;
	@Autowired
	SupplierDAO SupplierDao;

	@Autowired
	UserDAO UserDao;

	@RequestMapping("addtocart")
	public String addToCart(@RequestParam(value = "productId") int productId,Principal p, HttpSession session, Model model) {
		System.out.println("-------------------------------------------------------------------1");
		Product pro = ProductDao.getByProductId(productId);
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		String username = user.getUserName();
		Cart kart = CartDao.getByUserandProduct(username, productId);
		if (pro.getStock() > 0) {
			System.out.println("-------------------------------------------------------------------2");
			Date d1 = new java.sql.Date(new java.util.Date().getTime());
			if (CartDao.itemAlreadyExist(username, productId)) {
				int qty = kart.getQty() + 1;
				kart.setQty(qty);
				kart.setCuDate(d1);
				kart.setTime(new java.sql.Time(d1.getTime()));
				kart.setTotal(pro.getPrice() * qty);
				System.out.println("-------------------------------------------------------------------3");
				CartDao.saveOrUpdate(kart);
				System.out.println(qty);
				System.out.println(username);
				System.out.println("-------------------------------------------------------------------4");
			} 
			else {
				System.out.println("-------------------------------------------------------------------5");
				System.out.println(user.getEmailId());
				cart.setEmailId(user.getEmailId());
				System.out.println(pro.getProductId());
				cart.setProductId(productId);
				System.out.println(1);
				cart.setQty(1);
				cart.setCuDate(d1);
				cart.setTime(new java.sql.Time(d1.getTime()));
				System.out.println("New");
				cart.setStatus("New");
				System.out.println(username);
				cart.setUserName(username);
				System.out.println(user.getUserId());
				cart.setUserId(user.getUserId());
				System.out.println(pro.getProductName());
				cart.setProductName(pro.getProductName());
				System.out.println(pro.getPrice());
				cart.setPrice(pro.getPrice());
				System.out.println(cart.getQty() * cart.getPrice());
				cart.setTotal(cart.getQty() * cart.getPrice());
				System.out.println("-------------------------------------------------------------------6");
				CartDao.save(cart);
				System.out.println("-------------------------------------------------------------------7");
				List<Cart> list = CartDao.getCartItems(username);
				model.addAttribute("cartitems", list);

				int grandtotal = 0;

				for (Cart cart : list) {
					grandtotal = grandtotal + (cart.getQty() * cart.getPrice());
				model.addAttribute("grandtotal", grandtotal);
				}
			}
		pro.setStock(pro.getStock() - 1);

		ProductDao.saveOrUpdate(pro);
		}
		
		return "redirect:myCart";
	}

	@RequestMapping("myCart")
	public String showCart(Model model,Principal p, HttpSession session) {
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		String username = user.getUserName();
		int grandtotal = 0;
		List<Cart> list = CartDao.getCartItems(username);
		if(list != null && !list.isEmpty())
		{
			model.addAttribute("cartitems", list);

			

			for (Cart cart : list) {
				grandtotal = grandtotal + (cart.getQty() * cart.getPrice());
			}
			model.addAttribute("grandtotal", grandtotal);
			
			return "cart";
		}
		else
		{
			model.addAttribute("isUserClikedEmptyCart", true);
			return "EmptyCart";
		}
	}

	@RequestMapping("removeCart")
	public String removeCart(@RequestParam("itemId") int itemId, HttpSession session, Model model) {

		Cart cart = CartDao.getByItemId(itemId);
		Product pro = ProductDao.getByProductId(cart.getProductId());
		
		pro.setStock(pro.getStock()+cart.getQty());
		ProductDao.saveOrUpdate(pro);
		CartDao.deleteCartItem(cart);
		return "redirect:myCart";
	}
	
	@RequestMapping("decreaseQty")
	public String decreaseQty(@RequestParam("itemId") int itemId,HttpSession session,Model model){
		Cart cart = CartDao.getByItemId(itemId);
		Product pro = ProductDao.getByProductId(cart.getProductId());
		if(cart.getQty()>1){
		Date d1 = new java.sql.Date(new java.util.Date().getTime());
		cart.setQty(cart.getQty()-1);
		cart.setCuDate(d1);
		cart.setTime(new java.sql.Time(d1.getTime()));
		cart.setTotal(pro.getPrice()*cart.getQty());
		pro.setStock(pro.getStock()+1);
		
		}
		else{
			cart.setQty(1);
		}
		
		ProductDao.saveOrUpdate(pro);
		CartDao.saveOrUpdate(cart);
		return "redirect:myCart";
	}
	
	@RequestMapping("increaseQty")
	public String increaseQty(@RequestParam("itemId") int itemId,HttpSession session,Model model){
		Cart cart = CartDao.getByItemId(itemId);
		Product pro = ProductDao.getByProductId(cart.getProductId());
		cart.setQty(cart.getQty()+1);
		Date d1 = new java.sql.Date(new java.util.Date().getTime());
		cart.setCuDate(d1);
		cart.setTime(new java.sql.Time(d1.getTime()));
		cart.setTotal(pro.getPrice()*cart.getQty());
		pro.setStock(pro.getStock()-1);
		ProductDao.saveOrUpdate(pro);
		CartDao.saveOrUpdate(cart);
				
		return "redirect:myCart";
	}
	
	@RequestMapping("History")
	public String Ordered(Model model,Principal p, HttpSession session){
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		String username = user.getUserName();

		List<Cart> list = CartDao.getDispatchItems(username);
		int size = list.size();
		model.addAttribute("cartitems", list);
		model.addAttribute("size", size);
		model.addAttribute("isUserClickedHistory", true);
		return "OrderPage";
	}
	
	@RequestMapping("admincart")
	public String adminCart(Model model){
		List<Cart> list = CartDao.getAllItems();
		for (Cart c : list) {
			java.util.Date d2= c.getdDate();
			try
			{
				Date date= new Date();
				long diff = d2.getTime() - date.getTime();
				int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
				if(diffDays<0)
				{
					c.setDays(0);
					c.setStatus("Delivered");
				}
				else{
					c.setDays(diffDays);
				}
				CartDao.saveOrUpdate(c);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("cartitems", list);
		model.addAttribute("isUserClickedadminCart", true);
		return "admincart";
	}
}
