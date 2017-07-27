package com.ingbank.hackathon.web;

import com.ingbank.hackathon.dao.domain.LoginToken;
import com.ingbank.hackathon.dao.repository.LoginTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/login")
public class LoginTokenController {

    @Autowired
    private LoginTokenRepository loginTokenRepository;

    @GetMapping("/token")
    public List<LoginToken> getTokens() {
        return loginTokenRepository.getLoginTokens();
    }

}
