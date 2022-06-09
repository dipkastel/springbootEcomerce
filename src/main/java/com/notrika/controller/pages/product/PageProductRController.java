package com.notrika.controller.pages.product;

import com.notrika.entity.Product;
import com.notrika.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping(path = "/restapi/product", produces = "application/json")
@CrossOrigin(origins = "*")
public class PageProductRController {
	@Autowired
	ProductService productService;

	@GetMapping("/detail")
	public Product addToWishList(@RequestParam(name = "id") Long id, HttpServletRequest request,
			HttpServletResponse response) {
		Product product = productService.findById(id);
		return product;
	}

}
