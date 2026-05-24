package com.furniture.app.controller;

import com.furniture.app.model.User;
import com.furniture.app.service.UserService;
import com.furniture.app.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/super-admin")
public class SuperAdminController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RequestService requestService;
    
    @GetMapping
    public String superAdminPanel(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "super-admin";
    }
    
    @PostMapping("/users/block/{id}")
    @ResponseBody
    public ResponseEntity<?> blockUser(@PathVariable Long id) {
        userService.blockUser(id);
        return ResponseEntity.ok().build();
    }
    
    @PostMapping("/users/unblock/{id}")
    @ResponseBody
    public ResponseEntity<?> unblockUser(@PathVariable Long id) {
        userService.unblockUser(id);
        return ResponseEntity.ok().build();
    }
    
    @DeleteMapping("/users/delete/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteUser(@PathVariable Long id) {
        return userService.findById(id).map(user -> {
            if (user.getRole() == com.furniture.app.model.Role.SUPER_ADMIN) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Cannot delete super admin");
            }
            requestService.deleteRequestsByUserId(id);
            userService.deleteUser(id);
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found"));
    }
    
    @PostMapping("/users/reset-password/{id}")
    @ResponseBody
    public ResponseEntity<?> resetPassword(@PathVariable Long id, @RequestParam String newPassword) {
        return userService.findById(id).map(user -> {
            user.setPassword(newPassword);
            userService.saveUser(user);
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found"));
    }
    
    @PutMapping("/users/role/{id}")
    @ResponseBody
    public ResponseEntity<?> updateUserRole(@PathVariable Long id, @RequestParam String role) {
        return userService.findById(id).map(user -> {
            if (user.getRole() == com.furniture.app.model.Role.SUPER_ADMIN) {
                return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Cannot change super admin role");
            }
            user.setRole(com.furniture.app.model.Role.valueOf(role));
            userService.saveUser(user);
            return ResponseEntity.ok().build();
        }).orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found"));
    }
}