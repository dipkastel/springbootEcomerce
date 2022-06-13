package com.notrika.controller.pages;

import com.notrika.entity.tables.EmailSubscriber;
import com.notrika.service.SubscriberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Slf4j
@Controller
@RequestMapping("/subcriber")
public class PageSubcriberController {
	private final SubscriberService subscriberService;
	@Autowired
	public PageSubcriberController(SubscriberService subscriberService) {
		this.subscriberService = subscriberService;
	}

	@PostMapping()
	public String subcribe(EmailSubscriber subscriber,HttpServletRequest request) {
		String message = (String) request.getSession().getAttribute("message");
		Long count = subscriberService.countByEmail(subscriber.getEmail());
		if (count >0){
			request.getSession().setAttribute("message", "Invalid, Subcriber already registed !");

		}else{
			subscriberService.save(subscriber);
			request.getSession().setAttribute("message", "Thank you to subcribe us !");
		}

		return "redirect:/";
	}
}
