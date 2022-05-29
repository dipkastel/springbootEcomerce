package com.notrika.controller.admin.settings.smsSetting;

import com.notrika.service.SettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminSmsSettingsController {

    private final SettingsService settingsService;


    @Autowired
    public AdminSmsSettingsController(SettingsService settingsService) {
        this.settingsService = settingsService;
    }

    @GetMapping("/smsSettings")
    public String show(Authentication authentication, Model model) {
        return "template/admin/settings/smsSettings/smsSettings";
    }


}
