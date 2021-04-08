package web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.dto.MemberDTO;
import web.service.face.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class); 
	
	@Autowired
	MemberService service;

	
	@Bean
	BCryptPasswordEncoder passwordEncoder() {

	    return new BCryptPasswordEncoder();
	}
	
    @Autowired(required=false)
	BCryptPasswordEncoder passEncoder;

	
	
	// 회원 가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	 logger.info("get signup");
	}

	// 회원 가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberDTO member) throws Exception {
	 logger.info("post signup");
	  
	
	  String inputPass = member.getUserPass(); 
	  String pass = passEncoder.encode(inputPass);
	  member.setUserPass(pass);
		

	 service.signup(member);

	 return "redirect:/member/signin";
	}
	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
	 logger.info("get signin");
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberDTO member, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	 logger.info("post signin");
	   
	 MemberDTO login = service.signin(member);  
	 HttpSession session = req.getSession();
	 
	 boolean passMatch = passEncoder.matches(member.getUserPass(), login.getUserPass());
	 
	 if(login != null && passMatch ) {
	  session.setAttribute("member", login);
	  
	  
	 } else {
	  session.setAttribute("member", null);
	  rttr.addFlashAttribute("msg", false);
	  return "redirect:/member/signin";
	 }  
	 
	 return "redirect:/";
	}
	  
	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public void signout(HttpSession session) throws Exception {
	 logger.info("get logout");
	 
	 service.signout(session);
	   
	 
	}
}
