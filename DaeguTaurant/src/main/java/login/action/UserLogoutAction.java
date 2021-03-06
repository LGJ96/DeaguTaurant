package login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import vo.ActionForward;

public class UserLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		ActionForward forward = new ActionForward();
		
		forward.setUrl("home_review/index.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
