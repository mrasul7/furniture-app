package com.furniture.app.controller;

import com.furniture.app.model.Product;
import com.furniture.app.service.ProductService;
import com.furniture.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @GetMapping
    public String adminPanel(Model model) {
        model.addAttribute("products", productService.getAllProducts());
        model.addAttribute("categories", categoryService.getAllCategories());
        return "admin";
    }
    
    @PostMapping("/products/create")
    @ResponseBody
    public Product createProduct(@RequestBody Product product) {
        return productService.createProduct(product);
    }
    
    @PutMapping("/products/update/{id}")
    @ResponseBody
    public Product updateProduct(@PathVariable Long id, @RequestBody Product product) {
        product.setId(id);
        return productService.updateProduct(product);
    }
    
    @DeleteMapping("/products/delete/{id}")
    @ResponseBody
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "Product deleted";
    }
}