package com.notrika.controller.admin.location;

import com.notrika.service.SettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminLocationController {

    private final SettingsService settingsService;


    @Autowired
    public AdminLocationController(SettingsService settingsService) {
        this.settingsService = settingsService;
    }

    @GetMapping("/location")
    public String show(Authentication authentication, Model model) {
        return "template/admin/location/location";
    }


}
