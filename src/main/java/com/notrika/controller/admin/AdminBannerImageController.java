package com.notrika.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.notrika.entity.BannerGallery;
import com.notrika.service.BannerGalleryService;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author Lam Cong Hau
 *
 */
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminBannerImageController {
	@Autowired
	private BannerGalleryService bannerService;

	@GetMapping(value = "/banner")
	public String listBanner(Authentication authentication, Locale locale, Model model) {
		log.info("list banner");
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());
		List<BannerGallery> listBanner = bannerService.findAll();
		model.addAttribute("listBanner", listBanner);
		return "template/admin/banner/list-banner-image";
	}

	@GetMapping(value = "/banner/new")
	public String newBanner(Authentication authentication, Locale locale, Model model) {
		log.info("new banner");
//		UserDetail userDetails = (UserDetail) authentication.getPrincipal();
//		model.addAttribute("user", userDetails.getUser());
		return "template/admin/banner/form-add-banner-image";
	}

	@PostMapping(value = "/banner/new")
	public String saveBanner(@RequestParam("image") MultipartFile[] uploadfile, @RequestParam("url") String url, Locale locale, Model model, HttpServletRequest request)
			throws IOException {
		log.info("new banner");
		log.info("file size: " + uploadfile.length);
		for (MultipartFile m : uploadfile) {
			if (!m.isEmpty()) {
				String fileName = m.getOriginalFilename();
				String name = m.getName();
				String type = m.getContentType();
				log.info(fileName + "," + name + "," + type);
				BannerGallery bannerGallery = new BannerGallery();
				bannerGallery.setImage(m.getBytes());
				bannerGallery.setUrl(url);
				bannerService.save(bannerGallery);
				String message = (String) request.getSession().getAttribute("message");
				request.getSession().setAttribute("message", "Submit success !");
			}
		}
		return "redirect:/admin/banner";
	}

	@PostMapping("/banner/delete")
	public String deleteBanner (@RequestParam(value = "id") Long id){
		bannerService.delete(id);
		return "redirect:/admin/banner";
	}
}
