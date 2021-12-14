package mypage.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import mypage.service.MyOtoDeleteProService;
import mypage.service.ReviewDeleteProService;
import vo.ActionForward;

public class MyOtODeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int cus_oto_number = Integer.parseInt(request.getParameter("cus_oto_number"));
		String user_id = request.getParameter("user_id");
	
		
		MyOtoDeleteProService myOtoDeleteProService = new MyOtoDeleteProService();
		
		boolean myOtodeleteSuccess = myOtoDeleteProService.removeMyOto(cus_oto_number,user_id);
		
		ActionForward forward = null;
		if(myOtodeleteSuccess) {
			
			forward = new ActionForward();
			forward.setUrl("mypage/myOtoDelete.jsp");  //인덱스로 이동
			forward.setRedirect(true);
		}
		else {
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		
	
		return forward;
	}

}
