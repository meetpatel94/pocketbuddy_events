package com.example;

import java.util.Map;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@SpringBootApplication
public class PocketbuddyshoweventsApplication {

	public static void main(String[] args) {
		SpringApplication.run(PocketbuddyshoweventsApplication.class, args);
	}
	
	
	@Bean     // use for make class singleton 
	PasswordEncoder encoder() {
		return new BCryptPasswordEncoder(5);
	}
	
	@Bean
	Cloudinary cloudinary() {
		Map<String, String> config = ObjectUtils.asMap("cloud_name", "dtva9425r", "api_key", "918616928822426",
				"api_secret", "QXzptG0NQdX7UMnuc6dWnwR31Sw");
		return new Cloudinary(config);
	}
	
	
} 
