package com.notrika.controller.admin.menu;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMenuController {

	@GetMapping("/menu")
	public String menu(Authentication authentication, Model model) {
		return "template/admin/menu/menu";
	}


}
