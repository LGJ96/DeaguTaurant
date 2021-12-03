package rest.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Info.action.Action;
import rest.service.RestSearchListService;

import vo.ActionForward;
import vo.RestPageVO;
import vo.RestVO;

public class RestSearchListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		   	
		   	RestSearchListService restListSearchService = new RestSearchListService();
		   	
		   	int rest_pageSize = 9; 
			String rest_pageNum = request.getParameter("rest_pageNum");
			if(rest_pageNum == null) {
				rest_pageNum = "1";
			}
		   	
			int rest_currentPage = Integer.parseInt(rest_pageNum);
			int rest_startRow = (rest_currentPage - 1) * rest_pageSize + 1;
		   	
			int rest_count = 0; 
			int rest_number = 0; 
			
			List<RestVO> restListt = null;
			rest_count = restListSearchService.getRestCount();
			
			if(rest_count > 0) {
				restListt = restListSearchService.getRestCountList(rest_startRow, rest_pageSize);
			}
			
			rest_number = rest_count - (rest_currentPage - 1) * rest_pageSize;
			
			int rest_pageCount = 0; 
			int rest_startPage = 0;
			int rest_endPage = 0;
			
			if(rest_count > 0) {
				rest_pageCount = rest_count / rest_pageSize + (rest_count % rest_pageSize == 0 ? 0 : 1);
				
				rest_startPage = (int)((rest_currentPage - 1)/10) * 10 + 1;
				rest_endPage = rest_startPage + 9;
				
			
				if(rest_endPage > rest_pageCount) {
					rest_endPage = rest_pageCount;
				}
				
			}
			
			request.setAttribute("restListt",restListt);
			RestPageVO restpageVO = new RestPageVO();
			restpageVO.setRest_count(rest_count);
			restpageVO.setRest_currentPage(rest_currentPage);
			restpageVO.setRest_endPage(rest_endPage);
			restpageVO.setRest_number(rest_number);
			restpageVO.setRest_pageCount(rest_pageCount);
			restpageVO.setRest_startPage(rest_startPage);
			
			request.setAttribute("restpageVO", restpageVO);
			
			
		    ActionForward forward = new ActionForward();
		      
		    forward.setUrl("home_review/search.jsp");
		    return forward;
	}

}
