package com.notrika.controller.admin.message;

import com.notrika.entity.tables.Message;
import com.notrika.entity.tables.User;
import com.notrika.service.MessageService;
import com.notrika.service.SettingsService;
import com.notrika.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminMessageController {

    private final SettingsService settingsService;
    private final UserService userService;
    private final MessageService messageService;


    @Autowired
    public AdminMessageController(SettingsService settingsService, MessageService messageService, UserService userService) {
        this.settingsService = settingsService;
        this.messageService = messageService;
        this.userService = userService;
    }


    @MessageMapping("/toadmin/{senderId}")
    @SendTo("/chat/admin")
    public Message toAdmin(@DestinationVariable String senderId, Message message, Authentication authentication) {
        if (authentication != null) {
            User user = userService.findByPhoneNumber(authentication.getName());
            message.setUser(user);
            message.setFromAdmin(authentication.getAuthorities().stream().anyMatch(p -> p.getAuthority().startsWith("ROLE_ADMIN")));
            message.setCustomerUniq(authentication.getName());
        } else {
            message.setCustomerUniq(senderId);
        }
        message.setDestination("admin");
        messageService.save(message);
        return message;
    }

    @MessageMapping("/toclient/{reciverId}")
    @SendTo("/chat/{reciverId}")
    public Message fromAdmin(@DestinationVariable String reciverId, Message message, Authentication authentication) {
        User user = userService.findByPhoneNumber(authentication.getName());
        message.setUser(user);
        message.setFromAdmin(authentication.getAuthorities().stream().anyMatch(p -> p.getAuthority().startsWith("ROLE_ADMIN")));
        message.setCustomerUniq(authentication.getName());
        message.setDestination(reciverId);
        messageService.save(message);
        if (message.isFromAdmin())
            message.setCustomerUniq("پشتیبان سایت");
        return message;
    }


    @GetMapping("/admin/message")
    public String messages(Authentication authentication, Model model) {
        return "template/admin/message/message";
    }

}
