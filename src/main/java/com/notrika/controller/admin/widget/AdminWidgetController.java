package com.notrika.controller.admin.widget;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminWidgetController {

	@GetMapping("/widget")
	public String menu(Authentication authentication, Model model) {
		return "template/admin/widget/widget";
	}


}
