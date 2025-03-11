package com.example.Services;

import org.apache.logging.log4j.message.SimpleMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	JavaMailSender mailSender;
//	JavaMailSender javaMailSender;

	public void sendWelcomeMail(String email, String firstName) {
		String subject = "Welcome to projectJava";
		String body = "Hey " + firstName
				+ ", We're excited to have you on board. If you have any questions, feel free to reach out – we’re here to help!";
		String from = "meetpatel96645@gmail.com";

		// logic
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(from);
		message.setTo(email);
		message.setSubject(subject);
		message.setText(body);

		mailSender.send(message);

	}
	
	public void sendOtpForForgetPassword(String email, String firstName, String otp) {
		String subject = "Otp for Resetpassword";
		String body = "Hey " + firstName
				+ ", It seems you request for forget password, please use below otp for the reset password. If not then simply ignore the message! Your OTP is:"+ otp;
		String from = "meetpatel96645@gmail.com";

		// logic
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom(from);
		message.setTo(email);
		message.setSubject(subject);
		message.setText(body);

		mailSender.send(message);

	}

}

