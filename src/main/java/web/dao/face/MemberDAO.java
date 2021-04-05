package web.dao.face;

import web.dto.MemberDTO;

public interface MemberDAO {

	public void signup(MemberDTO member)throws Exception;
	
	public MemberDTO signin(MemberDTO member)throws Exception;
	
	
}
