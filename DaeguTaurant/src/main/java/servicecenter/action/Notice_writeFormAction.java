package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.NoticeReplyVO;

public class Notice_writeFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_notice_number = 0;
		
		if(request.getParameter("cus_notice_number") !=null) {
			cus_notice_number = Integer.parseInt(request.getParameter("cus_notice_number"));
			
		}
		
		NoticeReplyVO noticeReplyVO = new NoticeReplyVO();
		noticeReplyVO.setCus_notice_number(cus_notice_number);
		
		
		request.setAttribute("noticeReplyVO", noticeReplyVO);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/notice-write.jsp");
		return forward;
	}

}
