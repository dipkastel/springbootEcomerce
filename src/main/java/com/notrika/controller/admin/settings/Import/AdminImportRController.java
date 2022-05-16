package com.notrika.controller.admin.settings.Import;

import com.notrika.wpRestApi.WpRestApi;
import com.notrika.wpRestApi.entities.systemStatus.SystemStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping(path = "/admin/import", produces = "application/json")
@CrossOrigin(origins = "*")
public class AdminImportRController {

	private WpRestApi wpRestApi;

	@Autowired
	public AdminImportRController(WpRestApi _wpRestApi){
		this.wpRestApi = _wpRestApi;
	}

	@GetMapping("/TestConnection")
	public SystemStatus EditUserController(Model model, Authentication authentication){
		SystemStatus systemStatus = wpRestApi.system.getSystemStatus();

		return systemStatus;
	}

}
