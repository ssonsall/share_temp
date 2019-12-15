package com.bitc502.grapemarket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc502.grapemarket.model.Chat;
import com.bitc502.grapemarket.repository.ChatRepository;

@Controller
@RequestMapping("/chat")
public class ChatController {

	
@Autowired
private ChatRepository cRepo;
	
	@PostMapping("/chat")
	public String Chat(Chat chat) {
		
		System.out.println("buyerId : " + chat.getBuyerId().getId());
		
		cRepo.save(chat);
		return "/chat/chat";
	}
}
