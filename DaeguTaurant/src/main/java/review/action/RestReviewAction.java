package review.action;

import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Info.action.Action;
import rest.service.RestRegistService;
import review.service.RestReviewService;
import vo.ActionForward;
import vo.RestVO;
import vo.ReviewVO;

public class RestReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 평점
		//String[] review =request.getParameterValues("rating");
		
		
		 String realFolder = "";//파일이 최종적으로 업로드될 물리적인 경로가 저장될 변수

	      String saveFolder = "/images/rev_pic";//상대경로
	      
	      String encType = "UTF-8";
	      int maxSize = 5*1024*1024; //5mb
	      
	      //서버상에 업로드될 물리적인 경로를 얻어오는 작업
	      ServletContext context = request.getServletContext();//애플리케이션 당 하나씩 할당되는
	      //애플리케이션 전체의 환경설정 정보
	      realFolder = context.getRealPath(saveFolder);
	      
	      MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
		           new DefaultFileRenamePolicy());
	     
	      ReviewVO reviewVO = new ReviewVO();
	      RestVO restVO = new RestVO();
    
	      String fileName = multi.getFilesystemName("rev_pic"); 
			 
	      int index = fileName.indexOf("."); 
			 
	      String fileNameWithoutExt = fileName.substring(0,index);
		
	      System.out.println(fileNameWithoutExt);
			
	      reviewVO.setRev_pic(fileNameWithoutExt);
	   
	      String review = multi.getParameter("review");
	      System.out.println(review);
			
	      HttpSession session = request.getSession();
	      session.setAttribute("reviewVO", reviewVO);	//필수요인(loginUser = null을 해결하기 위해)
	      session.setAttribute("review", review);
	      
	      reviewVO.setRes_score(Double.parseDouble(review));
	      reviewVO.setRev_content(multi.getParameter("rev_content"));
	     // restVO.setRes_id(Integer.parseInt(request.getParameter("res_id")));
	      reviewVO.setRev_like(0);
	      reviewVO.setRev_notice_date(new Timestamp(System.currentTimeMillis()));
	      
	      
	      RestReviewService restReviewService = new RestReviewService();
	      boolean reviewSuccess = restReviewService.reviewRest(reviewVO,review);
	      
	      ActionForward forward = null;
	      if(reviewSuccess) {
	         forward = new ActionForward();
	         forward.setUrl("home_review/rest_content.jsp");
	         forward.setRedirect(true);
	      }else {
	         response.setContentType("text/html;charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>");
	         out.println("alert('등록실패')");  //경고창
	         out.println("history.back()");
	         out.println("</script>");
	      }
	      
	         
	      return forward;
	   
	 }
}
