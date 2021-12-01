package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import servicecenter.vo.OtoReplyVO;
import vo.ActionForward;



public class Oto_writeFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_oto_number = 0, cus_ref = 1, cus_re_step = 0, cus_re_level = 0;
		if(request.getParameter("cus_oto_number") !=null) {
			cus_oto_number = Integer.parseInt(request.getParameter("cus_oto_number"));
			cus_ref = Integer.parseInt(request.getParameter("cus_ref"));
			cus_re_step = Integer.parseInt(request.getParameter("cus_re_step"));
			cus_re_level = Integer.parseInt(request.getParameter("cus_re_level"));
			
		}
		
		OtoReplyVO otoReplyVO = new OtoReplyVO();
		otoReplyVO.setCus_oto_number(cus_oto_number);
		otoReplyVO.setCus_re_level(cus_re_level);
		otoReplyVO.setCus_re_step(cus_re_step);
		otoReplyVO.setCus_ref(cus_ref);
		
		
		request.setAttribute("otoReplyVO", otoReplyVO);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/question-box.jsp");
		return forward;
	}

}
