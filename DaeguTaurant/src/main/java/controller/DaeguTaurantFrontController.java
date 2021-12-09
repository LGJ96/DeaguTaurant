package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.action.Action;
import Info.action.UserInfoDeleteAction;
import Info.action.UserInfoDeleteProAction;
import Info.action.UserRegistAction;
import login.action.UserIdCheckAction;
import login.action.UserLoginAction;
import login.action.UserLogoutAction;
import login.action.UserNicknameCheckAction;
import login.action.UserPwSearchResultAction;
import mypage.action.UserPwUpdateProAction;

import rest.action.Rest1EachCheckSearchAction;
import rest.action.Rest2categoryCheckSearchAction;
import rest.action.Rest3areaCheckSearchAction;
import rest.action.RestContentAction;
import rest.action.RestIndexAction;
import rest.action.RestRegistAction;
import rest.action.RestSearchAction;
import rest.action.RestSearchListAction;
import rest.action.RestUpdateAction;
import rest.action.RestUpdateProAction;
import review.action.RestReviewAction;
import review.action.RestReviewlikeAction;
import servicecenter.action.Faq_deleteFormAction;
import servicecenter.action.Faq_deleteProAction;
import servicecenter.action.Faq_updateFormAction;
import servicecenter.action.Faq_updateProAction;
import servicecenter.action.Faq_writeFormAction;
import servicecenter.action.Faq_writeProAction;
import servicecenter.action.Notice_deleteFormAction;
import servicecenter.action.Notice_deleteProAction;
import servicecenter.action.Notice_updateFormAction;
import servicecenter.action.Notice_updateProAction;
import servicecenter.action.Notice_writeFormAction;
import servicecenter.action.Notice_writeProAction;
import servicecenter.action.Oto_deleteFormAction;
import servicecenter.action.Oto_deleteProAction;
import servicecenter.action.Oto_writeFormAction;
import servicecenter.action.Oto_writeProAction;
import servicecenter.action.ServiceCenterFaqList;
import servicecenter.action.ServiceCenterList;
import servicecenter.action.ServiceCenterOtoContentAction;
import servicecenter.action.ServiceCenterOtoList;
import servicecenter.action.ServiceSearchAction;

import vo.ActionForward;

/**
 * Servlet implementation class DaeguTaurantFrontController
 */
