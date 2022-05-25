package com.notrika.controller.admin.product;

import com.notrika.entity.ImageGallery;
import com.notrika.entity.Product;
import com.notrika.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;


@RestController
@RequestMapping(path = "/api/product", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminProductRController {
	private static final Logger logger = LoggerFactory.getLogger(AdminProductRController.class);

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@GetMapping("/all")
	public List<Product> getAll(Authentication authentication,@RequestParam(name = "page",defaultValue = "1") Integer page,@RequestParam(name = "per_page",defaultValue = "10") Integer per_page) {
		List<Product> list = productService.findByPagination(page,per_page);
		logger.info("list: " + list.size());
		return list;
	}

}
