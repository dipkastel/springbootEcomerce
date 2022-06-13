package com.notrika.controller.admin.test;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminTestController {
	@GetMapping("/test")
	public String customerHomePage(Authentication authentication, Model model) {
		return "template/admin/test/test";
	}
}