@WebServlet("*.dae")
public class DaeguTaurantFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DaeguTaurantFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	      String requestURI = request.getRequestURI();
	      //requestURI : /DaeguTaurant/login.dae

	      String contextPath = request.getContextPath();
	      //contextPath : /DaeguTaurant 
	      
	      String command = requestURI.substring(contextPath.length());
	      System.out.println("command = " + command);
			
		
	      Action action = null;
	      ActionForward forward = null;
			
			
			if(command.equals("/login.dae")) {
				action = new UserLoginAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(command.equals("/logout.dae")) {
				action = new UserLogoutAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(command.equals("/userRegist.dae")) {
				action = new UserRegistAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_idCheck.dae")) {
				action = new UserIdCheckAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_nicknameCheck.dae")) {
				action = new UserNicknameCheckAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(command.equals("/user_infoDelete.dae")) {
				action = new UserInfoDeleteAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_infoDeletePro.dae")) {
				action = new UserInfoDeleteProAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			else if(command.equals("/user_pwsearchresult.dae")) {
				action = new UserPwSearchResultAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		//========================���� �깅�==============================
			
			 else if(command.equals("/rest_Regist.dae")) {
		        	action = new RestRegistAction();
		        	
		        	try {
		        		forward = action.execute(request, response);
		        	} catch (Exception e) {
		        		// TODO Auto-generated catch block
		        		e.printStackTrace();
		        	}
		        }
			
			 else if(command.equals("/rest_content.dae")) {
					action = new RestContentAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/restIndex.dae")) {
					action = new RestIndexAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
			//========================���� ����==============================
			
				 else if(command.equals("/rest_Update.dae")) {
			        	action = new RestUpdateAction();
			        	
			        	try {
			        		forward = action.execute(request, response);
			        	} catch (Exception e) {
			        		// TODO Auto-generated catch block
			        		e.printStackTrace();
			        	}
			        }
				 else if(command.equals("/rest_UpdatePro.dae")) {
			        	action = new RestUpdateProAction();
			        	
			        	try {
			        		forward = action.execute(request, response);
			        	} catch (Exception e) {
			        		// TODO Auto-generated catch block
			        		e.printStackTrace();
			        	}
			        }
			
			//========================���� 寃���==============================
			
			// 검색 안하고 서치 버튼 클릭시
				 else if(command.equals("/rest_Searchlist.dae")) {
			        	action = new RestSearchListAction();
			        	
			        	try {
			        		forward = action.execute(request, response);
			        	} catch (Exception e) {
			        		// TODO Auto-generated catch block
			        		e.printStackTrace();
			        	}
			        }
			
			// 검색하고 서치 버튼 클릭 시
				 else if(command.equals("/rest_Search.dae")) {
					 action = new RestSearchAction();
					 
					 try {
						 forward = action.execute(request, response);
					 } catch (Exception e) {
						 // TODO Auto-generated catch block
						 e.printStackTrace();
					 }
				 }
			//2~3개지역
			else if(command.equals("/rest_3areaCheckSearch.dae")) {
						action = new Rest3areaCheckSearchAction();
						
						try {
							forward = action.execute(request, response);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
			//각 지역 각 테마
			else if(command.equals("/rest_1EachCheckSearch.dae")) {
				action = new Rest1EachCheckSearchAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//2개 테마
			else if(command.equals("/rest_2categoryCheckSearch.dae")) {
				action = new Rest2categoryCheckSearchAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//======================== 리뷰작성 ==============================
			
			else if(command.equals("/restReview.dae")) {
				action = new RestReviewAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			
			else if(command.equals("/restReviewlike.dae")) {
				action = new RestReviewlikeAction();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
				
			//======================== 공지사항 ==============================
					else if(command.equals("/notice_writeForm.dae")) {
					action = new Notice_writeFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/notice_writePro.dae")) {
					action = new Notice_writeProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/serviceCenterList.dae")) {
					action = new ServiceCenterList();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				else if(command.equals("/notice_updateForm.dae")) {
		            action = new Notice_updateFormAction();
		            
		            try {
		               forward = action.execute(request, response);
		            } catch (Exception e) {
		               // TODO Auto-generated catch block
		               e.printStackTrace();
		            }
		      }
				else if(command.equals("/notice_updatePro.dae")) {
		            action = new Notice_updateProAction();
		            
		            try {
		               forward = action.execute(request, response);
		            } catch (Exception e) {
		               // TODO Auto-generated catch block
		               e.printStackTrace();
		            }
		      }
				else if(command.equals("/notice_deleteForm.dae")) {
					action = new Notice_deleteFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/notice_deletePro.dae")) {
					action = new Notice_deleteProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				//======================== FAQ ==============================
				else if(command.equals("/faq_writeForm.dae")) {
					action = new Faq_writeFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/faq_writePro.dae")) {
					action = new Faq_writeProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/serviceCenterFaqList.dae")) {
					action = new ServiceCenterFaqList();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/faq_updateForm.dae")) {
					action = new Faq_updateFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/faq_updatePro.dae")) {
					action = new Faq_updateProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/faq_deleteForm.dae")) {
					action = new Faq_deleteFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/faq_deletePro.dae")) {
					action = new Faq_deleteProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
				//======================== 1:1 문의 ==============================
				else if(command.equals("/oto_writeForm.dae")) {
					action = new Oto_writeFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/oto_writePro.dae")) {
					action = new Oto_writeProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/serviceCenterOtoList.dae")) {
					action = new ServiceCenterOtoList();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/serviceCenterOtoContent.dae")) {
					action = new ServiceCenterOtoContentAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/oto_deleteForm.dae")) {
					action = new Oto_deleteFormAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(command.equals("/oto_deletePro.dae")) {
					action = new Oto_deleteProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
			//======================== 고객센터 검색 ==============================
				else if(command.equals("/service_Search.dae")) {
					action = new ServiceSearchAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
			//======================== 마이페이지 ==============================
			
				else if(command.equals("/userPw_UpdatePro.dae")) {
					action = new UserPwUpdateProAction();
					
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
		
		
		
		
		
		
			//3.forward 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙漫占� 占쏙옙占쏙옙占쏙옙
			if(forward != null) {
				
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getUrl());
				}
				else {
					RequestDispatcher dispatcher = 
							request.getRequestDispatcher(forward.getUrl());
					dispatcher.forward(request, response);
				}
				
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // TODO Auto-generated method stub
         request.setCharacterEncoding("UTF-8");
         doGet(request, response);
      }
}
