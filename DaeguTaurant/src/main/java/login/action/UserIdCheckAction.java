package login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import login.service.UserIdCheckService;
import vo.ActionForward;

public class UserIdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		
		UserIdCheckService userIdCheckService
		= new UserIdCheckService();
		
		boolean user_idExist = userIdCheckService.existUserId(user_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_idExist", user_idExist);
		/* request.setAttribute("user_id", user_id); */
//		request.setAttribute("user_idExist", user_idExist);
		ActionForward forward = new ActionForward();
		forward.setUrl("login/user_idCheck.jsp");
		return forward;
	}

}
