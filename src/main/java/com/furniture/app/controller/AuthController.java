package com.furniture.app.controller;

import com.furniture.app.dto.UserDto;
import com.furniture.app.model.User;
import com.furniture.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AuthController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/login")
    public String loginPage() {
        return "index";
    }
    
    @GetMapping("/register")
    public String registerPage() {
        return "index";
    }
    
    @PostMapping("/auth/login")
    @ResponseBody
    public ResponseEntity<?> login(@RequestBody Map<String, String> credentials, HttpSession session) {
        String email = credentials.get("username");
        String password = credentials.get("password");
        
        User user = userService.findByEmail(email).orElse(null);
        
        if (user != null && user.getPassword().equals(password)) {
            if (user.isBlocked()) {
                return ResponseEntity.status(403).body("User is blocked");
            }
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("userRole", user.getRole().name());
            
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("role", user.getRole().name());
            return ResponseEntity.ok(response);
        }
        
        return ResponseEntity.status(401).body("Invalid credentials");
    }
    
    @PostMapping("/auth/register")
    @ResponseBody
    public ResponseEntity<?> registerUser(@RequestBody UserDto userDto) {
        if (userService.findByEmail(userDto.getEmail()).isPresent()) {
            return ResponseEntity.badRequest().body("Email already exists");
        }
        
        User user = new User();
        user.setFullName(userDto.getFullName());
        user.setEmail(userDto.getEmail());
        user.setPhone(userDto.getPhone());
        user.setPassword(userDto.getPassword());
        
        userService.registerUser(user);
        return ResponseEntity.ok("Registration successful");
    }
    
    @PostMapping("/auth/logout")
    @ResponseBody
    public ResponseEntity<?> logout(HttpSession session) {
        session.invalidate();
        return ResponseEntity.ok().build();
    }
    
    @GetMapping("/api/user/status")
    @ResponseBody
    public Map<String, Object> getUserStatus(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        User user = (User) session.getAttribute("user");
        
        if (user != null) {
            response.put("authenticated", true);
            response.put("email", user.getEmail());
            response.put("role", user.getRole().name());
        } else {
            response.put("authenticated", false);
        }
        return response;
    }
    
    @GetMapping("/api/user/role")
    @ResponseBody
    public Map<String, Object> getUserRole(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            response.put("authenticated", true);
            response.put("role", user.getRole().name());
        } else {
            response.put("authenticated", false);
        }
        return response;
    }
    
    @GetMapping("/api/user/profile")
    @ResponseBody
    public User getUserProfile(HttpSession session) {
        return (User) session.getAttribute("user");
    }
}