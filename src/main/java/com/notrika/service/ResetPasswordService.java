package com.notrika.service;

import com.notrika.entity.ResetPassword;
import com.notrika.entity.User;
import com.notrika.repository.DAO;
import com.notrika.repository.ResetPasswordRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ResetPasswordService implements DAO<ResetPassword> {
    private final ResetPasswordRepository resetPasswordRepo;

    @Autowired
    public ResetPasswordService(ResetPasswordRepository resetPasswordRepo) {
        this.resetPasswordRepo = resetPasswordRepo;
    }

    @Override
    public List<ResetPassword> findAll() {
        return resetPasswordRepo.findAll();
    }

    @Override
    public ResetPassword findById(Long id) {
        return resetPasswordRepo.findById(id).get();
    }

    @Override
    public void save(ResetPassword vo) {
        resetPasswordRepo.save(vo);
    }

    @Override
    public void delete(Long id) {
        resetPasswordRepo.deleteById(id);
    }

    public ResetPassword findByUser(User user){
        return resetPasswordRepo.findByUser(user);
    }

    public ResetPassword findByResetToken(String token){
        return resetPasswordRepo.findByResetToken(token);
    }

}
