package com.springBot.collegeEventManagement;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/events")
public class Controller {

    @GetMapping("/")
    public String Home(){
        return "Welcome to College Event";
    }
}
