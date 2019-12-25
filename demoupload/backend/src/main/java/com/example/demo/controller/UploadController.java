package com.example.demo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@RestController
public class UploadController {
	
	
	@PostMapping(path = "/upload", headers = "content-type=multipart/form-data")
	public String helloWorldBean(@ModelAttribute DemoDto dto) {
	       System.out.println(dto);
	       System.out.println(dto.getName());
//	       System.out.println(file[1].getOriginalFilename());
	//      System.out.println(dataType);
		return "hello";
	}	
}
