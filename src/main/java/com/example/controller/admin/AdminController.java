package com.example.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.entity.UserEntity;
import com.example.repository.UserRepository;

@Controller
public class AdminController {

	@Autowired
	UserRepository repoUser;
	
    @GetMapping("admindashboard")
	public  String admindashboard() {
		return "AdminDashboard";
	}
    
    
    @GetMapping("listuser")
	public  String listuser(Model model) {
    	
    List<UserEntity> users = repoUser.findAll();	
	model.addAttribute("users", users);	
		return "ListUser";
	}
    
    @GetMapping("adduser")
    public String addUser() {
    	return "AddUser";
    }
}
