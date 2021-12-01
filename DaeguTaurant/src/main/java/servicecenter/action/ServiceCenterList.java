package servicecenter.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servicecenter.service.ServiceCenterListService;
import Info.action.Action;
import vo.ActionForward;
import servicecenter.vo.NoticeVO;
import servicecenter.vo.PageVO;

public class ServiceCenterList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int pageSize = 10;
		String pageNum= request.getParameter("pageNum");
		if(pageNum == null) {
			
			pageNum = "1"; 
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		
		int startRow = (currentPage -1 ) * pageSize +1;
		
		
		int count = 0;
		int number = 0;
		
		ServiceCenterListService serviceCenterListService =  new ServiceCenterListService();
		List<NoticeVO> articleList = null;
		count = serviceCenterListService.getArticleCount();
		
		if(count > 0) {
			articleList = serviceCenterListService.getArticleCount(startRow, pageSize);
			
		}
		
		number = count -(currentPage -1 )* pageSize;
		
		int pageCount = 0; 
		int startPage = 0;
		int endPage = 0;
		
		if(count > 0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			
			startPage = (int)((currentPage - 1) / 10) * 10 + 1;
			
			endPage = startPage + 9;
			
			if(endPage > pageCount) {
				endPage = pageCount;
				
			}
		}
		
		request.setAttribute("articleList", articleList);
		PageVO pageVO = new PageVO();
			
		pageVO.setCurrentPage(currentPage);
		pageVO.setEndPage(endPage);
		pageVO.setCount(count);
		pageVO.setNumber(number);
		pageVO.setPageCount(pageCount);
		pageVO.setStartPage(startPage);
			
		request.setAttribute("pageVO", pageVO);
		ActionForward forward = new ActionForward();
		forward.setUrl("servicecenter/servicecenter.jsp");
		return forward;
	}
	
	
	

}
