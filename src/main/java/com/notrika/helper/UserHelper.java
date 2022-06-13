package com.notrika.helper;


import com.notrika.entity.tables.Customer;
import com.notrika.entity.tables.User;
import com.notrika.entity.UserDetail;
import com.notrika.service.CustomerService;
import com.notrika.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;


@Component
public class UserHelper {
    public User getUser(Authentication authentication, UserService userService){
        User model = null;
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof UserDetail){
                UserDetail userDetails = (UserDetail) authentication.getPrincipal();
                model = userDetails.getUser();
            }
//            if (authentication.getPrincipal() instanceof OAuth2User) {
//                OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
//                model = userService.findByPhoneNumber(String.valueOf(oAuth2User.getAttributes().get("phoneNumber")));
//            }
        }
        return model;
    }

    public Customer getCustomer(Authentication authentication, CustomerService customerService,UserService userService) {
        Customer model = null;
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof UserDetail){
                UserDetail userDetails = (UserDetail) authentication.getPrincipal();
                model = customerService.findByUserId(userDetails.getUser().getId());
            }
//            if (authentication.getPrincipal() instanceof OAuth2User) {
//                OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
//                User user = userService.findByPhoneNumber(String.valueOf(oAuth2User.getAttributes().get("phoneNumber")));
//                model = customerService.findByUserId(user.getId());
//            }
        }
        return model;
    }
}
