package login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import login.service.UserIdPwSearchResultService;
import vo.ActionForward;

public class UserPwSearchResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		
				
				UserIdPwSearchResultService userIdPwSearchResultService
				= new UserIdPwSearchResultService();
				
				String pwsearchresult = userIdPwSearchResultService.existUserIdName(user_id,user_name);
				
				HttpSession session = request.getSession();
				session.setAttribute("user_id", user_id);
				session.setAttribute("user_name", user_name);
				session.setAttribute("pwsearchresult", pwsearchresult);
				/* request.setAttribute("user_id", user_id); */
			    request.setAttribute("pwsearchresult", pwsearchresult);
				ActionForward forward = new ActionForward();
				forward.setUrl("login/pwSearchResult.jsp");
				return forward;
			}

}
