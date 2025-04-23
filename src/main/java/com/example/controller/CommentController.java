package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.CityEntity;
import com.example.entity.CommentEntity;
import com.example.entity.CreateEventsEntity;
import com.example.entity.StaEntity;
import com.example.repository.CityRepository;
import com.example.repository.CommentRepository;
import com.example.repository.CreateEventsRepository;
import com.example.repository.StaRepository;

@Controller
public class CommentController {
	
	@Autowired
	CommentRepository repoComment;
	
	@Autowired
	CityRepository repocity;
	
	@Autowired
	StaRepository reposta;
	
	@Autowired
	CreateEventsRepository repoevent;;

	@GetMapping("comment")
	public String comment() {
		return "Home";	
	}
	
	@PostMapping("savecomments")
	public String savecomments(CommentEntity entityComment,Model model) {
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		
		repoComment.save(entityComment);
		return "Home";
	}
	
	@GetMapping("commentspage")
	public String commentspage(Model model) {
		
		List<CommentEntity> commentList = repoComment.findAll();
		model.addAttribute("comments", commentList);
		
		return "CommentsPage";
	}
	
	
	
	@GetMapping("deletecomments")
	public String deletecomments(Integer commentUserId) {
		repoComment.deleteById(commentUserId);
		return "redirect:/commentspage";
	}
}
