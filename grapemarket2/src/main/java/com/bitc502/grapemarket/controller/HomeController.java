package com.bitc502.grapemarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	//메인 페이지
	@GetMapping("/")
	public String Home() {
		return "index";
	}
	
}
