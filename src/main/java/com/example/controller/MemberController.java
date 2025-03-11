package com.example.controller;

import java.util.List;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.MemberEntity;
import com.example.entity.UserEntity;
import com.example.repository.MemberRepository;

import jakarta.servlet.http.HttpSession;


@Controller
public class MemberController {

	@Autowired
	MemberRepository repositoryMember;

	@GetMapping("newmember")
	public String newMember() {
		return "NewMember";
	}

	@PostMapping("savemember")
	public String saveMember(MemberEntity entityMember, HttpSession session) {
		
//		UserEntity user = (UserEntity)session.getAttribute("user");
//		Integer userId = user.getUserId();
//		entityMember.setUserId(userId);		
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


}













