package com.example.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.StaEntity;
import com.example.repository.StaRepository;

@Controller
public class StaController {
	
	@Autowired
	StaRepository reposta;

	@GetMapping("newsta")
	public String ste(Model model) {
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allsta", allsta);
		
		return "NewState";
	}
	
	@PostMapping("savesta")
    public String savesta(StaEntity entity,Model model) {
		 
		
		reposta.save(entity);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allsta", allsta);
		
		return "NewState";
	}
	
	@GetMapping("deletesta")
	public String deletesta(Integer staId) {
		reposta.deleteById(staId);
		return "redirect:/newsta";
	}
}
