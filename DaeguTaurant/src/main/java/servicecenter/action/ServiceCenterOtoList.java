package servicecenter.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import servicecenter.service.ServiceCenterOtoListService;
import servicecenter.vo.OtoPageVO;
import servicecenter.vo.OtoVO;
import vo.ActionForward;

public class ServiceCenterOtoList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int oto_pageSize = 10; 
		String oto_pageNum= request.getParameter("oto_pageNum");
		if(oto_pageNum == null) {
			
			oto_pageNum = "1"; 
		}
		
		int oto_currentPage = Integer.parseInt(oto_pageNum);
		
		int oto_startRow = (oto_currentPage -1 ) * oto_pageSize +1;
		
		int oto_count = 0;
		int oto_number = 0;
		
		ServiceCenterOtoListService serviceCenterOtoListService =  new ServiceCenterOtoListService();
		List<OtoVO> otoArticleList = null;
		oto_count = serviceCenterOtoListService.getArticleCount();
		
		if(oto_count > 0) {
			otoArticleList = serviceCenterOtoListService.getArticleCount(oto_startRow, oto_pageSize);
			
		}
		
		oto_number = oto_count -(oto_currentPage -1 )* oto_pageSize;
		
		int oto_pageCount = 0; 
		int oto_startPage = 0;
		int oto_endPage = 0;
		
		if(oto_count > 0) {
			oto_pageCount = oto_count / oto_pageSize + (oto_count % oto_pageSize == 0 ? 0 : 1);
			
			oto_startPage = (int)((oto_currentPage - 1) / 10) * 10 + 1;
			
			oto_endPage = oto_startPage + 9;
			
			if(oto_endPage > oto_pageCount) {
				oto_endPage = oto_pageCount;
				
			}
		}
		
		request.setAttribute("otoArticleList", otoArticleList);
		OtoPageVO otoPageVO = new OtoPageVO();
			
		otoPageVO.setOto_currentPage(oto_currentPage);
		otoPageVO.setOto_endPage(oto_endPage);
		otoPageVO.setOto_count(oto_count);
		otoPageVO.setOto_number(oto_number);
		otoPageVO.setOto_pageCount(oto_pageCount);
		otoPageVO.setOto_startPage(oto_startPage);
			
		request.setAttribute("otoPageVO", otoPageVO);
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/servicecenterOto.jsp");
		return forward;
	}

}
