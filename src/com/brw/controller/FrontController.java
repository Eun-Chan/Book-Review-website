package com.brw.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brw.command.Command;
import com.brw.command.admin.NoticeDeleteCommand;
import com.brw.command.admin.NoticeDetailViewCommand;
import com.brw.command.admin.NoticeListCommand;
import com.brw.command.admin.NoticeReviseCommand;
import com.brw.command.admin.NoticeReviseEndCommand;
import com.brw.command.admin.NoticeSearchCommand;
import com.brw.command.admin.NoticeUpdateAllowViewCommand;
import com.brw.command.admin.NoticeWriteEndCommand;
import com.brw.command.admin.AdminMemberGradeUpdateCommand;
import com.brw.command.admin.AdminReviewBoardDeleteCommand;
import com.brw.command.book.BasketInsertCommand;
import com.brw.command.book.BasketSearchCommand;
import com.brw.command.book.BookBasketCommand;
import com.brw.command.book.BookInfomationCommand;
import com.brw.command.book.BookReviewCommand;
import com.brw.command.book.CheckedBasketCommand;
import com.brw.command.book.OneLineDeleteCommand;
import com.brw.command.book.OneLineInsertCommand;
import com.brw.command.index.IndexCommand;
import com.brw.command.review.DeleteReviewBoardCommand;
import com.brw.command.review.DeleteReviewBoardCommentCommand;
import com.brw.command.review.DeleteReviewBoardRecommentCommand;
import com.brw.command.review.GetReviewSelectOneCommand;
import com.brw.command.review.InsertCommentCommand;
import com.brw.command.review.InsertReCommentCommand;
import com.brw.command.review.InsertReviewBoardReport;
import com.brw.command.review.ReviewBoardLikeCommend;
import com.brw.command.review.ReviewPaginationCommand;
import com.brw.command.review.ReviewReviseCommand;
import com.brw.command.review.ReviewReviseEndCommand;
import com.brw.command.review.ReviewSearchCommand;
import com.brw.command.review.ReviewWriteEndCommand;
import com.brw.command.review.ReviewWriteImageCommand;
import com.brw.command.review.SelectAllReviewBoardReportCommand;
import com.brw.command.user.CheckAttendanceCommand;
import com.brw.command.user.CheckedPasswordCommand;
import com.brw.command.user.CreateUserCommand;
import com.brw.command.user.DeleteMemberCommand;
import com.brw.command.user.DoAttendanceCommand;
import com.brw.command.user.EmailAuthCommand;
import com.brw.command.user.FindEmailCheckCommand;
import com.brw.command.user.FindPwdEmailAuthCommand;
import com.brw.command.user.IdCheckCommand;
import com.brw.command.user.KakaoCreateUserCommand;
import com.brw.command.user.LoginCommand;
import com.brw.command.user.LogoutCommand;
import com.brw.command.user.NickNameCheckCommand;
import com.brw.command.user.OldPwdChangeOrLaterCommand;
import com.brw.command.user.PasswordUpdateCommand;
import com.brw.command.user.SearchIdForEmailCommand;
import com.brw.command.user.SelectAllMemberCommand;
import com.brw.command.user.SelectOneUserInfo;
import com.brw.command.user.UpdateUserCommand;
import com.brw.command.user.UserInfoViewCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(req,res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,res);
	}
	
	private void actionDo(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");   
		System.out.println("actionDo()");
		
		String uri = req.getRequestURI();
		String conPath = req.getContextPath();
		String command = uri.substring(conPath.length());
		
		// command pattern 을 위한 객체 생성
		Command com = null;
		String viewPage = null;
		
		/*
		 * 1. 유저 생성
		 */
		if(command.equals("/createUser.do")) {
			com = new CreateUserCommand();
			com.execute(req, res);
			viewPage = "index.jsp";
		}
		/*
		 * 2. 로그인 & 아이디 저장 & 유저 정보 세션 저장
		 */
		else if(command.equals("/login.do")) {
			com = new LoginCommand();
			com.execute(req, res);
		}
		/*
         * 3. 이메일 인증 & 이메일 중복 확인 command
         */
		else if(command.equals("/emailAuth.do")) {
			com = new EmailAuthCommand();
			com.execute(req,res);
		}
		/*
		 * 4. 회원가입 시 로그인 중복 확인
		 */
		else if(command.equals("/idCheck.do")) {
			com = new IdCheckCommand();
			com.execute(req, res);
		}
		/*
		 * 5. 회원가입 jsp로 이동
		 */
		else if(command.equals("/signUp.do")) {
			viewPage = "/WEB-INF/views/sign/signUp.jsp";
		}
		/*
		 * 6. 로그아웃
		 */
		else if(command.equals("/logout.do")) {
			com = new LogoutCommand();
			com.execute(req, res);
		}
		/*
		 * 7. index.jsp 최근 리뷰 & 인기 도서
		 */
		else if(command.equals("/index.do")) {
			com = new IndexCommand();
			com.execute(req, res);
		}
		/*
		 * 8. 알라딘 API
		 */
		else if(command.equals("/book/bookList.do")) {
	         viewPage = "/WEB-INF/views/book/bookList.jsp";
		}
		/*
		 * 9. 알라딘 API에서 Book List 중에서 Book 클릭 시 상세 내용
		 */
		else if(command.equals("/book/bookInfo.do")) {
			com = new BookInfomationCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/book/bookInfo.jsp";
		}
		/*
		 * 10. (9.) 상세 내용 밑에 댓글 내용 출력
		 */
		else if(command.equals("/book/bookreviewInfo.do")) {
			System.out.println("front성공");
			com = new BookReviewCommand();
			com.execute(req, res);
		}
		/*
		 * 11. 리뷰 리스트 (리뷰 게시판)
		 */
		else if(command.equals("/review/reviewList.do")) {
			com = new ReviewPaginationCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/review/reviewList.jsp";
		}
		/*
		 * 12. 리뷰 게시판 안에서 검색 결과
		 */
		else if(command.equals("/review/reviewSearch.do")) {
			com = new ReviewSearchCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/review/reviewSearch.jsp";
		}
		/*
		 * 13. 리뷰 게시판에서 리뷰 클릭 시 상세내용 
		 */
		else if(command.equals("/review/reviewDetail.do")) {
			//해당 게시물 가져오는 쿼리
			com = new GetReviewSelectOneCommand();
			//해당 게시글에 댓글 가져오는 쿼리가 들어와야함.
			com.execute(req, res);
			viewPage = "/WEB-INF/views/review/reviewDetail.jsp";
		}
		/*
		 * 14. 리뷰 상세 보기에서의 댓글
		 */
		else if(command.equals("/insertComment.do")) {
			com = new InsertCommentCommand();
			com.execute(req, res);
		}
		/*
		 * 15. 리뷰 상세 보기에서의 댓글의 댓글
		 */
		else if(command.equals("/insertReComment.do")) {
			com = new InsertReCommentCommand();
			com.execute(req, res);
		}
		/*
		 * 16. 리뷰 게시판에서 리뷰 작성 버튼 클릭 시 스마트 에디터를 통한 리뷰 작성
		 */
		else if(command.equals("/review/reviewWrite.do")) {
			viewPage = "/WEB-INF/views/review/reviewWrite.jsp";
		}
		/*
		 * 17. 리뷰 작성에 대한 정보(제목, 내용, 도서명, ISBN, 작성자) 입력 후 리뷰 등록
		 */
	    else if(command.equals("/review/reviewWriteEnd.do")) {
	    	com = new ReviewWriteEndCommand();
			com.execute(req, res);
			int result = (int)req.getAttribute("result");
			if(result > 0) {
				int lastReviewBoardNo = (int)req.getAttribute("lastReviewBoardNo");
				viewPage = "/review/reviewDetail.do?rbNo=" + lastReviewBoardNo;
			}
			else {
				viewPage = "/WEB-INF/views/review/bookList.jsp";
			}
	    }
		/*
		 * 18. BookList에서 책 검색 시 결과
		 */
	    else if(command.equals("/review/bookSearch.do")) {
	       viewPage = "/WEB-INF/views/review/bookSearch.jsp";
	    }
		/*
		 * 19. 아이디 혹은 비밀번호 찾기 페이지 이동
		 */
	    else if(command.equals("/idAndPwdSearch.do")) {
	    	viewPage = "/WEB-INF/views/sign/idAndPwdSearch.jsp";
	    }
		/*
		 * 20. 아이디 찾기 시 이메일이 존재하는지 확인
		 */
	    else if(command.equals("/emailCheck.do")) {
	    	com = new FindEmailCheckCommand();
	    	com.execute(req, res);
	    }
		/**
		 * 21. BookInfo에서 즐겨찾기(장바구니) 클릭시 Book DB저장 및 Basket DB 저장
		 */
	    else if(command.equals("/book/basket.do")) {
	    	com = new BasketInsertCommand();
	    	com.execute(req, res);
	    	String returnIsbnNo = (String) req.getAttribute("returnIsbnNo");
	    	viewPage = "/book/bookInfo.do?isbn13="+returnIsbnNo;
	    	System.out.println("viewPage"+viewPage);
	    }
		
		/*
		 * 22. 좋아요 버튼 클릭시 처리 ajax 
		 */
	    else if(command.equals("/review/reviewLike.do")){
	    	com = new ReviewBoardLikeCommend();
	    	com.execute(req,res);
	    }
		/*
		 * 23. 댓글 삭제 쿼리  
		 */
	    else if(command.equals("/review/reviewCommentDelete.do")) {
	    	com = new DeleteReviewBoardCommentCommand();
	    	com.execute(req, res);
	    }
		/*24. 즐겨찾기 보여주는 결과*/
	    else if(command.equals("/book/showBookBasket.do")) {
	    	com = new BookBasketCommand();
	    	com.execute(req, res);
	    }
		/*25. 즐겨찾기로 가버렷*/
	    else if(command.equals("/book/goBasket.do")) {
	    	viewPage = "/WEB-INF/views/book/bookBasket.jsp";
	    }
		/**
		 * 26. 이메일을 통해 아이디 찾아보리기
		 */
	    else if(command.equals("/sign/searchIdForEmail.do")) {
	    	com = new SearchIdForEmailCommand();
	    	com.execute(req, res);
	    }
		/*
		 * 27. 지수킹이 만든 IdSearchEnd.jsp 로 보내버리기 (아이디 찾기 성공시 나오는 view)
		 */
	    else if(command.equals("/sign/idSearchEnd.do")) {
	    	System.out.println("여기 컨트롤러 idSearchEnd.do");
	    	viewPage = "/WEB-INF/views/sign/IdSearchEnd.jsp";
	    }
		/*
		 * 28.check된 책 없애기
		 */
	    else if(command.equals("/book/checkedBasket.do")) {
	    	com = new CheckedBasketCommand();
	    	com.execute(req, res);
	    }
		/**
		 * 29
		 * 작성자 : 김은찬
		 * 내용 : 아이디를 통해 이메일을 찾고, 메일로 인증번호 보내기
		 */
	    else if(command.equals("/sign/findPwdEmailAuth.do")) {
	    	com = new FindPwdEmailAuthCommand();
	    	com.execute(req, res);
	    }
		/**
		 * 30
		 * 작성자 : 김은찬
		 * 내용 : 비밀번호 찾기 시 비밀번호 변경
		 */
	    else if(command.equals("/sign/passwordUpdate.do")) {
	    	com = new PasswordUpdateCommand();
	    	com.execute(req, res);
	    	viewPage = "/index.jsp";
	    }
		/**
		 * 31
		 * 작성자 : 김은찬
		 * 내용 : 비밀번호 변경 페이지로 이동
		 */
	    else if(command.equals("/sign/changePwd.do")) {
	    	/* 회원에게 입력받은 아아디를 changePwd.jsp에 옮기는 용도*/
	    	String userId = req.getParameter("userId");
	    	req.setAttribute("userId", userId);
	    	viewPage = "/WEB-INF/views/sign/changePwd.jsp";
	    }
		/**
		 * 32
		 * 작성자 : 김은찬
		 * 내용 : 카카오톡 유저 회원가입 (카카오톡 유저 로그인 기능도 담당)
		 */
	    else if(command.equals("/sign/kakaoCreateUserCommand.do")) {
	    	com = new KakaoCreateUserCommand();
	    	com.execute(req, res);
	    }

		/*33. 명훈 : 리뷰글 등록시 이미지 저장 ajax*/
	    else if(command.equals("/review/reviewWriteImage.do")) {
	    	com = new ReviewWriteImageCommand();
	    	com.execute(req, res);
	    }
		/*34. 한 줄 리뷰 등록: 김민우*/
	    else if(command.equals("/book/oneLineRV.do")) {
	    	com = new OneLineInsertCommand();
	    	com.execute(req, res);
	    }
		/*35 . 회원가입시 닉네임 체크*/
		else if(command.equals("/nickNameCheck.do")) {
			com = new NickNameCheckCommand();
			com.execute(req, res);
		}
		/*36. 명훈 : 공지사항 상세보기*/
		else if(command.equals("/admin/noticeDetail.do")) {
			com = new NoticeDetailViewCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/admin/noticeDetail.jsp";
		}
		/*37. 한 줄 리뷰 삭제 버튼 구현 : 김민우*/
		else if(command.equals("/book/oneLineDel.do")) {
			com = new OneLineDeleteCommand();
			com.execute(req, res);
		}
		/*38. 명훈 : 공지사항 리스트 페이지*/
		else if(command.equals("/admin/noticeList.do")) {
			com = new NoticeListCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/admin/noticeList.jsp";
		}
		/*39. 명훈 : 공지사항 리스트 검색 페이지*/
		else if(command.equals("/admin/noticeSearch.do")) {
			com = new NoticeSearchCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/admin/noticeList.jsp";
		}
		/*40. 명훈 : 공지사항 보이기/보이지않기 관리 ajax*/
		else if(command.equals("/admin/noticeUpdateAllowView.do")) {
			com = new NoticeUpdateAllowViewCommand();
			com.execute(req, res);
		}
		/*41. 지수 : 비밀번호 변경한지 90일이상 지난 닌겐들 변경페이지로 보내보리기 */
	    else if(command.equals("/sign/OldPwdChangeOrLater.do")) {
	    	viewPage = "/WEB-INF/views/sign/OldPwdChangeOrLater.jsp";
	    }
		/*42. 지수 : 비밀번호 변경한지 90일이상 지난 닌겐들 비밀번호 변경시켜보리기 */
	    else if(command.equals("/sign/OldPwdChangeOrLaterUpdate.do")) {
	    	com = new OldPwdChangeOrLaterCommand();
	    	com.execute(req, res);
	    }
		/*43 . 선웅 : 신고 페이지 고고띵*/
		else if(command.equals("/review/reviewReport.do")) {
			viewPage="/WEB-INF/views/review/reviewReport.jsp";
		}

		/*44 . 선웅 : 신고 페이지 insert 및 리뷰보드 업데이트, 메일발송까지*/
		else if(command.equals("/review/insertReviewBoardReport.do")) {
			com = new InsertReviewBoardReport();
			com.execute(req, res);
		}
		
		/*45. 선웅 :  내정보 보기 창*/
		else if(command.equals("/sign/userPrivacy.do")) {
			com = new SelectOneUserInfo();
			com.execute(req, res);
			viewPage="/WEB-INF/views/sign/userInfo.jsp";
			
		}
		/*46. 선웅: 내정보보기 클릭시 보여주는 jsp*/
		else if(command.equals("/sign/userPasswordCheck.do")) {
			viewPage="/WEB-INF/views/sign/userInfoPasswordChecked.jsp";
		}
		
		/*47. 33에서 비밀번호 데이터를 넘겻을때 user테이블과 값 비교 ajax*/
		else if(command.equals("/sign/checkedPassword.do")) {
			com = new CheckedPasswordCommand();
			com.execute(req, res);
		}
		/*48. @광준 : 최종 유저정보 업데이트 */
		else if(command.equals("/sign/updateUser.do")) {
			com = new UpdateUserCommand();
			com.execute(req, res);
			//아작스라 뷰페이지가 없어유
		}

		/*49. 명훈 : 공지사항 작성 페이지 */
		else if(command.equals("/admin/noticeWrite.do")) {
			viewPage = "/WEB-INF/views/admin/noticeWrite.jsp";
		}
		/*50. 명훈 : 작성한 공지사항 등록 후 작성한 공지사항 상세보기 */
		else if(command.equals("/admin/noticeWriteEnd.do")) {
			com = new NoticeWriteEndCommand();
			com.execute(req, res);
			int result = (int)req.getAttribute("result");
			if(result > 0) {
				int lastNoticeNo = (int)req.getAttribute("lastNoticeNo");
				viewPage = "/admin/noticeDetail.do?ntcNo=" + lastNoticeNo;
			}
			else {
				viewPage = "/WEB-INF/views/admin/noticeList.jsp";
			}
		}
		/*51. 명훈 : 출석체크 페이지 */
		else if(command.equals("/checkAttendance.do")) {
			com = new CheckAttendanceCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/sign/checkAttendance.jsp";
		}
		/*52 선웅 : 대댓글 삭제 : 작업중*/
		else if(command.equals("/review/reviewReCommentDelete.do")) {
			com = new DeleteReviewBoardRecommentCommand();
			com.execute(req, res);
		}
		/*53. 선웅 게시글 삭제*/
		else if(command.equals("/review/reviewDelete.do")) {
			com = new DeleteReviewBoardCommand();
			com.execute(req, res);
		}
		/*54 . 선웅 : 회원관리*/
		else if(command.equals("/sign/adminManager.do")) {
			viewPage="/WEB-INF/views/sign/adminManager.jsp";
		}
		/*55. 선웅: 신고횟수가 10을 넘기면 회원삭제 가능*/
		else if(command.equals("/sign/memberDelete.do")) {
			com = new DeleteMemberCommand();
			com.execute(req, res);
		}
		/*56 명훈 : 리뷰글 수정 페이지로 이동 */
		else if(command.equals("/review/reviewRevise.do")) {
			com = new ReviewReviseCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/review/reviewRevise.jsp";
		}
		/*57 명훈 : 리뷰글 수정 디비 변경 */
		else if(command.equals("/review/reviewReviseEnd.do")) {
			com = new ReviewReviseEndCommand();
			com.execute(req, res);
			int rbNo = (int)req.getAttribute("rbNo");
			viewPage = "/review/reviewDetail.do?rbNo=" + rbNo;
		}	
		/*58 광준 : 내 정보보기 페이지로 이동*/
		else if(command.equals("/sign/userInfoView.do")) {
			viewPage = "/WEB-INF/views/sign/userInfoView.jsp";
		}
		/*59.광준 : 내 정보보기 페이지 데이터 로드(내가 쓴 글/댓글)*/
		else if(command.equals("/sign/userInfoViewJoin.do")) {
			com = new UserInfoViewCommand();
			com.execute(req, res);
		}

		/*60 세준 : 즐겨찾기 검색시 결과창*/
		else if(command.equals("/book/basketSearch.do")) {
			com = new BasketSearchCommand();
			com.execute(req, res);
		}
		/*61.명훈 : 출석체크 하기 */
		else if(command.equals("/doAttendance.do")) {
			com = new DoAttendanceCommand();
			com.execute(req, res);
			viewPage = "/checkAttendance.do";
		}
		/*62 선웅 : 게시판 관리 피이지  이동*/
		else if(command.equals("/review/adminReviewBoardManage.do")) {
			viewPage = "/WEB-INF/views/review/adminReviewBoardManage.jsp";
		}
		/*63 선웅: 회원관리 페이지*/
		else if(command.equals("/sign/memberManager.do")) {
			com = new SelectAllMemberCommand();
			com.execute(req, res);
			viewPage ="/WEB-INF/views/sign/memberManager.jsp";
		}
		/*64 선웅 : 게시판 관리 페이지*/
		else if(command.equals("/review/reviewBoardManager.do")){
			com = new SelectAllReviewBoardReportCommand();
			com.execute(req, res);
			viewPage="/WEB-INF/views/review/adminReviewBoardManage.jsp";
		}
		/*65 선웅 : 관리자 게시판 삭제*/
		else if(command.equals("/review/adminReviewDelete.do")) {
			com = new AdminReviewBoardDeleteCommand();
			com.execute(req, res);
		}	
		/*66 명훈 : 공지사항 수정 페이지로 이동*/
		else if(command.equals("/admin/noticeRevise.do")) {
			com = new NoticeReviseCommand();
			com.execute(req, res);
			viewPage = "/WEB-INF/views/admin/noticeRevise.jsp";
		}
		/*67 명훈 : 공지사항 수정 업데이트*/
		else if(command.equals("/admin/noticeReviseEnd.do")) {
			com = new NoticeReviseEndCommand();
			com.execute(req, res);
			int ntcNo = Integer.parseInt(req.getParameter("ntcNo"));
			viewPage = "/admin/noticeDetail.do?ntcNo="+ntcNo;
		}
		/*68 명훈 : 공지사항 삭제*/
		else if(command.equals("/admin/noticeDelete.do")) {
			com = new NoticeDeleteCommand();
			com.execute(req, res);
			viewPage = "/admin/noticeList.do";
		}
		/*69.광준 : 내 정보보기 페이징 처리*/
		else if(command.equals("/sign/userInfoViewSelect.do")) {
			com = new UserInfoViewCommand();
			int cPage = Integer.parseInt(req.getParameter("cPage"));
			com.execute(req, res);
			viewPage = "/sign/userInfoViewJoin.do?=cPage"+cPage;
		}
		
		/*70 선웅 : 관리자 회원 등급 업*/
		else if(command.equals("/sign/updateGrade.do")) {
			com = new AdminMemberGradeUpdateCommand();
			com.execute(req, res);
		}
		if(viewPage!=null){			
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);	
		}
	}
}
