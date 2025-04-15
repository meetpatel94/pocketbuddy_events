/*
package com.example.filter;

import java.io.IOException;

import java.util.ArrayList;
import org.springframework.stereotype.Component;
import com.example.entity.UserEntity;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpSession;

@Component
public class LoginCheckFilter implements Filter {

	ArrayList<String> publicURL = new ArrayList<>();
	
	public LoginCheckFilter() {
		publicURL.add("/defaultpage");
		publicURL.add("/musicshow");
		publicURL.add("/concert");
		
		//cities
		publicURL.add("/ahemdabad");
		publicURL.add("/vadodara");
		publicURL.add("/navsari");
		publicURL.add("/ghandhinagar");
		publicURL.add("/surat");
		
		
		publicURL.add("/dance");
		publicURL.add("/comedy");
		publicURL.add("/login");
		publicURL.add("/signup");
		publicURL.add("/saveuser");
		publicURL.add("/forgetpassword");
		publicURL.add("/sendOtp");
		publicURL.add("/logout");
		publicURL.add("/updatepassword");
		publicURL.add("/authenticate");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		
		String url = req.getRequestURL().toString();
		String uri = req.getRequestURI();
		
		//System.out.println("Filter Call......." + uri);
		//System.out.println("URI is:" + uri);
		
		
		if(publicURL.contains(uri) ||
				uri.contains(".css") || 
				uri.contains(".js") || 
				uri.contains("dist") ||
				uri.contains("css") ||
				uri.contains(".jpg") ||
				uri.contains(".webp") ||
				uri.contains(".png") ||
		        uri.contains("lib")) 
		{
			chain.doFilter(request, response);
		}else {
		
			HttpSession session = req.getSession();
		    UserEntity user = (UserEntity) session.getAttribute("user");
			
		if(user == null ) {
		req.getRequestDispatcher("defaultpage").forward(request, response);
	    }else {
		chain.doFilter(request, response);
	      }	   
	   }  
	}

}
*/