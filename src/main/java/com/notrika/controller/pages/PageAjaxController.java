package com.notrika.controller.pages;

import com.notrika.entity.User;
import com.notrika.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping(path = "/rest", produces = "application/json")
@CrossOrigin(origins = "*")
public class PageAjaxController {

    @Autowired
    private UserRepository repo;

    @GetMapping
    public List<User> userHomePage(@RequestParam(name = "phoneNumber", required = false) String phoneNumber) {
        System.err.println(phoneNumber);
        List<User> u = new ArrayList<>();
        if (phoneNumber != null) {
            u.add(repo.findByPhoneNumber(phoneNumber));
            return u;
        }
        return repo.findAll();
    }


    @GetMapping("/checkbox")
    public List<User> userCheckboxHomePage(@RequestParam(name = "listPhoneNumber", required = false) List<String> listPhoneNumber) {
        System.err.println(listPhoneNumber);
        List<User> u = new ArrayList<>();

        if (listPhoneNumber != null) {
            listPhoneNumber.forEach(listUser -> u.add(repo.findByPhoneNumber(listUser)));
            return u;
        }
        return repo.findAll();
    }

}
