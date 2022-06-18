package com.notrika.controller.admin.message;

import com.notrika.entity.tables.Menu;
import com.notrika.entity.tables.Message;
import com.notrika.service.MenuService;
import com.notrika.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/api", produces = "application/json", headers = "Accept=*/*")
@CrossOrigin(origins = "*")
public class AdminMessageRController {


    private final MessageService messageService;

    @Autowired
    public AdminMessageRController(MessageService _messageService) {
        this.messageService = _messageService;
    }


    @GetMapping("/messages/getLatestList")
    public List<Message> readAll(Authentication authentication, Model model) {
        List<Message> messages = messageService.getUsersAndLastMessages();
        return messages;
    }
    @GetMapping("/messages/readAll")
    public void readAll(@RequestParam("id") String id, Authentication authentication, Model model) {
        messageService.readAllMessages(id);
    }

    @GetMapping("/messages/ChatHistory")
    public List<Message> ChatHistory(String userUnique, Authentication authentication, Model model) {
        List<Message> messages = messageService.getMessagesOfUser(userUnique);
        return messages;
    }
}
