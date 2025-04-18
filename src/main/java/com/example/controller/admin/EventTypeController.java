package com.example.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.entity.EventTypeEntity;
import com.example.repository.EventRepository;

@Controller
public class EventTypeController {

	@Autowired
	EventRepository repoevent;
	
	@GetMapping("eventtype")
    public String eventtype(Model model) {
    	
    	
    	List<EventTypeEntity> events = repoevent.findAll();
		model.addAttribute("allevent", events);
		
		return "ListEventType";
    }
	
	@PostMapping("saveevent")
	public String savecity(EventTypeEntity event, Model model) 
	{
		
		repoevent.save(event);
		
		List<EventTypeEntity> events = repoevent.findAll();
		model.addAttribute("allevent", events);
		
		return "ListEventType";  
	}
	
	@GetMapping("deleteeventtype")
	public String deleteeventtypes(Integer eventId) {
		repoevent.deleteById(eventId);
		return "redirect:/eventtype";
	}
	
	
	
	
}
