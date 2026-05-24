package com.furniture.app.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RequestDto {
    private String fullName;
    private String phone;
    private String email;
    private Long productId;
}