package Info.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.service.UserInfoDeleteProService;
import vo.ActionForward;

public class UserInfoDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");  //내가 입력한 비밀번호
		

		
		UserInfoDeleteProService userInfoDeleteProService = new UserInfoDeleteProService();
		
		boolean infodeleteSuccess = userInfoDeleteProService.removeUser_Info(user_id,user_pw);
		
		ActionForward forward = null;
		if(infodeleteSuccess) {
			
			forward = new ActionForward();
			HttpSession session = request.getSession();
			session.invalidate();                            //로그아웃 하고
			forward.setUrl("login/user_InfoDeleteEnd.jsp");  //인덱스로 이동
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않음')");
			out.println("history.back();");
			out.println("</script>");
		}
		
	
		return forward;
	}

}
