package com.notrika.controller.admin.widget;

import com.notrika.helper.enums.WidgetType;
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
		model.addAttribute("types", WidgetType.values());
		return "template/admin/widget/widget";
	}


}
