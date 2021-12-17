package com.allnnka.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AmmunitionController {
    @RequestMapping("/")
    public String index() {
        return "index";
    }
}
