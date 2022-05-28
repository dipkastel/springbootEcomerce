package com.notrika.controller.admin.menu;

import com.notrika.entity.Brand;
import com.notrika.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
@RequestMapping("/admin")
public class AdminMenuController {

	@GetMapping("/menu")
	public String get(Authentication authentication, Model model) {
		return "template/admin/menu/list-menu";
	}

}
