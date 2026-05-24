package com.furniture.app.controller;

import com.furniture.app.model.Product;
import com.furniture.app.model.Category;
import com.furniture.app.service.ProductService;
import com.furniture.app.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CatalogController {
    
    @Autowired
    private ProductService productService;
    
    @Autowired
    private CategoryService categoryService;
    
    @GetMapping("/catalog")
    public String catalogPage(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "catalog";
    }
    
    @GetMapping("/api/products")
    @ResponseBody
    public List<Product> getProducts(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) Long category) {
        System.out.println("=== API /api/products CALLED ===");
        System.out.println("Search: " + search);
        System.out.println("Category: " + category);
        
        List<Product> products;
        if (search != null && !search.isEmpty()) {
            products = productService.searchProducts(search);
        } else if (category != null) {
            products = productService.filterByCategory(category);
        } else {
            products = productService.getAllProducts();
        }
        
        System.out.println("Products found: " + products.size());
        return products;
    }
    
    @GetMapping("/api/products/filter")
    @ResponseBody
    public List<Product> filterProducts(
            @RequestParam(required = false) String search,
            @RequestParam(required = false) Long category,
            @RequestParam(required = false) String type,
            @RequestParam(required = false) String manufacturer,
            @RequestParam(required = false) Double priceMin,
            @RequestParam(required = false) Double priceMax,
            @RequestParam(required = false) String color,
            @RequestParam(required = false) String materials,
            @RequestParam(required = false) Boolean inStockOnly) {
        
        System.out.println("=== API /api/products/filter CALLED ===");
        
        List<Product> products = productService.getAllProducts();
        
        // Фильтр по поиску
        if (search != null && !search.isEmpty()) {
            String searchLower = search.toLowerCase();
            products = products.stream()
                .filter(p -> (p.getName() != null && p.getName().toLowerCase().contains(searchLower)) ||
                            (p.getDescription() != null && p.getDescription().toLowerCase().contains(searchLower)))
                .collect(Collectors.toList());
        }
        
        // Фильтр по категории
        if (category != null) {
            products = products.stream()
                .filter(p -> p.getCategory() != null && p.getCategory().getId().equals(category))
                .collect(Collectors.toList());
        }
        
        // Фильтр по типу
        if (type != null && !type.isEmpty()) {
            products = products.stream()
                .filter(p -> p.getType() != null && p.getType().equals(type))
                .collect(Collectors.toList());
        }
        
        // Фильтр по производителю
        if (manufacturer != null && !manufacturer.isEmpty()) {
            products = products.stream()
                .filter(p -> p.getManufacturer() != null && p.getManufacturer().equals(manufacturer))
                .collect(Collectors.toList());
        }
        
        // Фильтр по цене
        if (priceMin != null) {
            products = products.stream()
                .filter(p -> p.getPrice() >= priceMin)
                .collect(Collectors.toList());
        }
        if (priceMax != null) {
            products = products.stream()
                .filter(p -> p.getPrice() <= priceMax)
                .collect(Collectors.toList());
        }
        
        // Фильтр по цвету
        if (color != null && !color.isEmpty()) {
            products = products.stream()
                .filter(p -> p.getColor() != null && p.getColor().equals(color))
                .collect(Collectors.toList());
        }
        
        // Фильтр по материалам
        if (materials != null && !materials.isEmpty()) {
            String[] materialArray = materials.split(",");
            products = products.stream()
                .filter(p -> {
                    if (p.getMaterial() == null) return false;
                    for (String m : materialArray) {
                        if (p.getMaterial().contains(m)) return true;
                    }
                    return false;
                })
                .collect(Collectors.toList());
        }
        
        // Фильтр по наличию
        if (inStockOnly != null && inStockOnly) {
            products = products.stream()
                .filter(p -> p.getQuantityInStock() > 0)
                .collect(Collectors.toList());
        }
        
        System.out.println("Filtered products found: " + products.size());
        return products;
    }
    
    @GetMapping("/api/products/{id}")
    @ResponseBody
    public Product getProduct(@PathVariable Long id) {
        System.out.println("=== API /api/products/" + id + " CALLED ===");
        return productService.getProductById(id).orElse(null);
    }
    
    @GetMapping("/api/categories")
    @ResponseBody
    public List<Category> getCategories() {
        System.out.println("=== API /api/categories CALLED ===");
        return categoryService.getAllCategories();
    }
    
    @GetMapping("/api/products/manufacturers")
    @ResponseBody
    public List<String> getManufacturers() {
        System.out.println("=== API /api/products/manufacturers CALLED ===");
        return productService.getAllProducts().stream()
            .map(Product::getManufacturer)
            .filter(m -> m != null && !m.isEmpty())
            .distinct()
            .collect(Collectors.toList());
    }
}