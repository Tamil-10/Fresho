package com.niit.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public String indexPage(Model model) {
		
		return "index";
		
	}
	@RequestMapping("/login")
	public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,Model model) {
		ModelAndView mv = new ModelAndView("login");

		if (error != null) {
			model.addAttribute("error", "Mail Id or Password Incorrect");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logged out Successfully");
		}

		mv.addObject("loginButtonClicked", true);
		return mv;
	}
	
	@RequestMapping("/signup")
	public String signupPage(Model model) {

		return "signup";
	}

}
