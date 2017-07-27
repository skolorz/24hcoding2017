package com.ingbank.hackathon.web;

import com.ingbank.hackathon.dao.domain.UserStatusEnum;
import com.ingbank.hackathon.dao.domain.Users;
import com.ingbank.hackathon.dao.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
public class LoginTokenController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    private String doc () {
        return "index";
    }

    @GetMapping("/confirmation")
    private String verify(@RequestParam String token, Map<String, Object> model) {
        Optional<Users> user = userRepository.findByToken(token);
        if (!user.isPresent()) {
            return "error";
        }
        model.put("user", user.get());
        return "user";
    }

    @GetMapping("/confirmation/admin")
    private String admin(@RequestParam String token, Map<String, Object> model) {
        Optional<Users> user = userRepository.findByToken(token);
        if (!user.isPresent() || !user.get().getAdmin()) {
            return "error";
        }

        List<Users> users = userRepository.findAllSorted();
        long confirmed = users.stream().filter(u -> u.getStatus().equals(UserStatusEnum.CONFIRMED)).count();
        long declined = users.stream().filter(u -> u.getStatus().equals(UserStatusEnum.DECLINED)).count();
        model.put("confirmedPart", String.format("%s | %s / %s", confirmed, declined, users.size()));

        model.put("users", users);
        return "admin";
    }

    @PostMapping("/confirmation/confirm")
    private String index(@RequestParam String token, Map<String, Object> model) {
        Optional<Users> user = userRepository.findByToken(token);
        if (!user.isPresent()) {
            return "error";
        }
        if (user.get().getStatus().equals(UserStatusEnum.WAITING)) {
            user.get().setStatus(UserStatusEnum.CONFIRMED);
            user.get().setUpdatedAt(new Date());
            userRepository.save(user.get());
        }

        model.put("user", user.get());
        return "redirect:/confirmation?token=" + user.get().getToken();
    }

    @PostMapping("/confirmation/decline")
    private String decline(@RequestParam String token, Map<String, Object> model) {
        Optional<Users> user = userRepository.findByToken(token);
        if (!user.isPresent()) {
            return "error";
        }

        if (!user.get().getStatus().equals(UserStatusEnum.DECLINED)) {
            user.get().setStatus(UserStatusEnum.DECLINED);
            user.get().setUpdatedAt(new Date());
            userRepository.save(user.get());
        }
        model.put("user", user.get());
        return "redirect:/confirmation?token=" + user.get().getToken();
    }
}
