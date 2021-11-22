package login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import login.service.LoginService;
import vo.ActionForward;
import vo.UserVO;

public class UserLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_nickname = request.getParameter("user_nickname");
		
		
		LoginService loginService = new LoginService();
		UserVO loginUser = loginService.getLoginUser(user_id, user_pw, user_nickname);
		ActionForward forward =null;
		if(loginUser != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);	//필수요인(loginUser = null을 해결하기 위해)
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_nickname", user_nickname);
			
			forward = new ActionForward();
			forward.setUrl("home_review/index.jsp");
			forward.setRedirect(true);
		}	
		//forward=null;
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패')");
			out.println("history.back()");//history.go(-1)
			out.println("</script>");
		}
		
		
		
		
		return forward;
	}

}
