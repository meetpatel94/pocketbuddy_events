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
import com.example.entity.CreateEventsEntity;
import com.example.entity.UserEntity;
import com.example.repository.CreateEventsRepository;
import com.example.repository.MemberRepository;
import com.example.repository.UserRepository;

@Controller
public class AdminController {
	
	@Autowired
	Cloudinary cloudinary;

	@Autowired
	UserRepository repoUser;
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	CreateEventsRepository repoevent;
	
    @GetMapping("admindashboard")
	public  String admindashboard(Model model) {
    	
    	//====> Users
    	//total users
    	Long totalUsers = repoUser.count();
    	
    	Integer totaluser = repoUser.findByRole("USER").size();
    	
    	Integer totalAdmin = repoUser.findByRole("ADMIN").size();
    	
    	model.addAttribute("totaluser", totaluser);
    	
    	//====>Members
    	Long totalMember = memberRepository.count();
    	
    	Integer totalMembers = memberRepository.findByRole("Member").size();
    	
    	model.addAttribute("totalMembers", totalMembers);
    	
		//return "AdminDashboard";
    	return "ADMIN_Dashboard";
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
			
			if(profilePic.getOriginalFilename().endsWith(".jpg") ||
			   profilePic.getOriginalFilename().endsWith(".png")) {
				
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
    @GetMapping("eventshows")
    public String eventshows() {
    	return "EventShows";
    }
    @GetMapping("trendingevent")
    public String trendingevent() {
    	return "TrendingEvents";
    }
    
    
    
    // create event admin side
    
    @GetMapping("createevents")
    public String createevents() {
    	return "ADMINcreateEvents";
    }
    
    @PostMapping("savebusinessevent")
	public String savebusinessevent( CreateEventsEntity eventEntity, MultipartFile profilePic) {
    	System.out.println(profilePic.getOriginalFilename());	
    	if(profilePic.getOriginalFilename().endsWith(".jpg") ||
           profilePic.getOriginalFilename().endsWith(".png")) {
    				
    			} else {
    				return "ADMINcreateEvents";	
    			} try  {
    				
    			Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
//    			System.out.println(result);
//    			System.out.println(result.get("url"));
    			eventEntity.setProfilePicPath(result.get("url").toString());
    			
    			} catch (IOException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    	
		repoevent.save(eventEntity);
		return "redirect:/businessevents";
    }
    
    @GetMapping("businessevents")
	public String businessevents(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
						
		return "ADMINTrendingEvents";
	}
    
}
