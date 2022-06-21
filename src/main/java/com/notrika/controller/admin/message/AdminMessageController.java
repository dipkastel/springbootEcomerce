package com.notrika.controller.admin.message;

import com.notrika.entity.tables.Message;
import com.notrika.entity.tables.SiteVisit;
import com.notrika.service.MessageService;
import com.notrika.service.SettingsService;
import com.notrika.service.SiteVisitService;
import com.notrika.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminMessageController {

    private final SettingsService settingsService;
    private final UserService userService;
    private final MessageService messageService;
    private final SiteVisitService siteVisitService;


    @Autowired
    public AdminMessageController(SettingsService settingsService, MessageService messageService, UserService userService,SiteVisitService siteVisitService) {
        this.settingsService = settingsService;
        this.messageService = messageService;
        this.userService = userService;
        this.siteVisitService = siteVisitService;
    }


    @MessageMapping("/siteChat/{senderId}")
    @SendTo({"/chat/siteChat/admin", "/chat/siteChat/{senderId}"})
    public Message chat(@DestinationVariable String senderId, Message message, Authentication authentication) {
        messageService.save(message);
        return message;
    }
    @MessageMapping("/siteChatDelivery/{senderId}")
    @SendTo({"/chat/siteChat/admin", "/chat/siteChat/{senderId}"})
    public Message delivery(@DestinationVariable String senderId, Message message, Authentication authentication) {
        Message m =  messageService.findById(Long.parseLong(message.getMessage()));
        m.setStatus("deliverd");
        messageService.save(m);
        return message;
    }
    @MessageMapping("/siteChatRead/{senderId}")
    @SendTo({"/chat/siteChat/admin", "/chat/siteChat/{senderId}"})
    public Message readMessage(@DestinationVariable String senderId, Message message, Authentication authentication) {
        Message m =  messageService.findById(Long.parseLong(message.getMessage()));
        m.setStatus("read");
        messageService.save(m);
        return message;
    }
    @MessageMapping("/siteVisit")
    @SendTo("/chat/siteChat/admin")
    public SiteVisit siteVisit(SiteVisit siteVisit, Authentication authentication) {
        siteVisitService.save(siteVisit);
        return siteVisit;
    }
//
//    @MessageMapping("/toclient/{reciverId}/{type}")
//    @SendTo({"/chat/{reciverId}","/chat/admin"})
//    public Message fromAdmin(@DestinationVariable String reciverId, @DestinationVariable MessageType type, Message message, Authentication authentication) {
//        User user = userService.findByPhoneNumber(authentication.getName());
//        message.setUser(user);
//        message.setFromAdmin(authentication.getAuthorities().stream().anyMatch(p -> p.getAuthority().startsWith("ROLE_ADMIN")));
//        message.setCustomerUniq(authentication.getName());
//        message.setDestination(reciverId);
//        messageService.save(message);
//        if (message.isFromAdmin())
//            message.setCustomerUniq("پشتیبان سایت");
//        return message;
//    }


    @GetMapping("/admin/message")
    public String messages(Authentication authentication, Model model) {
        return "template/admin/message/message";
    }

}
