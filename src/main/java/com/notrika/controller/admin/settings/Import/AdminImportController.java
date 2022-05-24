package com.notrika.controller.admin.settings.Import;

import com.notrika.controller.admin.product.AdminProductController;
import com.notrika.entity.req._req_import_conf;
import com.notrika.helper.Wp;
import com.notrika.service.SettingsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/admin/import")
public class AdminImportController {

	private static final Logger logger = LoggerFactory.getLogger(AdminProductController.class);
	private final SettingsService settingsService;

	@Autowired
	private Wp wp;


	@Autowired
	public AdminImportController(SettingsService settingsService) {
		this.settingsService = settingsService;
	}
	
	@GetMapping("")
	public String show(Authentication authentication, Model model) {
		model.addAttribute("apiSiteUrl" ,settingsService.findBySkey(SettingsService.Keys.ImportSiteUrl));
		model.addAttribute("apiConsumerKey" ,settingsService.findBySkey(SettingsService.Keys.ImportConsumerKey) );
		model.addAttribute("apiConsumerPassword" ,settingsService.findBySkey(SettingsService.Keys.ImportConsumerPassword) );
		return "template/admin/settings/import/import";
		}
	
	@PostMapping("/SetConnection")
	public String EditUserController(_req_import_conf input, Model model, Authentication authentication){

		settingsService.addOrUpdate(SettingsService.Keys.ImportSiteUrl, input.getSiteUrl());
		settingsService.addOrUpdate(SettingsService.Keys.ImportConsumerKey, input.getConsumerKey());
		settingsService.addOrUpdate(SettingsService.Keys.ImportConsumerPassword, input.getConsumerPassword());
		 wp.reInitialization();
		return "redirect:/admin/import";
	}



}
