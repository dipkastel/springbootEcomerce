package com.notrika.controller.auth;

import com.notrika.controller.admin.AdminTypeController;
import com.notrika.entity.tables.Ref;
import com.notrika.entity.tables.User;
import com.notrika.helper.SmsHelper;
import com.notrika.helper.StringHelper;
import com.notrika.repository.UserRepository;
import com.notrika.service.RefService;
import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/register")
public class RegistrationController {
    private static final Logger logger = LoggerFactory.getLogger(AdminTypeController.class);
    private final UserRepository userRepo;
    private final PasswordEncoder encoder;
    private final RefService refService;

    @Autowired
    public RegistrationController(UserRepository userRepo, PasswordEncoder encoder,RefService refService) {
        this.userRepo = userRepo;
        this.encoder = encoder;
        this.refService = refService;
    }


    @ModelAttribute(name = "userRegist")
    public User user() {
        return new User();
    }

    @GetMapping
    public String registerPage(HttpServletRequest request, String userAgent, Model model,Authentication user) {
        if (user!=null){
            return "redirect:/";
        }
        Ref ref = refService.save(request.getHeader("User-Agent"), request.getRemoteAddr());
        model.addAttribute("refId", ref.getRefId());
        return "template/user/auth/register";
    }

    @PostMapping
    public String processRegister(@ModelAttribute("userRegist") User user, Model model, HttpServletRequest request) {
        try {
            refService.findByRefid(user.getRefId());
        } catch (NotFoundException e) {
            return "redirect:/method-denied";
        }
        int countUser = userRepo.countByPhoneNumber(user.getPhoneNumber());
        if (countUser == 0) {
            //register
            String code = StringHelper.getNumericString(4);
            user.setPassword(code);
            try {
                SmsHelper.sendMessage(code,user.getPhoneNumber());
            } catch (Exception e) {
                request.getSession().setAttribute("message", "خطا در ارسال پیامک");
                return "redirect:/register";
            }
            User newuser=new User();
            newuser.setPhoneNumber(user.getPhoneNumber());
            newuser.setRole("ROLE_USER");
            newuser.setEnabled(true);
            newuser.setPassword(encoder.encode(user.getPassword()));
            userRepo.save(newuser);
            user.setPassword("");
            model.addAttribute("user", user);
            return "redirect:/confirm?n="+user.getPhoneNumber();
        } else if(countUser==1) {
            //login
            user = userRepo.findByPhoneNumber(user.getPhoneNumber());
            String code = StringHelper.getNumericString(4);
            user.setPassword(encoder.encode(code));
            try {
                SmsHelper.sendMessage(code,user.getPhoneNumber());
            } catch (Exception e) {
                request.getSession().setAttribute("message", "خطا در ارسال پیامک");
                return "redirect:/register";
            }
            userRepo.save(user);
            return "redirect:/confirm?n="+user.getPhoneNumber();
        }else{
            request.getSession().setAttribute("message", "Username invalid !");
        }
        return "redirect:/register";
    }
}
