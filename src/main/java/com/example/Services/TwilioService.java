package com.example.Services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;

@Service
public class TwilioService {

    @Value("${twilio.account.sid}")
    private String accountSid;

    @Value("${twilio.auth.token}")
    private String authToken;

    @Value("${twilio.phone.number}")
    private String fromNumber;

    //------>send link for forgotpassword in user without logIn 
    public void sendLinkForForgetPassword(String toPhoneNumber, Integer userId) {
        Twilio.init(accountSid, authToken);

        String link = "http://localhost:9999/userpass?userId=" + userId;
        String body = "Click here to reset your password: " + link;

        @SuppressWarnings("unused")
		Message message = Message.creator(
                new com.twilio.type.PhoneNumber(toPhoneNumber),
                new com.twilio.type.PhoneNumber(fromNumber),
                body
        ).create();
    }
    
    //------>send otp for forgotpassword in user with logIn
    public void sendOtpForForgetPassword(String toPhoneNumber, String firstName, String otp) {
        Twilio.init(accountSid, authToken);

        String body = "Hey " + firstName + ", it seems you requested a password reset. Use this OTP to reset your password: " + otp + 
                      ". If you didn't request this, you can ignore this message.";

        @SuppressWarnings("unused")
		Message message = Message.creator(
                new com.twilio.type.PhoneNumber(toPhoneNumber),
                new com.twilio.type.PhoneNumber(fromNumber),
                body
        ).create();
    }

}

