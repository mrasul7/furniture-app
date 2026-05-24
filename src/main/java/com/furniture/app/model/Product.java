package com.furniture.app.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String name;
    
    private String description;
    
    private Double price;
    
    private String imageUrl;
    
    private int quantityInStock;
    
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    
    private String manufacturer;
    
    private String manufacturerPhone;
    
    private String manufacturerEmail;
    
    private String type;
    
    private String color;
    
    private String material;
    
    private boolean active = true;
    
    @JsonIgnore
    private LocalDateTime createdAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}