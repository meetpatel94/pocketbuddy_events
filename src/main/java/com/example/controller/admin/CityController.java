package com.example.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.entity.StateEntity;
import com.example.repository.StateRepository;


@Controller
public class CityController {
	/*
	 * @Autowired CityRepository repoCity;
	 */
	@Autowired
	StateRepository repostate;
	
	@GetMapping("newcity")
	public String newcity(Model model) {
		
		List<StateEntity> allstate = repostate.findAll();
		model.addAttribute("allstate", allstate);
		return "NewCity";
	}
	
}


