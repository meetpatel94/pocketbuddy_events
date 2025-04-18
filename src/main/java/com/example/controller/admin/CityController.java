package com.example.controller.admin;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.CityEntity;
import com.example.entity.EventTypeEntity;
import com.example.entity.StaEntity;

import com.example.repository.CityRepository;
import com.example.repository.EventRepository;
import com.example.repository.StaRepository;



@Controller
public class CityController {
	/*
	 * @Autowired CityRepository repoCity;
	 */
	@Autowired
	StaRepository reposta;
	
	@Autowired
	CityRepository repocity;
	
	@Autowired
	EventRepository repoevent;
	
	
	@GetMapping("newcity")
	public String newcity(Model model) {
		
		List<StaEntity> allstate = reposta.findAll();
		model.addAttribute("allstate", allstate);
		return "NewCity";
	}
	
	@PostMapping("savecity")
	public String savecity(CityEntity city, Model model) 
	{
		/* System.out.println(state.getStateName()); */
		repocity.save(city);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevent.findAll();
		model.addAttribute("allevent", events);
		
		return "ADMINcreateEvents";  
	}
	
	@PostMapping("savcity")
	public String savcity(CityEntity city, Model model) 
	{
		/* System.out.println(state.getStateName()); */
		repocity.save(city);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity); 
		
		List<EventTypeEntity> events = repoevent.findAll();
		model.addAttribute("allevent", events);
		
		return "redirect:/viewcities";  
	}
	
	
	
	
	@GetMapping("viewcities")
	public String viewcities(Model model) {
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		return "viewcities";
	}
	
	@GetMapping("deletecity")
	public String deletecity(Integer cityId) {
		repocity.deleteById(cityId);
		return "redirect:/viewcities";
	}
}


