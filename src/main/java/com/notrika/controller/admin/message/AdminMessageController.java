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
@RequestMapping("/admin")
public class AdminMessageController {

    private final SettingsService settingsService;
    private final UserService userService;
    private final MessageService messageService;


    @Autowired
    public AdminMessageController(SettingsService settingsService,MessageService messageService,UserService userService) {
        this.settingsService = settingsService;
        this.messageService = messageService;
        this.userService = userService;
    }


    @MessageMapping("/chat/{reciverId}/{senderId}")
    @SendTo("/chat/{reciverId}/ctoa")
    public Message greeting(@DestinationVariable String reciverId, @DestinationVariable String senderId, Message message,Authentication authentication)  {
        if(authentication!=null){
            User user = userService.findByPhoneNumber(authentication.getName());
            message.setUser(user);
            message.setFromAdmin(authentication.getAuthorities().stream().anyMatch(p->p.getAuthority().startsWith("ROLE_ADMIN")));
            message.setCustomerUniq(user.getId().toString());
        }else{
            message.setCustomerUniq(senderId);
        }
        messageService.save(message);
        return message;
    }

    @GetMapping("/message")
    public String messages(Authentication authentication, Model model) {
        List<Message> messages = messageService.getUsersAndLastMessages();
        model.addAttribute("LastMessages", messages);
        return "template/admin/message/message";
    }
}
