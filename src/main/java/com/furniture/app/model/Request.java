package com.furniture.app.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "requests")
public class Request {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;
    
    private String fullName;
    
    private String phone;
    
    private String email;
    
    private String status = "PENDING";
    
    private LocalDateTime requestDate;
    
    @PrePersist
    protected void onCreate() {
        requestDate = LocalDateTime.now();
    }
}