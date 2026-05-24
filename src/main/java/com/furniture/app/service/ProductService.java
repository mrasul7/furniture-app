package com.furniture.app.service;

import com.furniture.app.model.Product;
import com.furniture.app.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
    public Optional<Product> getProductById(Long id) {
        return productRepository.findById(id);
    }
    
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }
    
    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }
    
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
    
    public List<Product> searchProducts(String keyword) {
        String keywordLower = keyword.toLowerCase();
        return productRepository.findAll().stream()
            .filter(p -> (p.getName() != null && p.getName().toLowerCase().contains(keywordLower)) ||
                        (p.getDescription() != null && p.getDescription().toLowerCase().contains(keywordLower)))
            .collect(Collectors.toList());
    }
    
    public List<Product> filterByCategory(Long categoryId) {
        return productRepository.findAll().stream()
            .filter(p -> p.getCategory() != null && p.getCategory().getId().equals(categoryId))
            .collect(Collectors.toList());
    }
    
    public List<String> getAllManufacturers() {
        return productRepository.findAll().stream()
            .map(Product::getManufacturer)
            .filter(m -> m != null && !m.isEmpty())
            .distinct()
            .collect(Collectors.toList());
    }
}