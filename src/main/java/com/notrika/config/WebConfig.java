package com.notrika.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.config.annotation.*;

import java.nio.file.Path;
import java.nio.file.Paths;


@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Value("${ckeditor.storage.image.path}")
    private String baseDir;

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/access-denied").setViewName("template/user/404/page-not-found");
        registry.addViewController("/internal-error").setViewName("template/user/404/internal-error");
        registry.addViewController("/method-denied").setViewName("template/user/404/method-denied");
    }


    //config not found page
    @Bean
    public WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> containerCustomizer() {
        return container -> {
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND,
                    "/access-denied"));
            container.addErrorPages(new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED,
                    "/method-denied"));
            container.addErrorPages(new ErrorPage(HttpStatus.BAD_REQUEST,
                    "/access-denied"));
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,
                    "/internal-error"));

        };
    }

//    config static resources
    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        WebMvcConfigurer.super.configurePathMatch(configurer);
        configurer.setUseSuffixPatternMatch(false);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if (baseDir.endsWith("/")){
            baseDir = baseDir.substring(0,baseDir.length() -1);
        }
        Path uploadDir = Paths.get(baseDir);
        String uploadPath = uploadDir.toFile().getAbsolutePath();
        registry.addResourceHandler("/public/image/**").addResourceLocations("file:/"+uploadPath+"/");
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        registry.addResourceHandler("/ckfinder/**").addResourceLocations("classpath:/static/ckfinder/");
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {

        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("GET", "POST")
                .allowedHeaders("Origin", "Accept", "Content-Type", "Authorization")
                .allowCredentials(true)
                .maxAge(3600);

    }
}
