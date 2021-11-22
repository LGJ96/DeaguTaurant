package login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;

import login.service.UserNicknameCheckService;
import vo.ActionForward;

public class UserNicknameCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	
		String user_nickname = request.getParameter("user_nickname");
		
		UserNicknameCheckService userNicknameCheckService
		= new UserNicknameCheckService();
		
		boolean user_nicknameExist = userNicknameCheckService.existUserNickname(user_nickname);
		
		HttpSession session = request.getSession();
		session.setAttribute("user_nickname", user_nickname);
		session.setAttribute("user_nicknameExist", user_nicknameExist);
		/* request.setAttribute("user_id", user_id); */
//		request.setAttribute("user_idExist", user_idExist);
		ActionForward forward = new ActionForward();
		forward.setUrl("login/user_nicknameCheck.jsp");
		return forward;
	}
}
