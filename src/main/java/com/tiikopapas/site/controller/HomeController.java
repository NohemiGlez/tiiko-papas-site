package com.tiikopapas.site.controller;

import com.tiikopapas.site.service.PropertiesService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Log4j2
@Controller
public class HomeController {

    @Autowired
    PropertiesService systemPropertiesService;

    @GetMapping("/")
    public String getHome(Model model){
        String imagesHostUrl = systemPropertiesService.getImagesHostUrl();
        model.addAttribute("imagesHostUrl", imagesHostUrl);
        return "/home/index.html";
    }
}