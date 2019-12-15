package com.infini.b2e.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CorporateController extends BaseController {
    
    @RequestMapping("/corporate")
    public ModelAndView search() {
        initView("layout");
        return view;
    }
}
