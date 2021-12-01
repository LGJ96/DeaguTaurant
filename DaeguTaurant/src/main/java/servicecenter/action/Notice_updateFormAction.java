package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.NoticeUpdateFormService;
import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.NoticeVO;

public class Notice_updateFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	      int cus_notice_number = Integer.parseInt(request.getParameter("cus_notice_number"));
	      String pageNum = request.getParameter("pageNum");
	      
	      NoticeUpdateFormService noticeUpdateService = new NoticeUpdateFormService(); 
	      NoticeVO article =  noticeUpdateService.getArtcticle(cus_notice_number);
	      
	      request.setAttribute("article", article);
	      request.setAttribute("pageNum", pageNum);
	      
	      ActionForward forward = new ActionForward();
	      forward.setUrl("servicecenter/notice-update.jsp");
	      
	      
	      
	      return forward;
	}

}
