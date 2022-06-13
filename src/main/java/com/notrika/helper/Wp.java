package com.notrika.helper;

import com.notrika.entity.tables.Setting;
import com.notrika.service.SettingsService;
import com.notrika.wpRestApi.WpRestApi;
import com.notrika.wpRestApi.constAndEnums.EnumWpApiVersion;
import com.notrika.wpRestApi.core.builder.WpRestApiConfig;
import com.notrika.wpRestApi.core.builder.WpRestApiConfigBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Wp {

    @Autowired
    private SettingsService settingsService;
    @Autowired
    private WpRestApi wpRestApi;

    public void reInitialization(){

        List<Setting> settings = settingsService.findBySection(SettingsService.Section.api);
        String siteAddress = settings.stream().filter(p->SettingsService.Keys.ImportSiteUrl.key.equals(p.getSkey())).findFirst().get().getSvalue();
        String consumerKey = settings.stream().filter(p->SettingsService.Keys.ImportConsumerKey.key.equals(p.getSkey())).findFirst().get().getSvalue();
        String consumerPassword = settings.stream().filter(p->SettingsService.Keys.ImportConsumerPassword.key.equals(p.getSkey())).findFirst().get().getSvalue();
        WpRestApiConfig wpRestApiConfig = WpRestApiConfigBuilder
                .setSiteUrl(siteAddress)
                .setConsumerKey(consumerKey)
                .setConsumerSecret(consumerPassword)
                .serVersion(EnumWpApiVersion.v3)
                .useHttps(true)
                .build();
        wpRestApi.init( wpRestApiConfig);
    }
}
