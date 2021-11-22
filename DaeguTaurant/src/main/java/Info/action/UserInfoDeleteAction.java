package Info.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import vo.ActionForward;

public class UserInfoDeleteAction implements Action {


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_id = request.getParameter("user_id");
	
		
		request.setAttribute("user_id", user_id);
		                 
		ActionForward forward = new ActionForward();
		
		forward.setUrl("/login/user_InfoDelete.jsp");
		
		return forward;
	}

}
