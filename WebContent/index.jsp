<%@page import="com.brw.dto.ReviewBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css" />
 <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon_book.ico" />
<title>책 읽는 사람들</title>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- Body -->
	<%-- <a href="<%=request.getContextPath()%>/reviewList.do">헤헤</a>
	<a href="<%=request.getContextPath()%>/review/reviewList.do">리뷰게시판</a>
	<a href="<%=request.getContextPath()%>/book/bookInfo.do">해리포터상세보기테스트</a>
	<a href="<%=request.getContextPath()%>/book/bookList.do">도서검색테스트</a>
	<a href="<%=request.getContextPath()%>/book/showbasket.do">도서즐겨찾기테스트</a> --%>
	
	<!-- 인기도서 출력 Start -->
	<form action="<%=request.getContextPath()%>/index.do"	id="indexForm" method="post"></form>
	<div class="masthead">
       <!-- <h3 class="text-muted">책 읽는 사람들</h3> -->
       <nav>
         <ul class="nav nav-justified">
           <li class="active"><a href="#" id="select-AllBook">통합</a></li>
           <li><a href="#" id="select-NewBook">신간</a></li>
           <li><a href="#" id="select-ForeginBook">외국</a></li>
           <li><a href="#" id="select-eBook">e북</a></li>
         </ul>
       </nav>
     </div>
      
     <div class="container">
      
	<!-- 첫번째 -->
    <div class="row">
	  <div class="col-sm-6 col-md-3">
	   <div class="thumbnail">
	   	 <img class="img-thumbnail" id="bookImage0">
	     <div class="caption">
	       <div class="span-center"><span id="book0" class="bestseller-title"></span></div>
	       <p id="book-Author0" class="book-Author"> </p>
	       <!-- 별점 -->
	       <div id="start-Container">
	       <div class="starRev0">
			  <span class="starR1" id="star0-0">별1_왼쪽</span>
			  <span class="starR2" id="star0-1">별1_오른쪽</span>
			  <span class="starR1" id="star0-2">별2_왼쪽</span>
			  <span class="starR2" id="star0-3">별2_오른쪽</span>
			  <span class="starR1" id="star0-4">별3_왼쪽</span>
			  <span class="starR2" id="star0-5">별3_오른쪽</span>
			  <span class="starR1" id="star0-6">별4_왼쪽</span>
			  <span class="starR2" id="star0-7">별4_오른쪽</span>
			  <span class="starR1" id="star0-8">별5_왼쪽</span>
			  <span class="starR2" id="star0-9">별5_오른쪽</span>
			</div>
			</div>
			<br /><br />
			<div id="button-Container">
	       		<p><a href="#" class="btn btn-primary" role="button">구매하기</a> <a href="#" class="btn btn-default" role="button" id="detail-Book0">더 보기</a></p>
	        </div>
	     </div>
	   </div>
	 </div>
	 
	<!-- 두번째 -->
	<div class="col-sm-6 col-md-3">
	   <div class="thumbnail">
	   	 <img class="img-thumbnail" id="bookImage1"> 
	     <div class="caption">
	       <div class="span-center"><span id="book1" class="bestseller-title"></span></div>
	       <p id="book-Author1" class="book-Author"> </p>
	       <!-- 별점 -->
	       <div id="start-Container">
	       <div class="starRev0">
			  <span class="starR1" id="star1-0">별1_왼쪽</span>
			  <span class="starR2" id="star1-1">별1_오른쪽</span>
			  <span class="starR1" id="star1-2">별2_왼쪽</span>
			  <span class="starR2" id="star1-3">별2_오른쪽</span>
			  <span class="starR1" id="star1-4">별3_왼쪽</span>
			  <span class="starR2" id="star1-5">별3_오른쪽</span>
			  <span class="starR1" id="star1-6">별4_왼쪽</span>
			  <span class="starR2" id="star1-7">별4_오른쪽</span>
			  <span class="starR1" id="star1-8">별5_왼쪽</span>
			  <span class="starR2" id="star1-9">별5_오른쪽</span>
			</div>
			</div>
			<br /><br />
	       <p><a href="#" class="btn btn-primary" role="button">구매하기</a> <a href="#" class="btn btn-default" role="button" id="detail-Book1">더 보기</a></p>
	     </div>
	   </div>
	</div>
	
	<!-- 세번째 -->
	<div class="col-sm-6 col-md-3">
	   <div class="thumbnail">
	     <img class="img-thumbnail" id="bookImage2"> 
	     <div class="caption">
	       <div class="span-center"><span id="book2" class="bestseller-title"></span></div>
	       <p id="book-Author2" class="book-Author"> </p>
	       <!-- 별점 -->
	       <div id="start-Container">
	       <div class="starRev0">
			  <span class="starR1" id="star2-0">별1_왼쪽</span>
			  <span class="starR2" id="star2-1">별1_오른쪽</span>
			  <span class="starR1" id="star2-2">별2_왼쪽</span>
			  <span class="starR2" id="star2-3">별2_오른쪽</span>
			  <span class="starR1" id="star2-4">별3_왼쪽</span>
			  <span class="starR2" id="star2-5">별3_오른쪽</span>
			  <span class="starR1" id="star2-6">별4_왼쪽</span>
			  <span class="starR2" id="star2-7">별4_오른쪽</span>
			  <span class="starR1" id="star2-8">별5_왼쪽</span>
			  <span class="starR2" id="star2-9">별5_오른쪽</span>
			</div>
			</div>
			<br /><br />
	       <p><a href="#" class="btn btn-primary" role="button">구매하기</a> <a href="#" class="btn btn-default" role="button" id="detail-Book2">더 보기</a></p>
	     </div>
	   </div>
	 </div>
	<!-- 네번째 -->
	<div class="col-sm-6 col-md-3">
	  <div class="thumbnail">
	    <img class="img-thumbnail" id="bookImage3"> 
	    <div id="bookImage3"></div>
	    <div class="caption">
	      <div class="span-center"><span id="book3" class="bestseller-title"></span></div>
	      <p id="book-Author3" class="book-Author"> </p>
	      <!-- 별점 -->
	       <div id="start-Container">
	       <div class="starRev0">
			  <span class="starR1" id="star3-0">별1_왼쪽</span>
			  <span class="starR2" id="star3-1">별1_오른쪽</span>
			  <span class="starR1" id="star3-2">별2_왼쪽</span>
			  <span class="starR2" id="star3-3">별2_오른쪽</span>
			  <span class="starR1" id="star3-4">별3_왼쪽</span>
			  <span class="starR2" id="star3-5">별3_오른쪽</span>
			  <span class="starR1" id="star3-6">별4_왼쪽</span>
			  <span class="starR2" id="star3-7">별4_오른쪽</span>
			  <span class="starR1" id="star3-8">별5_왼쪽</span>
			  <span class="starR2" id="star3-9">별5_오른쪽</span>
			</div>
			</div>
			<br /><br />
	      <p><a href="#" class="btn btn-primary" role="button">구매하기</a> <a href="#" class="btn btn-default" role="button" id="detail-Book3">더 보기</a></p>
	    </div>
	  </div>
	</div>
	 </div> <!-- rowEnd -->
    </div> <!-- /container -->
    <!-- 인기도서 출력 End -->
    
    <!-- 최근 리뷰 Start -->
    <div id="recent-Review">
	    <h3 class="subTitle"><strong>최근 리뷰</strong></h3>
	    <!-- <hr class="title-line" /> -->
	    
	    <!-- 새로운 리뷰 -->
	    <div id="table-container-index">
	      <table class="table table-hover table-info table-responsive" id="review-list-table">
	         <thead>
	            <tr>
	               <th class="col-sm-3">도서명</th>
	               <th class="col-sm-3">제목</th>
	               <th>작성자</th>
	               <th>조회수</th>
	               <th>추천수</th>
	            </tr>
	         </thead>
	         <tbody>
	         	<!-- 첫번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="bookName0" class="bookName"></td>
	           	 	<td id="rbTitle0" class="rbTitle"></td>
	           	 	<td id="writer0" class="writer"></td>
	           	 	<td id="readCnt0" class="readCnt"></td>
	           	 	<td id="recommendCnt0" class="recommendCnt"></td>
	           	 	<input type="hidden" id="rbNo0" />
	            </tr>
	            <!-- 두번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="bookName1" class="bookName"></td>
	           	 	<td id="rbTitle1" class="rbTitle"></td>
	           	 	<td id="writer1" class="writer"></td>
	           	 	<td id="readCnt1" class="readCnt"></td>
	           	 	<td id="recommendCnt1" class="recommendCnt"></td>
	           	 	<input type="hidden" id="rbNo1" />
	            </tr>
	            <!-- 세번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="bookName2" class="bookName"></td>
	           	 	<td id="rbTitle2" class="rbTitle"></td>
	           	 	<td id="writer2" class="writer"></td>
	           	 	<td id="readCnt2" class="readCnt"></td>
	           	 	<td id="recommendCnt2" class="recommendCnt"></td>
	           	 	<input type="hidden" id="rbNo2" />
	            </tr>
	            <!-- 네번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="bookName3" class="bookName"></td>
	           	 	<td id="rbTitle3" class="rbTitle"></td>
	           	 	<td id="writer3" class="writer"></td>
	           	 	<td id="readCnt3" class="readCnt"></td>
	           	 	<td id="recommendCnt3" class="recommendCnt"></td>
	           	 	<input type="hidden" id="rbNo3" />
	            </tr>
	            <!-- 다섯번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="bookName4" class="bookName"></td>
	           	 	<td id="rbTitle4" class="rbTitle"></td>
	           	 	<td id="writer4" class="writer"></td>
	           	 	<td id="readCnt4" class="readCnt"></td>
	           	 	<td id="recommendCnt4" class="recommendCnt"></td>
	           	 	<input type="hidden" id="rbNo4" />
	            </tr>
	         </tbody>
	      </table>
	   </div> <!-- end of #table-container -->
   </div> <!-- 최근 리뷰 End -->
   <!-- 인기 리뷰 Start -->
   <div id="bestReview">
   	<h3 class="subTitle"><strong>인기 리뷰</strong></h3>
	    <!-- <hr class="title-line" /> -->
	    
	    <!-- 새로운 리뷰 -->
	    <div id="table-container-index2">
	      <table class="table table-hover table-info table-responsive" id="review-list-table">
	         <thead>
	            <tr>
	               <th class="col-sm-3">도서명</th>
	               <th class="col-sm-3">제목</th>
	               <th>작성자</th>
	               <th>조회수</th>
	               <th>추천수</th>
	            </tr>
	         </thead>
	         <tbody>
	         	<!-- 첫번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="best-bookName0" class="bookName"></td>
	           	 	<td id="best-rbTitle0" class="rbTitle"></td>
	           	 	<td id="best-writer0" class="writer"></td>
	           	 	<td id="best-readCnt0" class="readCnt"></td>
	           	 	<td id="best-recommendCnt0" class="recommendCnt"></td>
	           	 	<input type="hidden" id="best-rbNo0" />
	            </tr>
	            <!-- 두번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="best-bookName1" class="bookName"></td>
	           	 	<td id="best-rbTitle1" class="rbTitle"></td>
	           	 	<td id="best-writer1" class="writer"></td>
	           	 	<td id="best-readCnt1" class="readCnt"></td>
	           	 	<td id="best-recommendCnt1" class="recommendCnt"></td>
	           	 	<input type="hidden" id="best-rbNo1" />
	            </tr>
	            <!-- 세번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="best-bookName2" class="bookName"></td>
	           	 	<td id="best-rbTitle2" class="rbTitle"></td>
	           	 	<td id="best-writer2" class="writer"></td>
	           	 	<td id="best-readCnt2" class="readCnt"></td>
	           	 	<td id="best-recommendCnt2" class="recommendCnt"></td>
	           	 	<input type="hidden" id="best-rbNo2" />
	            </tr>
	            <!-- 네번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="best-bookName3" class="bookName"></td>
	           	 	<td id="best-rbTitle3" class="rbTitle"></td>
	           	 	<td id="best-writer3" class="writer"></td>
	           	 	<td id="best-readCnt3" class="readCnt"></td>
	           	 	<td id="best-recommendCnt3" class="recommendCnt"></td>
	           	 	<input type="hidden" id="best-rbNo3" />
	            </tr>
	            <!-- 다섯번째 -->
	            <tr class="recent_comment">
	             	<!-- Content -->
	           	 	<td id="best-bookName4" class="bookName"></td>
	           	 	<td id="best-rbTitle4" class="rbTitle"></td>
	           	 	<td id="best-writer4" class="writer"></td>
	           	 	<td id="best-readCnt4" class="readCnt"></td>
	           	 	<td id="best-recommendCnt4" class="recommendCnt"></td>
	           	 	<input type="hidden" id="best-rbNo4" />
	            </tr>
	         </tbody>
	      </table>
	   </div> <!-- end of #table-container -->
   </div>
   <br><br />
