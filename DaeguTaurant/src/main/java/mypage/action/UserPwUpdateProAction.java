package mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import dao.UserDAO;
import mypage.service.PwUpdateProService;

import vo.ActionForward;
import vo.UserVO;

public class UserPwUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		String user_id = loginUser.getUser_id();
		UserVO userVO =null;
		userVO = new UserVO();
		
		
		userVO.setUser_id(user_id);
		userVO.setUser_pw(request.getParameter("user_pw1"));  //내가 입력한 비밀번호
		
		System.out.println(userVO.getUser_id());
		
		PwUpdateProService pwUpdateProService = new PwUpdateProService();
		      
		boolean modifySuccess = pwUpdateProService.modifyPw(userVO);
		                             
	    ActionForward forward = null;
	    
	      if(modifySuccess) {
	         forward = new ActionForward();
			 forward.setUrl("mypage/mypage.jsp");
	         forward.setRedirect(true);
	      }
	      else {
	         response.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('변경 실패')");
	         out.println("history.back()");
	         out.println("</script>");
	      }
	      return forward;
	   }


}
