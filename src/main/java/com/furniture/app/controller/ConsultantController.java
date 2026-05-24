package com.furniture.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/consultant")
public class ConsultantController {
    
    @GetMapping
    public String consultantPanel() {
        return "consultant";
    }
}