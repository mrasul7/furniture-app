package com.furniture.app.service;

import com.furniture.app.model.Request;
import com.furniture.app.model.User;
import com.furniture.app.model.Product;
import com.furniture.app.repository.RequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class RequestService {
    @Autowired
    private RequestRepository requestRepository;
    
    public Request createRequest(Request request) {
        request.setStatus("PENDING");
        return requestRepository.save(request);
    }
    
    public boolean canUserRequestProduct(User user, Product product) {
        LocalDateTime oneDayAgo = LocalDateTime.now().minusDays(1);
        Optional<Request> existingRequest = requestRepository
            .findByUserAndProductAndRequestDateAfter(user, product, oneDayAgo);
        return existingRequest.isEmpty();
    }
    
    public List<Request> getAllRequests() {
        return requestRepository.findAll();
    }
    
    public Optional<Request> getRequestById(Long id) {
        return requestRepository.findById(id);
    }
    
    public Request updateRequestStatus(Long id, String status) {
        return requestRepository.findById(id).map(request -> {
            request.setStatus(status);
            return requestRepository.save(request);
        }).orElse(null);
    }
    
    public List<Request> getRequestsByStatus(String status) {
        return requestRepository.findAll().stream()
            .filter(request -> request.getStatus() != null && request.getStatus().equals(status))
            .collect(Collectors.toList());
    }
    
    public void deleteRequestsByUserId(Long userId) {
        List<Request> userRequests = requestRepository.findAll().stream()
            .filter(r -> r.getUser() != null && r.getUser().getId().equals(userId))
            .collect(Collectors.toList());
        if (!userRequests.isEmpty()) {
            requestRepository.deleteAll(userRequests);
        }
    }
}