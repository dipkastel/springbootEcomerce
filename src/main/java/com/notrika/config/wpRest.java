package com.notrika.config;

//@Configuration
//public class wpRest {
//
//    private final SettingsService settingsService;
//
//    @Autowired
//    wpRest(SettingsService _settingsService){
//        this.settingsService = _settingsService;
//    }
//
//    @Bean
//    public WpRestApi wpRestApi() {
////        List<Setting> settings = settingsService.findBySection(SettingsService.Section.api);
////        String siteAddress = settings.stream().filter(p->p.getSkey().equals(SettingsService.Keys.ImportSiteUrl)).findFirst().get().getSvalue();
//         WpRestApiConfig wpRestApiConfig = WpRestApiConfigBuilder
//                 .setSiteUrl("kalamiss.ir")
//                .setConsumerKey("ck_7186f7821630792004f0a26b9a0954f92e9fc920")
//                .setConsumerSecret("cs_3359be762022b82c27d5d675ae6da1f6c3dc1021")
//                .serVersion(EnumWpApiVersion.v3)
//                .useHttps(true)
//                .build();
//        WpRestApi api = new WpRestApi( wpRestApiConfig);
//        return api;
//    }
//}
