package com.notrika.config;

import com.notrika.controller.admin.AdminTypeController;
import com.notrika.entity.Cart;
import com.notrika.entity.UserDetail;
import com.notrika.service.CustomerService;
import com.notrika.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private static final Logger logger = LoggerFactory.getLogger(AdminTypeController.class);
    private final UserService userService;
    private final CustomerService customerService;
    private final Cart cart;

    @Autowired
    SecurityConfig(UserService userService, CustomerService customerService, Cart cart) {
        this.userService = userService;
        this.customerService = customerService;
        this.cart = cart;
    }

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userService)
                .passwordEncoder(encoder());
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/customer/**").hasRole("USER")
                .antMatchers(HttpMethod.POST, "/admin/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/admin/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/admin/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/admin/**").hasAnyRole("ADMIN", "ADMIN_TRAINEE")
                .antMatchers(HttpMethod.POST, "/api/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.PUT, "/api/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.DELETE, "/api/**").hasRole("ADMIN")
                .antMatchers(HttpMethod.GET, "/api/**").hasAnyRole("ADMIN", "ADMIN_TRAINEE")
                .anyRequest().permitAll()
                .and()
                .headers().addHeaderWriter(
                        new XFrameOptionsHeaderWriter(
                                XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN)).frameOptions().disable()
                .and()
                .exceptionHandling()
                .accessDeniedHandler(new AccessDeniedHandler() {
                    @Override
                    public void handle(HttpServletRequest request, HttpServletResponse response,
                                       AccessDeniedException accessDeniedException) throws IOException, ServletException {
                        response.sendRedirect(request.getContextPath() + "/method-denied");
                    }
                })
                .and()
                .formLogin()
                .loginPage("/confirm").permitAll()
                .successHandler(new AuthenticationSuccessHandler() {
                    @Override
                    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                        String role = "";
                        if (authentication.getPrincipal() instanceof UserDetail) {
                            UserDetail userDetails = (UserDetail) authentication.getPrincipal();
                            authentication.getAuthorities().forEach(r -> {
                                try {
                                    if (r.getAuthority().equals("ROLE_USER")) {
                                        Long inputCustomerInfo = customerService.countByUserId(userDetails.getUser().getId());
                                        if (inputCustomerInfo > 0) {
                                            response.sendRedirect(request.getContextPath() + "/customer");
                                        } else {
                                            response.sendRedirect(request.getContextPath() + "/customer/info");
                                        }
                                    } else {
                                        response.sendRedirect(request.getContextPath() + "/admin");
                                    }
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                            });
                        }

                    }
                })
                .passwordParameter("password")
                .usernameParameter("phoneNumber")
                .and()
                .rememberMe()
                .rememberMeParameter("remember-me")
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET"))
                .clearAuthentication(true)
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID", "remember-me")
                .logoutSuccessHandler(new LogoutSuccessHandler() {
                    @Override
                    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
                        if (cart.getCartItems() != null) {
                            cart.clearCartItem();
                        }
                        response.sendRedirect(request.getContextPath() + "/");
                    }
                });

    }
}
