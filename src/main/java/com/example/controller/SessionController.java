package com.example.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.Services.MailService;
//import com.example.Service.MailService;
import com.example.entity.UserEntity;
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

	@GetMapping(value = { "/", "login" } )
	public String login(String email, String password) {
		return "Login";
	}
	
	@GetMapping("signup") 
	public String signup() {
		return "Signup";
	}

	@PostMapping("saveuser")
	public String saveuser(UserEntity userEntity) {
		
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(5);     //salt
//------->  Not use this line new keyword because it's gain more memory		
		
		String encPassword = encoder.encode(userEntity.getPassword());
		userEntity.setPassword(encPassword);
		
		userEntity.setRole("USER");
	
		repositoryUser.save(userEntity);	
	//	serviceMail.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
		return "Login";
	}
	
	
	@PostMapping("authenticate")
	public String authenticate(String email, String password, Model model, HttpSession session) {
		System.out.println("Email: "+ email);
		System.out.println("Password: "+password);
		
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		//check data coming or not
		if(op.isPresent()) {
			
			UserEntity dbUsers = op.get();
			
			boolean ans = encoder.matches(password, dbUsers.getPassword());
			if(ans==true) {
				
				session.setAttribute("user", dbUsers);   // use session when login
				
				if(dbUsers.getRole().equals("ADMIN")) {
					return "redirect:/admindashboard";
					
				}else if(dbUsers.getRole().equals("USER")) {
					return "Home";
					
				}else {
					model.addAttribute("error", "Please contact Admin with error code #98433");
					return "Login";	
				}	
			}	
		}
		
		model.addAttribute("error", "Invalid Email Or Password");
		return "Login";	
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	@GetMapping("/forgetpassword")
	public String forgetPassword() {
		return "ForgetPassword";
	}

	//===> SEND OTP
	@PostMapping("sendOtp")
	public String sendOtp(String email, Model model) {
		Optional<UserEntity> op = repositoryUser.findByEmail(email);
		if(op.isEmpty()) {
			
			model.addAttribute("error", "Email Not Found");
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
			return "ChangePassword";
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
		return "Login";
	}
	
	
	@GetMapping("home")
	public String home() {
		return "Home";
	}

}

