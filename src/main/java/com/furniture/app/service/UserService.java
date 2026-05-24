package com.furniture.app.service;

import com.furniture.app.model.User;
import com.furniture.app.model.Role;
import com.furniture.app.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    public User registerUser(User user) {
        if (user.getRole() == null) {
            user.setRole(Role.CLIENT);
        }
        user.setBlocked(false);
        return userRepository.save(user);
    }
    
    public Optional<User> findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    public User saveUser(User user) {
        return userRepository.save(user);
    }
    
    public void blockUser(Long userId) {
        userRepository.findById(userId).ifPresent(user -> {
            user.setBlocked(true);
            userRepository.save(user);
        });
    }
    
    public void unblockUser(Long userId) {
        userRepository.findById(userId).ifPresent(user -> {
            user.setBlocked(false);
            userRepository.save(user);
        });
    }
    
    public void deleteUser(Long userId) {
        userRepository.deleteById(userId);
    }
    
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }
}