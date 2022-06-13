package com.notrika.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.notrika.entity.tables.Payment;
import com.notrika.service.PaymentService;

import java.util.List;


@Controller

@RequestMapping("/admin")
public class AdminPaymentController {

	private final PaymentService payment;

	@Autowired
	public AdminPaymentController(PaymentService payment) {
		this.payment = payment;
	}

	@GetMapping("/payment")
	public String ListPaymentController(Authentication authentication, Model model) {
		model.addAttribute("paymentList", payment.findAll());
		return "template/admin/payment/list";
	}

	@RequestMapping(value = "/payment/detail", method = RequestMethod.GET)
	public String DetailPaymentController(@RequestParam("id") Long id, Authentication authentication,Model model) {
		model.addAttribute("paymentDetail" , payment.findById(id));
		return "template/admin/payment/detail";
	}
	@GetMapping("/payment/edit")
	public String EditPaymentController(@RequestParam("id") Long id , Model model) {
		model.addAttribute("paymentEdit" , payment.findById(id));
		return "template/admin/payment/edit";
	}
	@RequestMapping(value = "/payment/saveUpdate", method = RequestMethod.POST)
	public String SaveUserController(Model model, Payment paymentFrm,HttpServletResponse response, Authentication authentication) {	     
		Payment paymentIn = payment.findById(paymentFrm.getId());
//		paymentIn.setTransactionStatus(paymentFrm.isTransactionStatus());
		paymentIn.setTracked(paymentFrm.isTracked());
		payment.save(paymentIn);
		return "redirect:/admin/payment";
	}

	@PostMapping("/payment")
	public String processPayment(
			@RequestParam("id") List<Long> listId,
			@RequestParam("method") String method,
			HttpServletRequest request){

		String message = (String) request.getSession().getAttribute("message");
		listId.forEach(id->{
			Payment p = payment.findById(id);
			if (method.equals("status")){
//				p.setTransactionStatus(true);
			}else {
//				p.setTransactionStatus(true);
				p.setTracked(true);
			}
			payment.save(p);
		});

		if (method.equals("status")){
			request.getSession().setAttribute("message", "Set Paid success!");
		}else{
			request.getSession().setAttribute("message", "Set Deliver success!");
		}

		return "redirect:/admin/payment";
	}

}
