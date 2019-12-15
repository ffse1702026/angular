package com.boraji.tutorial.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

   @GetMapping("/")
   public String index() {
      return "index";
   }
}