package servicecenter.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import servicecenter.service.ServiceCenterOtoContentService;
import servicecenter.vo.OtoVO;
import vo.ActionForward;

public class ServiceCenterOtoContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int cus_oto_number = Integer.parseInt(request.getParameter("cus_oto_number"));
		String oto_pageNum = request.getParameter("oto_pageNum");
		
		
		ServiceCenterOtoContentService serviceCenterOtoContentService = new ServiceCenterOtoContentService();
		
		OtoVO otoArticle = serviceCenterOtoContentService.getArticle(cus_oto_number);
		request.setAttribute("otoArticle", otoArticle);
		request.setAttribute("oto_pageNum", oto_pageNum);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/question-content.jsp");
		
		
		return forward;
	}

}
