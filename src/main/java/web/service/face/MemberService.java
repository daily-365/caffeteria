package web.service.face;

import javax.servlet.http.HttpSession;

import web.dto.MemberDTO;

public interface MemberService {

	
	public void signup(MemberDTO member)throws Exception;
	
	
	public MemberDTO signin(MemberDTO member)throws Exception;
	
	
	public void signout(HttpSession session)throws Exception;
	 
}
