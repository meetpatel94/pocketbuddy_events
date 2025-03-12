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
		
		
		if(publicURL.contains(uri) || uri.contains(".css") || uri.contains(".js") || uri.contains("dist")) {
			chain.doFilter(request, response);
		}else {
		
			HttpSession session = req.getSession();
		    UserEntity user = (UserEntity) session.getAttribute("user");
			
		if(user == null ) {
		req.getRequestDispatcher("login").forward(request, response);
	    }else {
		chain.doFilter(request, response);
	      }	   
	   }  
	}
}
