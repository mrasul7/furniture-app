package com.furniture.app.controller;

import com.furniture.app.model.User;
import com.furniture.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/super-admin")
public class SuperAdminController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping
    public String superAdminPanel(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "super-admin";
    }
    
    @PostMapping("/users/block/{id}")
    @ResponseBody
    public String blockUser(@PathVariable Long id) {
        userService.blockUser(id);
        return "User blocked";
    }
    
    @PostMapping("/users/unblock/{id}")
    @ResponseBody
    public String unblockUser(@PathVariable Long id) {
        userService.unblockUser(id);
        return "User unblocked";
    }
    
    @DeleteMapping("/users/delete/{id}")
    @ResponseBody
    public String deleteUser(@PathVariable Long id) {
        userService.deleteUser(id);
        return "User deleted";
    }
    
    @PutMapping("/users/role/{id}")
    @ResponseBody
    public String updateUserRole(@PathVariable Long id, @RequestParam String role) {
        userService.findById(id).ifPresent(user -> {
            user.setRole(com.furniture.app.model.Role.valueOf(role));
            userService.saveUser(user);
        });
        return "Role updated";
    }
}