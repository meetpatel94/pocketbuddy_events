package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.BuyTicketEntity;
import com.example.entity.MemberEntity;
import com.example.repository.BuyTicketRepository;

@Controller
public class BuyTicketController {
    
	@Autowired
	BuyTicketRepository repoTicketBuy;
	
	@PostMapping("buyticket")
	public String buyticket( BuyTicketEntity ticketBuyerEntity) {
		
		repoTicketBuy.save(ticketBuyerEntity);
		return "Home";
	}
	
	@GetMapping("listbuyers")
	public String listbuyers(Model model) {
		
		List<BuyTicketEntity> buyerList = repoTicketBuy.findAll();
		model.addAttribute("buyer", buyerList);
						
		return "ListTicketBuyer";
	}
}
