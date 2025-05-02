package com.example.controller.admin;

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
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.Services.MailService;
import com.example.entity.CityEntity;
import com.example.entity.CommentEntity;
import com.example.entity.CreateEventsEntity;
import com.example.entity.EventTypeEntity;
import com.example.entity.StaEntity;
import com.example.entity.UserEntity;
import com.example.repository.CityRepository;
import com.example.repository.CommentRepository;
import com.example.repository.CreateEventsRepository;
import com.example.repository.EventRepository;
import com.example.repository.MemberRepository;
import com.example.repository.StaRepository;
import com.example.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	
	@Autowired
	MailService serviceMail;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	Cloudinary cloudinary;

	@Autowired
	StaRepository repostate;
	
	@Autowired
	CityRepository repocity;
	
	@Autowired
	UserRepository repoUser;
	
	@Autowired
	MemberRepository memberRepository;
	
	@Autowired
	CreateEventsRepository repoevent;
	
	@Autowired
	EventRepository repoevents;
	
	@Autowired
	CommentRepository repoComment;
	
    @GetMapping("admindashboard")
	public  String admindashboard(Model model) {
    	
    	List<CommentEntity> commentList = repoComment.findAll();
		model.addAttribute("comments", commentList);
    	
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
    	
    	return "ADMIN_Dashboard";
	}
    
    @PostMapping("adminsaveuser")
	public String adminsaveuser(UserEntity userEntity, MultipartFile profilePic) {
			
		if(profilePic.getOriginalFilename().endsWith(".jpg") ||
		   profilePic.getOriginalFilename().endsWith(".png") ||
		   profilePic.getOriginalFilename().endsWith(".webp")) {
			
		} else {
			return "redirect:/adduser";	
		} try  {
			
		Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());

		userEntity.setProfilePicPath(result.get("url").toString());
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String encPassword = encoder.encode(userEntity.getPassword());
		userEntity.setPassword(encPassword);
		
		//set role user
		userEntity.setRole("USER"); 
		
		//save data in table
		repoUser.save(userEntity);
		
		//send welcome main after user signup
		serviceMail.sendWelcomeMail(userEntity.getEmail(), userEntity.getFirstName());
		return "redirect:/listuser";
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
			dbuser.setRole(entity.getRole());
			
			if(profilePic.getOriginalFilename().endsWith(".jpg") ||
			   profilePic.getOriginalFilename().endsWith(".png") ||
			   profilePic.getOriginalFilename().endsWith(".webp")) {
				
			} else {
				return "ADMIN_Dashboard";
				
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
    
    @GetMapping("contactUs")                     // Contact us page
    public String contactus() {
    	return "ContactUsPage";
    }
    @GetMapping("events")                        // Events page
    public String events() {
    	return "EventsPage";
    }
    @GetMapping("eventshows")                    // Events shows page
    public String eventshows() {
    	return "EventShows";
    }
    @GetMapping("trendingevent")                 // Trending Events page
    public String trendingevent() {
    	return "TrendingEvents";
    }
    
    
    
    // create event admin side
    
    @GetMapping("createevents")
    public String createevents(Model model) {
    	
    	List<StaEntity> allstate = repostate.findAll();
		model.addAttribute("allstate", allstate);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
    	
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
		
		List<StaEntity> allstate = repostate.findAll();
		model.addAttribute("allstate", allstate);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
						
		return "ADMINTrendingEvents";
	}
    
    @GetMapping("deleteevent")
	public String deleteevent(Integer createeventId) {
		repoevent.deleteById(createeventId);
		return "redirect:/businessevents";
	}
    
    @GetMapping("editevent")
   	public String editevent(Integer createeventId,Model model) {
   		
    	List<StaEntity> allsta = repostate.findAll();
		model.addAttribute("allstate", allsta);
		
		List<CityEntity> allcity = repocity.findAll();
		model.addAttribute("allcity", allcity);
		
		List<EventTypeEntity> events = repoevents.findAll();
		model.addAttribute("allevent", events);
    	
   		Optional<CreateEventsEntity> op = repoevent.findById(createeventId);
   		if(op.isEmpty()) {
   			return "redirect:/businessevents";
   			
   		}else {
   			model.addAttribute("user", op.get());
   			return "EditEventPage";
   		}
   		
   	}
    
    
    @PostMapping("updateevent")
   	public String updateevent(CreateEventsEntity entity, MultipartFile profilePic) {

   		Optional<CreateEventsEntity> op = repoevent.findById(entity.getCreateeventId());
   		
   		if(op.isPresent()) {
   			
   			CreateEventsEntity dbuser = op.get();
   			dbuser.setEventType(entity.getEventType());
   			dbuser.setTitle(entity.getTitle());
   			dbuser.setKeynote(entity.getKeynote());
   			dbuser.setDate(entity.getDate());
   			dbuser.setCity(entity.getCity());
   			dbuser.setState(entity.getState());
   			dbuser.setStime(entity.getStime());
   			dbuser.setEtime(entity.getEtime());
   			dbuser.setDescription(entity.getDescription());
   			dbuser.setName(entity.getName());
   			dbuser.setAddress(entity.getAddress());
   			dbuser.setProfilePicPath(entity.getProfilePicPath());
   			
   			if(profilePic.getOriginalFilename().endsWith(".jpg") ||
   			   profilePic.getOriginalFilename().endsWith(".png") ||
   			   profilePic.getOriginalFilename().endsWith(".webp")) {
   				
   			} else {
   				return "redirect:/businessevents";
   				
   			} try {
   				
   			Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
//   			
   			
   			entity.setProfilePicPath(result.get("url").toString());
   			
   			} catch (IOException e) {
   				// TODO Auto-generated catch block
   				e.printStackTrace();
   			}
   			
   			repoevent.save(entity);
   		}	
   		return "redirect:/businessevents";
   	}
       
    @PostMapping("update")
    public String update(UserEntity entity, MultipartFile profilePic, HttpSession session) {

        Optional<UserEntity> op = repoUser.findById(entity.getUserId());

        if (op.isPresent()) {
            UserEntity dbuser = op.get();
            dbuser.setFirstName(entity.getFirstName());
            dbuser.setLastName(entity.getLastName());
            dbuser.setGender(entity.getGender());
            dbuser.setEmail(entity.getEmail());
            dbuser.setBornYear(entity.getBornYear());
            dbuser.setContactNum(entity.getContactNum());
            dbuser.setRole(entity.getRole());

            if (profilePic != null && !profilePic.isEmpty()) {
                if (profilePic.getOriginalFilename().endsWith(".jpg") ||
                    profilePic.getOriginalFilename().endsWith(".png") ||
                    profilePic.getOriginalFilename().endsWith(".webp")) {

                    try {
                        Map result = cloudinary.uploader().upload(profilePic.getBytes(), ObjectUtils.emptyMap());
                        dbuser.setProfilePicPath(result.get("url").toString());
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                } else {
                    return "Home";
                }
            }

            repoUser.save(dbuser);

            session.setAttribute("user", dbuser);                   //-=-> Redirect based on role
                                                                      
            if (dbuser.getRole().equals("USER")) {                  //-=-> Redirect based on role
                return "redirect:/home?profileUpdated=true";
            } else if (dbuser.getRole().equals("ADMIN")) {
                return "redirect:/admindashboard?profileUpdated=true";
            }
        }

        return "redirect:/error"; 
    }

    
 
}