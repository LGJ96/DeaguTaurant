package servicecenter.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.NoticeDeleteProService;
import Info.action.Action;
import vo.ActionForward;

public class Notice_deleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_notice_number = Integer.parseInt(request.getParameter("cus_notice_number"));
		String pageNum = request.getParameter("pageNum");
		
		NoticeDeleteProService noticeDeleteProService = new NoticeDeleteProService();
		boolean deleteSuccess = noticeDeleteProService.deleteArticle(cus_notice_number);
		
		ActionForward forward = null;
		if(deleteSuccess) {
			forward = new ActionForward();
			forward.setUrl("servicecenter/notice-close.jsp");
			forward.setRedirect(true);
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("arert('삭제실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}
	
	
	
}
