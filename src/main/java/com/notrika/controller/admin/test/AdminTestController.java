package com.notrika.controller.admin.test;

import com.notrika.entity.Product;
import com.notrika.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminTestController {
	@GetMapping("/test")
	public String customerHomePage(Authentication authentication, Model model) {
		return "template/admin/test/test";
	}
}
