package com.notrika.controller.admin.tag;

import com.notrika.entity.Tag;
import com.notrika.service.TagService;
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
public class AdminTagController {


	private final TagService tagService;

	@Autowired
	public AdminTagController(TagService _tagService) {
		this.tagService = _tagService;
	}

	@GetMapping("/tag")
	public String show(Authentication authentication, Model model) {
		return "template/admin/tag/list-tag";
	}
	
	@GetMapping(value = "/tag/new")
	public String newType(Authentication authentication, Locale locale, Model model) {

		model.addAttribute("tag", new Tag());
		return "template/admin/tag/form-add-tag";
	}

	@PostMapping(value = "/tag/new")
	public String saveType(Tag tag, Locale locale, Model model, HttpServletRequest request) {
		tagService.save(tag);
		String message = (String) request.getSession().getAttribute("message");
		request.getSession().setAttribute("message", "Submit success !");
		return "redirect:/admin/tag";
	}

	@GetMapping(value = "/tag/edit")
	public String edit(@RequestParam(value = "id") Long id, Authentication authentication, Locale locale, Model model) {
		model.addAttribute("tag", tagService.findById(id));
		return "template/admin/tag/form-edit-tag";
	}

	@PostMapping(value = "/tag/update")
	public String update(Tag tag, Locale locale, Model model, HttpServletRequest request) {
		Tag b = tagService.findById(tag.getId());
		b.setTag(tag);
		tagService.save(b);
		String message = (String) request.getSession().getAttribute("message");
		request.getSession().setAttribute("message", "Update success !");
		return "redirect:/admin/tag";
	}
}
