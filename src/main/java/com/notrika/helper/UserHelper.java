package com.notrika.helper;


import com.notrika.entity.User;
import com.notrika.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;


@Component
public class UserHelper {
    public User getUser(Authentication authentication, UserService userService){
        User model = null;
        if (authentication != null) {
            if (authentication.getPrincipal() instanceof User){
                User myUser = (User) authentication.getPrincipal();
                model = myUser;
            }
            if (authentication.getPrincipal() instanceof OAuth2User) {
                OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
                model = userService.findByEmail(String.valueOf(oAuth2User.getAttributes().get("email")));
            }
        }
        return model;
    }

}
