package servicecenter.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.NoticeUpdateProService;
import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.NoticeVO;

public class Notice_updateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setCus_notice_number(Integer.parseInt(request.getParameter("cus_notice_number")));
		noticeVO.setCus_notice_title(request.getParameter("cus_notice_title"));
		noticeVO.setCus_notice_date(new Timestamp(System.currentTimeMillis()));
		noticeVO.setCus_notice_content(request.getParameter("cus_notice_content"));
	      
	    NoticeUpdateProService noticeUpdateProService = new NoticeUpdateProService();
	      
	    boolean modifySuccess = noticeUpdateProService.modifyArticle(noticeVO);
	      
	    ActionForward forward = null;
	    if(modifySuccess) {
	       forward = new ActionForward();
	       forward.setUrl("serviceCenterList.dae");
	       forward.setRedirect(true);
	    }
	    else {
	       response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       out.println("<script>");
	       out.println("alert('수정실패')");
	       out.println("history.back();");
	       out.println("</script>");
	    }
	    return forward;
	}

}
