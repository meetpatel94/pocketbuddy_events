package com.example.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.RatingEntity;
import com.example.entity.UserEntity;
import com.example.repository.RatingRepository;
import com.example.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class RatingController {

	@Autowired
	RatingRepository repoRate;
	
	@Autowired
	UserRepository repositoryUser;
	
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
	
	@GetMapping("viewrateduser")
	public String viewrateduser(Integer ratingUserId, Model model) {
		Optional<RatingEntity> op = repoRate.findById(ratingUserId);
		if(op.isEmpty()) {
			
		}else {
			RatingEntity user = op.get();
			model.addAttribute("rateduser", user);
		}
		return "ViewRatedUser";
	}
	
	@GetMapping("deleterateduser")
	public String deleterateduser(Integer ratingUserId) {
		repoRate.deleteById(ratingUserId);
		return "redirect:/listrateduser";
	}
}
