package com.notrika.controller.auth;

import com.notrika.entity.Ref;
import com.notrika.entity.User;
import com.notrika.helper.SmsHelper;
import com.notrika.helper.StringHelper;
import com.notrika.repository.UserRepository;
import com.notrika.service.RefService;
import com.notrika.service.UserService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Controller
@RequestMapping("/confirm")
public class ConfirmController {
    private final UserService userService;
    private final PasswordEncoder encoder;
    private final RefService refService;

    @Autowired
    public ConfirmController(UserService userService, PasswordEncoder encoder, RefService refService) {
        this.userService = userService;
        this.encoder = encoder;
        this.refService = refService;
    }


    @ModelAttribute(name = "userRegist")
    public User user() {
        return new User();
    }

    @GetMapping
    public String confirmPage(@RequestParam(value = "n" ,required = false) String number, HttpServletRequest request, Model model) {
        if(number==null)
            return "redirect:/register";
        Ref ref = refService.save(request.getHeader("User-Agent"), request.getRemoteAddr());
        model.addAttribute("refId", ref.getRefId());
        model.addAttribute("phoneNumber", number);
        return "template/user/auth/confirm";
    }


    @PostMapping
    public String processConfirm(@ModelAttribute("userRegist") User user, Model model, HttpServletRequest request) {
        try {
            refService.findByRefid(user.getRefId());
        } catch (NotFoundException e) {
            return "redirect:/method-denied";
        }
        User dbuser = userService.findByPhoneNumber(user.getPhoneNumber());
        if(encoder.matches(user.getPassword(),dbuser.getPassword())){
            //login
            return "redirect:/";
        }
        model.addAttribute("massage","error");
        return "redirect:/confirm?n="+user.getPhoneNumber();
    }
}
