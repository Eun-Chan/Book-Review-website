package com.brw.command.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.brw.command.Command;
import com.brw.dao.DAO;
import com.brw.dto.NoticeDTO;
import com.brw.dto.ReviewBoardViewDTO;

/*
 * 작성자 : 정명훈
 * 내용 : 리뷰검색결과 리스트 페이징
 */
public class ReviewSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAO dao = DAO.getInstance();
		
		// 파라미터 및 변수 처리
		String searchType = request.getParameter("searchType");
		String searchKeyword = request.getParameter("searchKeyword");
		
		int cPage = 0;
		try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		// numPerPage는 변할 일이 없으니 그냥 고정
		int numPerPage = 10;

		
		// 공지사항 가져오기 (allowview = Y 인 것만)
		List<NoticeDTO> ntcList = dao.noticeListAllow();
		// 페이징용 리뷰리스트 가져오기
		List<ReviewBoardViewDTO> list = dao.reivewSearch(searchType, searchKeyword, cPage, numPerPage);
		
		
		// 각 게시글에 대한 댓글 개수 가져오기
		for(int i=0; i<list.size(); i++) {
			int commentCnt = dao.getComment(list.get(i).getRbNo());
			list.get(i).setCommentCnt(commentCnt);
		}
		
		// 페이지바 작업
		int totalContents = dao.countReviewSearch(searchType, searchKeyword);
		
		int totalPages = (int)Math.ceil(((double)totalContents/numPerPage));
		
		int pageBarSize = 5;
		
		int startPage = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int endPage = startPage + pageBarSize - 1;
		
		int pageNo = startPage;
		
		// bootstrap 처리위해 리스트로 처리
		String pageBar = "<ul class='pagination'>";
		
		// [이전] 이전
		if(pageNo == 1) {
			pageBar += "<li class='page-item disabled'><a class='page-link'>이전</a></li>";
		}
		else {
			pageBar += "<li class='page-item'><a class='page-link' href='" 
						+ request.getContextPath() + "/review/reviewSearch.do?cPage=" + (pageNo-1) + "&searchType=" + searchType
						+ "&searchKeyword=" + searchKeyword + "'>이전</a></li>";
		}
		
		// 페이지 숫자 영역
		while(!(pageNo > endPage || pageNo > totalPages)) {
			if(pageNo == cPage) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='" 
						+ request.getContextPath() + "/review/reviewSearch.do?cPage=" + pageNo + "&searchType=" + searchType
						+ "&searchKeyword=" + searchKeyword + "'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}

		// [다음] 영역
		if(pageNo > totalPages) {
			pageBar += "<li class='page-item disabled'><a class='page-link'>다음</a></li>";
		}
		else {
			pageBar += "<li class='page-item'><a class='page-link' href='" 
						+ request.getContextPath() + "/review/reviewSearch.do?cPage=" + pageNo + "&searchType=" + searchType
						+ "&searchKeyword=" + searchKeyword + "'>다음</a>";
		}
		
		pageBar += "</ul>";
		
		
		
		
		
		request.setAttribute("ntcList", ntcList);
		request.setAttribute("list", list);
		request.setAttribute("pageBar", pageBar);
	}

}
