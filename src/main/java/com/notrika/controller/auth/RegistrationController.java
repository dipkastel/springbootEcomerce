package com.notrika.controller.auth;

import com.notrika.entity.Ref;
import com.notrika.entity.User;
import com.notrika.repository.UserRepository;
import com.notrika.service.RefService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/register")
public class RegistrationController {
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
    public String registerPage(HttpServletRequest request, String userAgent, Model model) {
        Ref ref = refService.save(request.getHeader("User-Agent"), request.getRemoteAddr());
        model.addAttribute("refId", ref.getRefId());
        return "template/user/auth/register";
    }

    @PostMapping
    public String processRegister(@ModelAttribute("userRegist") User user, Model model, HttpServletRequest request) {

        int countUser = userRepo.countByUsername(user.getUsername());
        if (countUser == 0) {
            userRepo.save(user.toUser(encoder));
            return "redirect:/";
        } else {
            request.getSession().setAttribute("message", "Username invalid !");
        }
        return "redirect:/register";
    }
}
