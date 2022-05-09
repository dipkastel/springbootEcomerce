package com.notrika.controller.admin;

import com.notrika.entity.Customer;
import com.notrika.entity.CustomerOrder;
import com.notrika.entity.Payment;
import com.notrika.entity.User;
import com.notrika.service.CustomerOrderService;
import com.notrika.service.CustomerService;
import com.notrika.service.PaymentService;
import com.notrika.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author Vy list , edit , update , detail
 * @author Lam Cong Hau extend detail
 */
@Controller
@RequestMapping("/admin")
public class AdminUserController {
	private final UserService userService;
	private final CustomerService customerService;
	private final CustomerOrderService customerOrderService;
	private final PaymentService paymentService;

	@Autowired
	public AdminUserController(UserService user, CustomerService customerService,
			CustomerOrderService customerOrderService, PaymentService paymentService) {
		this.userService = user;
		this.customerService = customerService;
		this.customerOrderService = customerOrderService;
		this.paymentService = paymentService;
	}

	@GetMapping("/user")
	public String ListUserController(Authentication authentication, Model model) {
		model.addAttribute("userList" , userService.findAll());
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());
		return  "template/admin/user/list";
	}

	@GetMapping("/user/edit")
	public String EditUserController(
			@RequestParam(value = "id") Long id,Model model, Authentication authentication){
		model.addAttribute("userDetail" , userService.findById(id));
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());
		return "template/admin/user/edit";
	}

	@GetMapping("/user/detail")
	public String DetailUserController(@RequestParam(value = "id") Long id, Model model,
			Authentication authentication) {
		model.addAttribute("userDetail", userService.findById(id));
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());

		Customer cus = customerService.findByUserId(id);
		if (cus != null) {
			List<CustomerOrder> orders;
			try {
				orders = customerOrderService.findAllOrderByCustomerId(cus.getId());
			} catch (Exception e) {
				orders = new ArrayList<>();
			}
			model.addAttribute("customerOrders", orders);

			List<Payment> payments = paymentService.findAllPaymentByCustomerId(cus.getId());
			model.addAttribute("payments", payments);

			model.addAttribute("customer", cus);
		}
		return "template/admin/user/detail1";
	}

	@RequestMapping(value = "/user/saveUpdate", method = RequestMethod.POST)
	public String SaveUserController(Model model, User user, HttpServletResponse response,
			Authentication authentication, HttpServletRequest request) {
		User userIn = userService.findById(user.getId());
		userIn.setEnabled(user.isEnabled());
		userIn.setRole(user.getRole());
		userService.saveUser(userIn);
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());
		String message = (String) request.getSession().getAttribute("message");
		request.getSession().setAttribute("message", "Update success !");
		return "redirect:/admin/user";
	}
}
