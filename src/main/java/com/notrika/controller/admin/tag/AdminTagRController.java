package com.notrika.controller.admin.tag;

import com.notrika.entity.PaginationResult;
import com.notrika.entity.Tag;
import com.notrika.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path = "/api", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminTagRController {


	private final TagService tagService;

	@Autowired
	public AdminTagRController(TagService _tagService) {
		this.tagService = _tagService;
	}

	@GetMapping("/tag/all")
	public PaginationResult<Tag> getAll(Authentication authentication, @RequestParam(name = "page",defaultValue = "1") Long page, @RequestParam(name = "per_page",defaultValue = "10") Long per_page) {
		PaginationResult result = new PaginationResult();
		result.data = tagService.findByPagination(page-1,per_page);
		result.count = tagService.findAllCount();
		return result;
	}
	@GetMapping("/tag/delete")
	public void delete(Authentication authentication, @RequestParam(name = "id") Long id) {
		tagService.delete(id);
	}

}
