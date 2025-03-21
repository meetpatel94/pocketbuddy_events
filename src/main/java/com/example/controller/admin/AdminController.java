package com.example.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.entity.UserEntity;
import com.example.repository.UserRepository;

@Controller
public class AdminController {
	
	@Autowired
	Cloudinary cloudinary;

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
    
    @GetMapping("edituser")
	public String edituser(Integer userId,Model model) {
		
		Optional<UserEntity> op = repoUser.findById(userId);
		if(op.isEmpty()) {
			return "redirect:/listuser";
			
		}else {
			model.addAttribute("user", op.get());
			return "EditUser";
		}	
	}
    
    @PostMapping("updateuser")
	public String updateuser(UserEntity entity, MultipartFile profilePic) {
//		System.out.println(entity.getUserId());
		
		
		Optional<UserEntity> op = repoUser.findById(entity.getUserId());
		
		if(op.isPresent()) {
			
			UserEntity dbuser = op.get();
			dbuser.setFirstName(entity.getFirstName());
			dbuser.setLastName(entity.getLastName());
			dbuser.setGender(entity.getGender());
			dbuser.setEmail(entity.getEmail());
			dbuser.setBornYear(entity.getBornYear());
			dbuser.setContactNum(entity.getContactNum());
			dbuser.setProfilePicPath(entity.getProfilePicPath());
			
			if(profilePic.getOriginalFilename().endsWith(".jpg")) {
				
			} else {
				return "Signup";
				
			} try {
				
			Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
//			System.out.println(result);
//			System.out.println(result.get("url"));
			
			entity.setProfilePicPath(result.get("url").toString());
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			repoUser.save(entity);
		}	
		return "redirect:/listuser";
	}
    
    @GetMapping("contactUs")
    public String contactus() {
    	return "ContactUsPage";
    }
    @GetMapping("events")
    public String events() {
    	return "EventsPage";
    }
}
