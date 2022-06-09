package com.notrika.service;

import com.notrika.entity.User;
import com.notrika.entity.UserDetail;
import com.notrika.repository.UserRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService implements UserDetailsService {

    private final UserRepository userRepo;

    @Autowired
    public UserService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    public List<User> findAll(){
    	return userRepo.findAll();
    }

    public User findById(Long id) {
        return userRepo.findById(id).get();
    }
    
    public void saveUser(User userD) {
    	System.out.println(userD);
    	userRepo.save(userD);
    }
    
    @Override
    public UserDetails loadUserByUsername(String phoneNumber) throws UsernameNotFoundException {
        User user = userRepo.findByPhoneNumber(phoneNumber);
        if (user == null) {
            throw new UsernameNotFoundException("User "+phoneNumber+" not found!");
        }
        return new UserDetail(user);
    }

    public void processUserOAuth(String phoneNumber) {
        int existUser = userRepo.countByPhoneNumber(phoneNumber);
        if (existUser == 0) {
            User newUser = new User();
            newUser.setRole("ROLE_USER");
            newUser.setPhoneNumber(phoneNumber);
            newUser.setEnabled(true);
            userRepo.save(newUser);
        }
    }


    public User findByPhoneNumber(String phoneNumber) {
        return userRepo.findByPhoneNumber(phoneNumber);
    }
}
