package Info.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.service.UserRegistService;
import vo.ActionForward;
import vo.UserVO;

public class UserRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_nickname = request.getParameter("user_nickname");
		
		
		UserVO userVO = new UserVO();
		
		userVO.setUser_id(user_id);
		userVO.setUser_pw(user_pw);
		userVO.setUser_name(user_name);
		userVO.setUser_nickname(user_nickname);

		UserRegistService userRegistService = new UserRegistService();
		boolean registSuccess = userRegistService.registUser(userVO);
		
		ActionForward forward = null;
		if(registSuccess) {
			forward = new ActionForward();
			forward.setUrl("login/login.jsp");
			forward.setRedirect(true);
		}
		
		else {
			
			response.setContentType("text/html;charset = UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('등록실패')");
			out.print("history.back()");
			out.print("</script>");
		}
		return forward;
	}
}

