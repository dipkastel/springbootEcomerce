package com.notrika.config;

import com.notrika.helper.Wp;
import com.notrika.service.SettingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.notrika.wpRestApi.WpRestApi;

@Configuration
public class wpRest {


    @Autowired
    private Wp wp;

    @Bean
    public void wpRestApiInitial() {
        wp.reInitialization();
    }
}
