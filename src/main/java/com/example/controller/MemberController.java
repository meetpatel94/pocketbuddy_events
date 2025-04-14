package com.example.controller;

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
import com.example.entity.MemberEntity;
import com.example.entity.UserEntity;
import com.example.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemberController {

	@Autowired
	MemberRepository repositoryMember;
	
	@Autowired
	Cloudinary cloudinary; 
	
	@GetMapping("newmember")
	public String newMember() {
		return "NewMember";
	}

	@PostMapping("savemember")
	public String saveMember(MemberEntity entityMember, HttpSession session, MultipartFile profilePic2) {
		 
		
		if(profilePic2.getOriginalFilename().endsWith(".jpg") ||
				   profilePic2.getOriginalFilename().endsWith(".png") ||
				   profilePic2.getOriginalFilename().endsWith(".webp")) {
					
				} else {
					return "Signup";	
				} try  {
					
				Map result = cloudinary.uploader().upload(profilePic2.getBytes(), ObjectUtils.emptyMap());
//				System.out.println(result);
//				System.out.println(result.get("url"));
				entityMember.setProfilePhoto(result.get("url").toString());
				
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//		UserEntity user = (UserEntity)session.getAttribute("user");
//		Integer userId = user.getUserId();
//		entityMember.setUserId(userId);	
		entityMember.setRole("Member");
     	repositoryMember.save(entityMember);	
		return "NewMember";
	}

	@GetMapping("listmembers")
	public String listMembers(Model model) {
		List<MemberEntity> memberList = repositoryMember.findAll();
		model.addAttribute("memberList", memberList);
						
		return "ListMember";
	}
	
	//----> View member
	@GetMapping("viewmember")
	public String viewmember(Integer memberId, Model model) {
		System.out.println("view Member Id:"+memberId);
		Optional<MemberEntity> op = repositoryMember.findById(memberId);
		if(op.isEmpty()) {
			
		}else {
			MemberEntity member = op.get();
			model.addAttribute("member", member);
		}
		return "ViewMember";
	}

	//----> Delete member
	@GetMapping("deletemember")
	public String deletemember(Integer memberId) {
		repositoryMember.deleteById(memberId);
		
		return "redirect:/listmembers";
	}
	
	@GetMapping("editmember")
	public String editmember(Integer memberId ,Model model) {
		
		Optional<MemberEntity> op = repositoryMember.findById(memberId);
		if(op.isEmpty()) {
			return "redirect:/listmembers";
			
		}else {
			model.addAttribute("member", op.get());
			return "EditMember";
		}	
	}

	 @PostMapping("updatemember")
		public String updatemember(MemberEntity entityMember, MultipartFile profilePic) {
//			System.out.println(entityMember.getmemberId());
			
			
			Optional<MemberEntity> op = repositoryMember.findById(entityMember.getMemberId());
			
			if(op.isPresent()) {
				
				MemberEntity dbuser = op.get();
				dbuser.setMemberName(entityMember.getMemberName());
				dbuser.setAge(entityMember.getAge());
				dbuser.setProfilePhoto(entityMember.getProfilePhoto());
				
				if(profilePic.getOriginalFilename().endsWith(".jpg") ||
				   profilePic.getOriginalFilename().endsWith(".png") ||
				   profilePic.getOriginalFilename().endsWith(".webp")) {
					
				} else {
					return "EditMember";
					
				} try {
					
				Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
//				System.out.println(result);
//				System.out.println(result.get("url"));
				
				entityMember.setProfilePhoto(result.get("url").toString());
				
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				repositoryMember.save(entityMember);
			}	
			return "redirect:/listmembers";
		}
	
}













