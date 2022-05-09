package com.notrika.controller.user;

import com.notrika.entity.*;
import com.notrika.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/customer/payment")
public class CustomerCashController {

	private final CustomerOrderService customerOrderService;
	private final CustomerService customerService;
	private CustomerOrder order;
	private final PaymentService paymentService;
	private final UserService userService;
	@Autowired
	public CustomerCashController(CustomerOrderService customerOrderService, CustomerService customerService,  PaymentService paymentService,UserService userService) {
		this.customerOrderService = customerOrderService;
		this.customerService = customerService;
		this.paymentService = paymentService;
		this.userService = userService;

	}



	@PostMapping("/cash")
	public String payment(Authentication authentication) {
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
		User user = null;
		if (authentication.getPrincipal() instanceof  UserDetail){
			UserDetail userDetails = (UserDetail) authentication.getPrincipal();
			user = userDetails.getUser();
		}

		if (authentication.getPrincipal() instanceof OAuth2User) {
			OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
			user = userService.findByEmail(String.valueOf(oAuth2User.getAttributes().get("email")));
		}


		Long countCustomer = customerService.countByUserId(user.getId());
		if (countCustomer >0) {
			Customer customer = customerService.findByUserId(user.getId());
			order = customerOrderService.findOrderByCustomerId(customer.getId());
			paymentService.save(new com.notrika.entity.Payment(
					order.getTotalPrice(),
					"cash",
					false,
					order
			));
			order.setStatus(true);
			if (customerOrderService.saveOrder(order)!=null){
				return "redirect:/customer/payment/cash/payment-success";
			}
		}
		return "redirect:/customer";
	}

	@GetMapping("/cash/payment-success")
	public String paymentSuccessPage(Authentication authentication, Model model) {
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());
		return "template/user/customer/payment/cash/payment-success";
	}
}
