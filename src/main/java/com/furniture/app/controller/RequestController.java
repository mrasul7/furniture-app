package com.furniture.app.controller;

import com.furniture.app.dto.RequestDto;
import com.furniture.app.model.Request;
import com.furniture.app.model.User;
import com.furniture.app.model.Product;
import com.furniture.app.service.RequestService;
import com.furniture.app.service.UserService;
import com.furniture.app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api/requests")
public class RequestController {
    
    @Autowired
    private RequestService requestService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private ProductService productService;
    
    @PostMapping("/create")
    public ResponseEntity<?> createRequest(@RequestBody RequestDto requestDto, 
                                          HttpSession session) {
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            return ResponseEntity.status(401).body("Please login first");
        }
        
        if (user.isBlocked()) {
            return ResponseEntity.status(403).body("User is blocked");
        }
        
        Product product = productService.getProductById(requestDto.getProductId()).orElse(null);
        if (product == null) {
            return ResponseEntity.badRequest().body("Product not found");
        }
        
        if (!requestService.canUserRequestProduct(user, product)) {
            return ResponseEntity.badRequest().body("You can only request this product once per day");
        }
        
        Request request = new Request();
        request.setUser(user);
        request.setProduct(product);
        request.setFullName(requestDto.getFullName());
        request.setPhone(requestDto.getPhone());
        request.setEmail(requestDto.getEmail());
        
        requestService.createRequest(request);
        return ResponseEntity.ok("Request submitted successfully");
    }
}