<script>


/**
 * @광준 : 책정렬 메뉴를 선택했을 시
 */
$("a#select-AllBook, a#select-NewBook, a#select-ForeginBook, a#select-eBook").click(function(){
	var select = $(this).text();
	var searchUrl = "";
	
	switch(select)
	{
		case "통합" : searchUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbkmw71511428001&QueryType=Bestseller&MaxResults=20&start=1&SearchTarget=Book&output=js&Version=20131101"; break;
		case "신간" : searchUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbkmw71511428001&QueryType=ItemNewSpecial&MaxResults=20&start=1&SearchTarget=Book&output=js&Version=20131101"; break;
		case "외국" : searchUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbkmw71511428001&QueryType=Bestseller&MaxResults=20&start=1&SearchTarget=Foreign&output=js&Version=20131101"; break;
		case "e북" : searchUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbkmw71511428001&QueryType=Bestseller&MaxResults=20&start=1&SearchTarget=eBook&output=js&Version=20131101"; break;
	}
	reloadBookInfo(searchUrl);
});

/**
 * @광준 : 책정렬 메뉴를 선택했을 때 Data처리
 */
 
function reloadBookInfo(searchUrl){
	/* 베스트셀러 10건을 가져온다. */
	$.ajax({
	    url: searchUrl,
	    dataType: "jsonp",
	    success:function(data)
	    {	
	    	console.log(data);
	    	/* 책 정보 파싱 >> 리스트 */
	    	var bookList = [];
	    	
	    	for(var i in data.item)
	   		{    		
	   			var book = data.item[i]; //가져온 data에 item에 객체배열로 담겨있다. 이걸 하나씩 꺼냄. 각 정보는 api를 참고하면 됨
	   			var isbn13 = book.isbn13; //도서분류 고유값
	   			var title = book.title; //도서제목
	   			var author = book.author; //도서저자
	   			var cover = book.cover; //도서이미지
	   			var adult = book.adult; //성인등급 확인(true:ㅎㅎ/false:없음)
	   			
	   			//성인등급이 false일 경우에만 추가
	   			if(!adult && isbn13 != "") bookList.push({"isbn13":isbn13, "title":title, "author":author, "cover":cover});
	   		}
	    	
	    	
	    	//난수생성
			var ranNum = new Array();
	    	
	    	for(var i=0; i<bookList.length; i++)
	   		{
	   			ranNum[i] = Math.floor(Math.random()*(bookList.length));
	
	   			for(var j=0; j<i; j++)
				{
					if(ranNum[j] == ranNum[i])
					{
						i--;
						continue;
					}
				}
	   		}
	
	    	/* 데이터 view 처리*/
			$("span#book0").html((bookList[ranNum[0]].title).length>12?(bookList[ranNum[0]].title).substr(0,10)+"…":(bookList[ranNum[0]].title));
			$("p#book-Author0").html((bookList[ranNum[0]].author).length>10?(bookList[ranNum[0]].author).substr(0,10)+"...":(bookList[ranNum[0]].author));
			$("#bookImage0").attr("src", bookList[ranNum[0]].cover);
			
			$("span#book1").html((bookList[ranNum[1]].title).length>12?(bookList[ranNum[1]].title).substr(0,10)+"…":(bookList[ranNum[1]].title));
			$("p#book-Author1").html((bookList[ranNum[1]].author).length>10?(bookList[ranNum[1]].author).substr(0,10)+"...":(bookList[ranNum[1]].author));
			$("#bookImage1").attr("src", bookList[ranNum[1]].cover);
			
			$("span#book2").html((bookList[ranNum[2]].title).length>12?(bookList[ranNum[2]].title).substr(0,10)+"…":(bookList[ranNum[2]].title));
			$("p#book-Author2").html((bookList[ranNum[2]].author).length>10?(bookList[ranNum[2]].author).substr(0,10)+"...":(bookList[ranNum[2]].author));
			$("#bookImage2").attr("src", bookList[ranNum[2]].cover);
			
			$("span#book3").html((bookList[ranNum[3]].title).length>12?(bookList[ranNum[3]].title).substr(0,10)+"…":(bookList[ranNum[3]].title));
			$("p#book-Author3").html((bookList[ranNum[3]].author).length>10?(bookList[ranNum[3]].author).substr(0,10)+"...":(bookList[ranNum[3]].author));
			$("#bookImage3").attr("src", bookList[ranNum[3]].cover);	
			
			/**
			 * @광준
			 * API로 가져온 도서정보에서 우리 DB의 별점 데이터를 가져오기 위해 변수로 IBSN 정보를 저장한다. 
			 */
			var bookIsbn = [];
			bookIsbn.push(bookList[ranNum[0]].isbn13);
			$("a#detail-Book0").prop('href', "<%=request.getContextPath()%>/book/bookInfo.do?isbn13=" + bookList[ranNum[0]].isbn13);
			bookIsbn.push(bookList[ranNum[1]].isbn13);
			$("a#detail-Book1").prop('href', "<%=request.getContextPath()%>/book/bookInfo.do?isbn13=" + bookList[ranNum[1]].isbn13);
			bookIsbn.push(bookList[ranNum[2]].isbn13);
			$("a#detail-Book2").prop('href', "<%=request.getContextPath()%>/book/bookInfo.do?isbn13=" + bookList[ranNum[2]].isbn13);
			bookIsbn.push(bookList[ranNum[3]].isbn13);
			$("a#detail-Book3").prop('href', "<%=request.getContextPath()%>/book/bookInfo.do?isbn13=" + bookList[ranNum[3]].isbn13);
			startPage(bookIsbn);
	    },
	    error:function()
	    {
	    	console.log("index.jsp_베스트셀러 View_광준@ajax처리에 실패했습니다.");
	    }
	 });
}

