package com.niit.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.dao.CartDAO;
import com.niit.dao.ShipmentDAO;
import com.niit.dao.UserDAO;
import com.niit.model.Cart;
import com.niit.model.Shipment;
import com.niit.model.User;

@Controller
public class ShippingController {
	
	@Autowired
	ShipmentDAO ShipmentDao;
	
	@Autowired
	UserDAO UserDao;
	
	@Autowired
	CartDAO CartDao;
	
	
	@RequestMapping("newAddress")
	public String newAddress(@ModelAttribute Shipment ship,Principal p,HttpSession session,Model model){
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		ship.setUserId(user.getUserId());
		List<Shipment> shipdetail = ShipmentDao.list();
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedAdd", true);
		return"shippingaddress";
	}
	
	@RequestMapping("getUpdateAdd")
	public String getUpdateAdd(@RequestParam(value="shipmentId") int shipmentId,Principal p,HttpSession session,Model model)
	{
		Shipment ship = ShipmentDao.getByShipmentId(shipmentId);
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		int id=user.getUserId();
		List<Shipment> shipdetail = ShipmentDao.getByUserId(id);
		boolean flag = true;
		model.addAttribute("flag", flag);
		
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("ship", ship);
		model.addAttribute("isUserClickedAdd", true);
		model.addAttribute("BeforeUpdate", "true");
		return "shippingaddress";
	}
	@RequestMapping("updateAdd")
	public String updateAdd(@ModelAttribute Shipment ship,Principal p,HttpSession session,Model model){
		
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		int id=user.getUserId();
		System.out.println(ship.getShipmentId());
		ship.setUserId(user.getUserId());
		ship.setEmailId(user.getEmailId());
		ShipmentDao.saveOrUpdate(ship);	
		List<Shipment> shipdetail = ShipmentDao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);
		return"viewShipAddress";
	}	
	
	@RequestMapping("proceed")
	public String proceed(@ModelAttribute Shipment ship,Principal p,HttpSession session,Model model){
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		String username = user.getUserName();
		int id=user.getUserId();
		if(CartDao.getByUserName(username)==false){
			
			return "redirect:myCart";
		}
		else{
				List<Shipment> shipdetail = ShipmentDao.getByUserId(id);
				model.addAttribute("shipdetail", shipdetail);
				model.addAttribute("isUserClickedViewShipAddress", true);
				model.addAttribute("title", "-ShippingAddress");
				return"viewShipAddress";
			}
	}
	
	@RequestMapping("addAddress")
	public String addAddress(@ModelAttribute Shipment ship,Principal p,HttpSession session,Model model){
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		ship.setUserId(user.getUserId());
		ship.setEmailId(user.getEmailId());
		ShipmentDao.saveOrUpdate(ship);
		boolean flag = false;
		model.addAttribute("flag", flag);
		int id=user.getUserId();
		List<Shipment> shipdetail = ShipmentDao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);
		return"viewShipAddress";
	}
	
	@RequestMapping("add")
	public String add(Model model){
				
		model.addAttribute("isUserClickedAdd", true);
		return"shippingaddress";
	}
	@RequestMapping("pay")
	public String pay(@RequestParam("shipmentId") int shipmentId,Principal p,HttpSession session,Model model){
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		String username = user.getUserName();
		Random random = new Random();
		int id =1000+random.nextInt(999);
		 
		
		
			List<Cart> kart = CartDao.getCartItems(username);
			Date date= kart.get(0).getCuDate();
			for (Cart k : kart) {
				int cid=k.getCartId();
				if(cid>0){
					
					k.setCartId(cid);
				}
				else{
						k.setCartId(id); 
				}
				k.setShippingId(shipmentId);
				
				CartDao.saveOrUpdate(k);
			}
			int subtotal = 0;
			int deliver= 50;
			for (Cart c: kart) {
				subtotal = subtotal + (c.getQty() * c.getPrice());
			}
			if(subtotal>=1000)
			{
				deliver = 0;
			}
			int rid = kart.get(0).getCartId();
			model.addAttribute("rid", rid);
			model.addAttribute("subtotal", subtotal);
			model.addAttribute("deliver", deliver);
			Shipment ship = ShipmentDao.getByShipmentId(shipmentId);
			List<Shipment> shipdetail = ShipmentDao.getByUserId(id);
			model.addAttribute("shipdetail", shipdetail);
			model.addAttribute("ship", ship);
			model.addAttribute("kart", kart);
			model.addAttribute("date", date);
			model.addAttribute("isUserClickedDeliver", true);
		return "Receipt";			
		
	}
	@RequestMapping("deleteAdd")
	public String deleteAdd(@RequestParam(value="shipmentId") int shipmentId,Principal p,HttpSession session,Model model){
		ShipmentDao.delete(shipmentId);
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		int id=user.getUserId();
		List<Shipment> shipdetail = ShipmentDao.getByUserId(id);
		model.addAttribute("shipdetail", shipdetail);
		model.addAttribute("isUserClickedViewShipAddress", true);		
		return "viewShipAddress";
	}
	
	@RequestMapping("ThankYou")
	public String thankYou(Principal p,HttpSession session,Model model){
		String pattern = "dd-MM-yyyy";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String email = p.getName();	
		User user = UserDao.getByEmailId(email);
		String username = user.getUserName();
		List<Cart> kart = CartDao.getCartItems(username);
		Random random = new Random();
		int day = 2+ random.nextInt(6);
		Calendar cal = Calendar.getInstance();
		Date date= kart.get(0).getCuDate();
		cal.setTime(date);
		cal.add(Calendar.DATE,day);		
		for (Cart k : kart) { 
			
			k.setStatus("Dispatched");
			k.setdDate(cal.getTime());
			Date d2 = k.getdDate();
			try
			{
				Date currentDate= new Date();
				long diff = d2.getTime() - currentDate.getTime();
				int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
				k.setDays(diffDays);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			CartDao.saveOrUpdate(k);
		}
		String delDate = sdf.format(kart.get(0).getdDate());
		model.addAttribute("delDate",delDate);
		model.addAttribute("isUserClickedThankYou", true);
		return"thankyou";
	}
	@RequestMapping("payment")
	public String payment(@RequestParam("shipmentId") int shipmentId,HttpSession session,Model model){
		String username = (String) session.getAttribute("username");
		int subtotal =0;
		int id=0;
		List<Cart> kart = CartDao.getCartItems(username);
		
		for (Cart c: kart) {
			subtotal = subtotal + (c.getQty() * c.getPrice());
			id = c.getCartId();
		}
		if(subtotal<1000)
		{
			subtotal = subtotal+50;
		}
		model.addAttribute("id", id);
		model.addAttribute("subtotal", subtotal);
		model.addAttribute("isUserClickedPayment", true);
		return"payment";
	}
	
}
