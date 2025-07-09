package com.example.controller;

import java.io.IOException;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.Services.MailService;
import com.example.Services.TwilioService;
import com.example.entity.CityEntity;
import com.example.entity.CreateEventsEntity;
import com.example.entity.EventTypeEntity;
import com.example.entity.StaEntity;
import com.example.entity.UserEntity;
import com.example.repository.CityRepository;
import com.example.repository.CreateEventsRepository;
import com.example.repository.EventRepository;
import com.example.repository.StaRepository;
import com.example.repository.UserRepository;


import jakarta.servlet.http.HttpSession;


@Controller
public class SessionController {

	@Autowired
	MailService serviceMail;

	@Autowired
	UserRepository repositoryUser;
	
	@Autowired
	PasswordEncoder encoder; 
	
	@Autowired
	StaRepository reposta;
	
	@Autowired
	CityRepository repocity;
	
	@Autowired
	Cloudinary cloudinary; 
	
	@Autowired
	CreateEventsRepository repoevent;
	
	@Autowired
	EventRepository repoevents;
	
	@Autowired
	TwilioService twilioService;


	@GetMapping( "login" )
	public String login(String email, String password) {
		return "Login";
	}
	
	@GetMapping("signup") 
	public String signup() {
		return "Signup";
	}

	@PostMapping("saveuser")
	public String saveuser(UserEntity userEntity, MultipartFile profilePic) {
			
		// cloudinary - photo upload
		//System.out.println(profilePic.getOriginalFilename());	
		if(profilePic.getOriginalFilename().endsWith(".jpg") ||
		   profilePic.getOriginalFilename().endsWith(".png") ||
		   profilePic.getOriginalFilename().endsWith(".webp")) {
			
		} else {
			return "Signup";	
		} try  {
			
		Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
//		System.out.println(result);
//		System.out.println(result.get("url"));
		userEntity.setProfilePicPath(result.get("url").toString());
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Bcrypt
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(5);     //salt
//------->  Not use this line new keyword because it's gain more memory
		
		String encPassword = encoder.encode(userEntity.getPassword());
		userEntity.setPassword(encPassword);
		
		//set role user
		userEntity.setRole("USER"); 
		
		//save data in table
		repositoryUser.save(userEntity);
		
		//send welcome main after user signup
		serviceMail.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
		return "Login";
	}
	
	
	@PostMapping("authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
		System.out.println("Email: "+ email);
		System.out.println("Password: "+password);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		//check data coming or not
		if(op.isPresent()) {
			
			UserEntity dbUsers = op.get();
			
			boolean ans = encoder.matches(password, dbUsers.getPassword());
			if(ans==true) {
				
				session.setAttribute("user", dbUsers);   // use session when login
				
				if(dbUsers.getRole().equals("ADMIN")) {
					return "redirect:/admindashboard?login=success";
					
				}else if(dbUsers.getRole().equals("USER")) {
					return "redirect:/home?login=success";
					
				}else {
					model.addAttribute("error", "Please contact Admin with error code #98433");
					return "Login";	
				}	
			}	
		}

		model.addAttribute("error", "<i class='bx bxs-error-circle'></i>Invalid Email Or Password");
		return "Login";	
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@GetMapping("viewuser")
	public String viewuser(Integer userId, Model model) {
		System.out.println("view Member Id:"+userId);
		Optional<UserEntity> op = repositoryUser.findById(userId);
		if(op.isEmpty()) {
			
		}else {
			UserEntity user = op.get();
			model.addAttribute("user", user);
		}
		return "ViewPage";
	}
	
	@GetMapping("header")
	public String header(Model model) {
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "Header";
	}
	

	@GetMapping("deleteuser")
	public String deleteuser(Integer userId) {
		repositoryUser.deleteById(userId);
		return "redirect:/listuser";
	}
	
	@GetMapping("forgetpassword")
	public String forgetPassword() {
		return "ForgetPassword";
	}
	
	@GetMapping("changepassword")
	public String changePassword() {
		return "ChangePassword";
	}

	//===> SEND OTP
	@PostMapping("sendOtp")
	public String sendOtp(String email, Model model) {
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		if(op.isEmpty()) {
			
			model.addAttribute("error", "<i class='bx bxs-error-circle'></i>Email Not Found");
			return "ForgetPassword";
		}else {
			//--> email valid   //--> send mail otp
			//--> otp generate 
			String otp = "";
			otp = (int) (Math.random() * 1000000  ) + ""; // 0 to 1
			
			UserEntity user = op.get();
			user.setOtp(otp);
			repositoryUser.save(user);
			serviceMail.sendOtpForForgetPassword(email, user.getFirstName(), otp);
			return "redirect:/changepassword?login=success";
		} 		 
	}

	//=====>Update/Change Password
	@PostMapping("updatepassword")
	public String updatePassword(String email, String password, String otp, Model model) {
		Optional<UserEntity>  op = repositoryUser.findByEmail(email);
		
		if(op.isEmpty()) {
			model.addAttribute("error", "Invalid Data");
			return "ChangePassword";
		
		}else  {
			UserEntity user = op.get();
			if(user.getOtp().equals(otp)) {
				String encPwd = encoder.encode(password);
				user.setPassword(encPwd);
				user.setOtp("");
				repositoryUser.save(user);
				
			}else {
				model.addAttribute("error", "Invalid data");
				return "ChangePassword";
			}
		}
		model.addAttribute("msg", "Password Succesfully Updated");
		return "redirect:/login?login=success";
	}
	


//	-----------------> User Side Home Page
	
	@GetMapping( value = { "/", "defaultpage" } )
	public String defaultpage(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "DefaultPage";
	}
	
//	@GetMapping("/home")
//	public String home(Model model,  Principal principal) {
//		
//		List<CreateEventsEntity> event = repoevent.findAll();
//		model.addAttribute("newevent", event);
//		
//		List<StaEntity> allsta = reposta.findAll();
//		model.addAttribute("allstate", allsta);
//		
//		List<CityEntity> allcity = repocity.findAll();
//		model.addAttribute("allcity", allcity);
//		
//		List<EventTypeEntity> events = repoevents.findAll();
//		model.addAttribute("allevent", events);
//		
//		return "Home";
//	}
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {

	    List<CreateEventsEntity> event = repoevent.findAll();
	    model.addAttribute("newevent", event);

	    List<StaEntity> allsta = reposta.findAll();
	    model.addAttribute("allstate", allsta);

	    List<CityEntity> allcity = repocity.findAll();
	    model.addAttribute("allcity", allcity);

	    List<EventTypeEntity> events = repoevents.findAll();
	    model.addAttribute("allevent", events);

	    // ✅ Get user from session (NOT principal)
	    UserEntity user = (UserEntity) session.getAttribute("user");
	    model.addAttribute("user", user);

	    return "Home";
	}


	
	
	@GetMapping("business")
	public String business(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "Home";
	}
	
	
	@GetMapping("music")
	public String musicshow(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "MusicShowPage";
	}
	
	@GetMapping("concerts")
	public String concert(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "ConcertPage";
	}
	
	@GetMapping("dance")
	public String dance(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "DancePage";
	}
	
	@GetMapping("comedy")
	public String comedy(Model model) {
		
		List<CreateEventsEntity> event = repoevent.findAll();
		model.addAttribute("newevent", event);
		
		List<StaEntity> allsta = reposta.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
		
		return "ComedyPage";
	}
	
	@PostMapping("/updatepass")
	public String updatePass(
	    @RequestParam String email,
	    @RequestParam("currentpassword") String currentPassword, // Explicit mapping
	    @RequestParam String password,
	    Model model) {
	    
		 Optional<UserEntity> op = repositoryUser.findByEmail(email);
		    
		    if(op.isEmpty()) {
		        model.addAttribute("error", "Invalid Email");
		        return "ChangePassword";
		    }
		    
		    UserEntity user = op.get();
		    
		    //-----> Checks if current password matches (server-side)
		    if(!encoder.matches(currentPassword, user.getPassword())) {
		        model.addAttribute("error", "Current password is incorrect");

		        if(user.getRole().equals("USER")) {
		            return "redirect:/home?error=incorrect_password";
		        } else if(user.getRole().equals("ADMIN")) {
		            return "redirect:/admindashboard?error=incorrect_password";
		        }
		    }
		    
		    //-----> Updates password only if validation passes
		    String encPwd = encoder.encode(password);
		    user.setPassword(encPwd);
		    repositoryUser.save(user);
		    
		    //------> Role-based redirection
		    if(user.getRole().equals("USER")) {
		        return "redirect:/home?passwordChanged=true";
		    } else if(user.getRole().equals("ADMIN")) {
		        return "redirect:/admindashboard?passwordChanged=true";
		    }
		    
		    return "redirect:/login";   
	}
	
	@GetMapping("userforgetpassword")
	public String userforgetPassword(Integer userId, Model model) {
		
		Optional<UserEntity> op = repositoryUser.findById(userId);
		if(op.isEmpty()) {
			
		}else {
			UserEntity user = op.get();
			model.addAttribute("users", user);
		}
		return "UserForgotPassword";
	}
	
	@PostMapping("sendLink")
	public String sendLink(String input, Model model) {
	    // Check input is email or phone number
	    if (input.contains("@")) {
	        // Email case
	        Optional<UserEntity> op = repositoryUser.findByEmail(input);
	        if (op.isEmpty()) {
	            model.addAttribute("error", "<i class='bx bxs-error-circle'></i>Email Not Found");
	            return "redirect:/sendLink";
	        } else {
	            UserEntity user = op.get();
	            repositoryUser.save(user);
	            serviceMail.sendLinkForForgetPassword(user.getEmail(), user.getFirstName(), user.getUserId());
	            return "redirect:/home";
	        }
	    } else {
	        // Phone case
	        Optional<UserEntity> op = repositoryUser.findByContactNum(input);
	        if (op.isEmpty()) {
	            model.addAttribute("error", "<i class='bx bxs-error-circle'></i>Phone Number Not Found");
	            return "redirect:/sendLink";
	        } else {
	            UserEntity user = op.get();
	            repositoryUser.save(user);
	            twilioService.sendLinkForForgetPassword(user.getContactNum(), user.getUserId());
	            return "redirect:/home";
	        }
	    }
	}

	@GetMapping("userpass") 
	public String userpassword(String email,Integer userId, String password, Model model) {

    model.addAttribute("userId", userId);
    return "UserChangePassword";
		    
	}
	
//	@PostMapping("userupdatepassword")
//	public String updatePass(Integer userId, String password, String Confirmpassword, Model model) {
//
//	    if (!password.equals(Confirmpassword)) {
//	        model.addAttribute("error", "Passwords do not match");
//	        return "redirect:/userpass?userId=" + userId;
//	    }    
//
//	    Optional<UserEntity> op = repositoryUser.findById(userId);
//	    
//	    if (op.isEmpty()) {
//	        model.addAttribute("error", "Invalid User");
//	        return "redirect:/userpass?userId=" + userId;
//	    } else {
//	        UserEntity user = op.get();
//	        String encPwd = encoder.encode(password);
//	        user.setPassword(encPwd);
//	        repositoryUser.save(user);
//	       
//	        return "redirect:/home";
//	    }
//	}
	@PostMapping("userupdatepassword")
	public String updatePass(Integer userId, String password, String Confirmpassword, Model model) {

	    if (!password.equals(Confirmpassword)) {
	        model.addAttribute("error", "Passwords do not match");
	        return "redirect:/userpass?userId=" + userId;
	    }    

	    Optional<UserEntity> op = repositoryUser.findById(userId);

	    if (op.isEmpty()) {
	        model.addAttribute("error", "Invalid User");
	        return "redirect:/userpass?userId=" + userId;
	    } else {
	        UserEntity user = op.get();
	        String encPwd = encoder.encode(password);
	        user.setPassword(encPwd);
	        repositoryUser.save(user);

	        // Role-based redirection
	        if ("ADMIN".equals(user.getRole())) {
	            return "redirect:/admindashboard";
	        } else {
	            return "redirect:/home";
	        }
	    }
	}


	
	
		
	
}