function startPage(bookIsbn){
/* 최근리뷰 view */
$('#indexForm').ready(function(){
   $.ajax({
        type: 'post',
        url: "<%=request.getContextPath()%>/index.do?bookIsbn="+bookIsbn,
        contentType: "application/json; charset=utf-8;",
        success: function(data){
        	console.log(data);
            for(var i in data[0])
           	{
            	if(data[0][i] != null && !(isEmpty(data[0][i]))) //isEmpty함수가 없기 때문에, 직접 정의한다.(하단에 변수참고)
           		{
	            	$("td#bookName"+i).text((data[0][i].rbBookTitle).length > 10?(data[0][i].rbBookTitle).substr(0,10)+"…":(data[0][i].rbBookTitle));
		            $("td#writer"+i).text(data[0][i].rbWriter);
		            $("td#rbTitle"+i).text(data[0][i].rbTitle);
		           	$("td#readCnt"+i).text(data[0][i].rb_readCnt);
		           	$("td#recommendCnt"+i).text(data[0][i].rb_recommend); 	           
		           	$("input#rbNo"+i).text(data[0][i].rbNo);
		           	
		           	/* 인기 리뷰 */
		           	$("td#best-bookName"+i).text((data[2][i].rbBookTitle).length > 10?(data[2][i].rbBookTitle).substr(0,10)+"…":(data[2][i].rbBookTitle));
		            $("td#best-writer"+i).text(data[2][i].rbWriter);
		            $("td#best-rbTitle"+i).text(data[2][i].rbTitle);
		           	$("td#best-readCnt"+i).text(data[2][i].rb_readCnt);
		           	$("td#best-recommendCnt"+i).text(data[2][i].rb_recommend);
		           	$("input#best-rbNo"+i).text(data[2][i].rbNo);
           		}
           	}    
            /* 베스트셀러 별점처리 */
            for(var j=0; i<data[1].length; j++)
            {
	            var totalStarScore = scoreRound(data[1][j].starScoreBook);
	           	var selectStarScore = totalStarScore / 0.5;
	           	for(var i=0; i<selectStarScore; i++)
	       		{
	           		$("span#star"+j+"-"+i).addClass('on');
	       		}
            }

        },
        error: function(){
        	console.log("index.jsp_최근리뷰 View, 별점정보를 읽기_광준@ajax처리에 실패했습니다.");
        }
   });
    return false; //<- 이 문장으로 새로고침(reload)이 방지됨
});
}; //startPage End

/**
 * @광준 : 최근리뷰 view 링크 연결
 */
$(".recent_comment").click(function(){
	var rbNo_parameter = ($(this).find("input")).text();
	location.href = "<%=request.getContextPath()%>/review/reviewDetail.do?rbNo="+rbNo_parameter;
});
	
$('.starRev span').click(function(){
  $(this).parent().children('span').removeClass('on');
  $(this).addClass('on').prevAll('span').addClass('on');
  return false;
});	

//요소가 비어있는지 검사하는 함수
var isEmpty = function(value){
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
		return true;
	}else{ 
		return false;
	}
}

/*처음 웹페이지 실행 시 강제로 클릭한다.*/
$("#select-AllBook").trigger("click");


 
 //0.5반올림
function scoreRound(score)
{
	return Math.ceil(score *2 ) / 2;
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>