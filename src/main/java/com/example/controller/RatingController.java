package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.RatingEntity;
import com.example.repository.RatingRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class RatingController {

	@Autowired
	RatingRepository repoRate;
	
	@GetMapping("rating")
	public String rating() {
		return "Rating";
	}
	
	@PostMapping("rateduser")
	public String rateduser(RatingEntity entityRate, HttpSession session) {
		 	
     	repoRate.save(entityRate);
		return "Home";
	}
	
	@GetMapping("listrating")
	public String listrating(Model model) {
		List<RatingEntity> ratedList = repoRate.findAll();
	
		model.addAttribute("ratedList", ratedList);
							
		return "ListRating";
	}
	
	@GetMapping("listrateduser")
	public String listrateduser(Model model) {
		List<Object[]> listRate = repoRate.getAll();
		model.addAttribute("allratedusers", listRate);
		return "ListRating";
	}
	@GetMapping("deleterateduser")
	public String deleterateduser(Integer userId) {
		repoRate.deleteById(userId);
		return "redirect:/listrateduser";
	}
}
