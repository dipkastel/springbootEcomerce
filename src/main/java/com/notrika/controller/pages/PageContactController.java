package com.notrika.controller.pages;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.notrika.entity.Contact;
import com.notrika.service.ContactService;

import javax.servlet.http.HttpServletRequest;

/**
 * @author TranDung
 *
 */
@Controller
public class PageContactController {
	private final ContactService contactService;
	
	public PageContactController(ContactService contact) {
		this.contactService = contact;
	}
	
    @GetMapping("/contact")
    public String contactHomePage(Model model) {
		model.addAttribute("contact",new Contact());
        return "template/user/page/contact/form";
    }
    
    @PostMapping(value = "/contact/submit")
	public String save(Contact ctx, HttpServletRequest request) {
		contactService.save(ctx);
		request.getSession().setAttribute("message", "Thank you for sending message to us!");
		return "redirect:/";
	}
}
