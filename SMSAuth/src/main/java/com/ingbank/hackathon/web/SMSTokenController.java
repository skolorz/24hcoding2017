package com.ingbank.hackathon.web;

import com.ingbank.hackathon.dao.domain.TransactionRequest;
import com.ingbank.hackathon.dao.repository.TransactionRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/sms")
public class SMSTokenController {

    @Autowired
    private TransactionRequestRepository transactionRequestRepository;

    @GetMapping("/token")
    public List<TransactionRequest> getTokens() {
        return transactionRequestRepository.getTokens();
    }

}
