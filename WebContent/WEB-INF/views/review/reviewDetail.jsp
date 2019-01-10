<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.brw.dto.*" %>
<%
 	ReviewBoardDTO review = (ReviewBoardDTO)request.getAttribute("review");
	List<ReviewBoardComment> reviewComment = (List<ReviewBoardComment>)request.getAttribute("reviewComment");
	List<ReviewBoardComment> reviewReComment = (List<ReviewBoardComment>)request.getAttribute("reviewReComment");
	int count = (int)request.getAttribute("count");
	ReviewBoardComment lastReviewComment = (ReviewBoardComment)request.getAttribute("lastReviewComment");
	int nextNumber = (int)request.getAttribute("nextNumber");
	int prevNumber = (int)request.getAttribute("prevNumber");
	Integer maxLike = (Integer)request.getAttribute("maxLike");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reviewDetail.css" />
	<div id ="reviewDetail">
		<div id ="reviewDetail-Header">
			<span id="date"><%=review.getRbDate() %></span>
			<span id="comment">댓글 : <%=count %></span>
		</div>
		<div id ="reviewDetail-Title">
			<h2>
				<span>[리뷰]</span>
				<span><%=review.getRbTitle() %></span>
			</h2>
		</div>
		<div id="reviewDetail-Writer">
			<span id="booktitle">도서명 : <%=review.getRbBookTitle() %> </span>
	       <div id="start-Container">
	       <div class="starRev0">
			  <span class="starR1 on" id="star0"></span>
			  <span class="starR2 on" id="star1"></span>
			  <span class="starR1 on" id="star2"></span>
			  <span class="starR2 on" id="star3"></span>
			  <span class="starR1 on" id="star4"></span>
			  <span class="starR2" id="star5"></span>
			  <span class="starR1" id="star6"></span>
			  <span class="starR2" id="star7"></span>
			  <span class="starR1" id="star8"></span>
			  <span class="starR2" id="star9"></span>
			  &nbsp;&nbsp;
			   <span>(<%=review.getRbStarscore()%>점)</span>
			</div>
			 
		</div>
			
			<span>작성자 : <%=review.getRbWriter() %></span>
			<hr />
		</div>
		<div id ="reviewDetail-Content">
			<p>
			<span>
				<%=review.getRbContent() %>
			</span>
			</p>
			<div id="like-Wapper" >
				<div id ="like">
					<br />
					<span id = "likeCounter">
						<%if(maxLike==null){ %>
							0
						<%}else{ %>
							<%=maxLike %>
						<%} %>
					</span>
					<br />
					<img src="<%=request.getContextPath() %>/images/heart.png" alt="" style="width: 15px;height: 12px;margin-top: 10px;margin-right:2px"/>
				</div>
			</div>
		</div>
		<div id="side-menu">
			<ul id="left-menu">
				<li><a href="#" class="btn-gradient green" id="prevpage">이전글</a></li>
				<li><a href="<%=request.getContextPath() %>/review/reviewList.do" class="btn-gradient green">목록 </a></li>
				<li><a href="#" class="btn-gradient green" id="nextpage">다음글</a></li>
			</ul>
			<ul id="right-menu">
				<li><a href="#" class="btn-gradient red">신고하기</a></li>
			</ul>
		</div>
		<div id ="comment-Content">
		<div id="comment-menu">
			<h5>댓글<strong>(<%=count %>)</strong></h5>
<!-- 			<ul id="comment-submenu">
				<li>등록순&nbsp;</li><li>| 최신순</li>
			</ul> -->
		</div>
		<%if(reviewComment!=null) {%>
			<%for(ReviewBoardComment rbc : reviewComment){ %>
			<div id="comment-list" class ="comment-list<%=rbc.getRbCommentNo() %>">
			<%System.out.println(rbc.getRbCommentWriter()); %>
				<ul>
					<li>
						<div id="comment-html">
							<div id="comment-header">
								<span class="comment-writer<%=rbc.getRbCommentNo()%>"><%=rbc.getRbCommentWriter() %></span>
								<input type="hidden" class="comment-writerval" value=<%=rbc.getRbCommentNo()%>>
								<span style="font-size:0.7em;">(<%=rbc.getRbCommentDate() %>)</span>
							</div>
							<div id ="comment-body">
								<%if(rbc.getRbCommentDelflag().equals("N")){ %>
									<span id="review-con"><%=rbc.getRbCommentContent() %></span>
								<%}else{%>
									<span id="review-con" class="del"><%=rbc.getRbCommentContent() %></span>
								<%} %>
							</div>
							<%if(user!=null && (user.getUserId().equals(rbc.getRbCommentWriter()) || user.getUserId().equals("admin"))){ %>
								<%if(rbc.getRbCommentDelflag().equals("N")){ %>
									<button class="comment-delete" value="<%=rbc.getRbCommentNo()%>" id="comment-delete<%=rbc.getRbCommentNo()%>">
										[삭제]
									</button>
								<%} %>
							<button class="comment-recomment" value="<%=rbc.getRbCommentNo()%>"> 
								[답글]
							</button>
							<%} %>
						</div>
					</li>
				</ul>
				<script>
					$(".comment-writer<%=rbc.getRbCommentNo()%>").click(function(e){
						var x = $(this).position().top+20;
						var y = $(this).position().left+25;
						console.log(x,y);
						$("#hide-div").css("visibility","visible");
						$("#hide-div").css("top",x).css("left",y);
						$("#hide-div").append("<input type='hidden' id='Writer'value='<%=rbc.getRbCommentWriter()%>'>");
					})
				</script>
		<%if(reviewReComment!=null) {%>
			<%for(ReviewBoardComment rbrc : reviewReComment) {%>
				<%if(rbrc.getRbCommentRef()==rbc.getRbCommentNo()) {%>
					<div id="comment-enter">
						<img src="<%=request.getContextPath() %>/images/enter.png" alt="" />
					</div>
					<div id ="recomment-list">
						<ul>
							<li>
								<div id="recomment-html">
									<div id="recomment-header">
										<span><%=rbrc.getRbCommentWriter() %></span>
										<span style="font-size:0.7em;">(<%=rbrc.getRbCommentDate() %>)</span>
									</div>
									<div id="recomment-body">
											<span><%=rbrc.getRbCommentContent() %></span>
									</div>
								</div>
							</li>
						</ul>				
					</div>
				<%} %>
			<%} %>
		<%} %>
		</div>
		<%} %>
	<%} %>
	</div>
		<div id ="comment-Area">
			<table>
				<tr>
					<td>
						<div id="comment-textArea">
							<textarea name="comment" id="comment-area"rows="3" cols="90"></textarea>
						</div>
					</td>	
				<td>
					<input type="button" value="등록" id="comment-button"/>
				</td>
				</tr>
			</table>
		</div>
		<div id="hide-div">
			<ul>
				<li>
					<a href="#" id="nameSearch">이름으로 검색하기</a>
				</li>
				<li>
					<span>닫기</span>
				</li>
			</ul>
		</div>
	</div>

	<script>
		//이름으로 검색하기 클릭시 처리
		$("#nameSearch").click(function(){
			var rbCommentWriter = $("#Writer").val();
			location.href="<%=request.getContextPath()%>/review/reviewSearch.do?searchType=rb_writer&searchKeyword="+rbCommentWriter;
		});
		
		//도서명 클릭시 도서 상세정보로 가기
		$("#booktitle").click(function(){
			var search = confirm("해당 도서 상세보기로 이동하시겠습니까?");
			if(search){
				location.href="<%=request.getContextPath()%>/book/bookInfo.do?isbn13=<%=review.getRbIsbn()%>";
			}
		});
		
		
		var result = 0;
		var starscore = <%=review.getRbStarscore()%>
		$(function(){
			starscore = starscore * 2;
		   	for(var i=0; i<starscore; i++)
       		{
           		$("span#star"+i).addClass('on');
           		$(".starR1.on").css("display","block");
           		$(".starR2.on").css("display","block");
       		}
		});
		$("#comment-button").on('click',function(){
			if($("#comment-area").val().trim().length ==0){
				alert("댓글을 입력해 주세요.");
				return;
			}
			else{
				<%if(user!=null){%>
				var textAreaVal = $("#comment-area").val();
					$.ajax({
						url:"<%=request.getContextPath()%>/insertComment.do?rbNo=<%=review.getRbNo()%>&rbCommentContent="+textAreaVal+"&rbCommentWriter=<%=user.getUserId()%>",
						async:false,
						timeout: 1000,
						success:function(data){
							$("#comment-area").val("");
							var div =$("<div id='comment-list' class='comment-list"+data.rbCommentNo+"'></div>");
							var html ="";
							if(data!=null){
								html+= "<ul><li><div id='comment-html'><div id='comment-header'><span>"+data.rbCommentWriter+"</span> <span>"+data.rbCommentDate+"</span></div>";
								html+= "<div id='comment-body'><span id='review-con'>"+data.rbCommentContent+"</span></div>";
								html+= "<button class='comment-delete' value="+data.rbCommentNo+">[삭제]</button>";
								html+= "<button class='comment-recomment' value="+data.rbCommentNo+">[답글]</button></div></li></ul>";
								div.append(html);
							}
							$("#comment-Content").append(div);
							isAjaxing = false;
						}
					});
				<%}%>
			}
		});

		$(document).one('click','.comment-recomment',function(){
			<%if(user==null){%>
				alert("로그인 후 이용 가능 합니다.");
				return;
			<%}%>
			var div =$("<div class ='recomment-Area'></div>");
			var html ="";
			html +="<table><tr><td><div class='recomment-textArea'><textarea name='recomment' id='recomment-area' rows='3' cols='75'></textarea></div></td>";
			html +="<td><button value='"+$(this).val()+"'class='recomment-button'>등록</button></td></tr></table>";
			div.append(html);
/* 			$("#comment-Content").append(div); */
			div.insertAfter($(this).parent().parent()).children("div").slideDown(800);
			// 핸들러 한 번 실행 후 제거
			$(this).off("click");
		});
		
		$(document).on('click',".recomment-button",function(){
			<%if(user==null){%>
				alert("로그인 후 이용 가능 합니다.");
				return;
			<%}%>
			console.log("앙기모띵")
			if($("#recomment-area").val().trim().length==0){
				alert("댓글을 입력해 주세요.");
				return;
			}
			else
			{
				console.log("들어왓나?");
				var reCommendArea = $("#recomment-area").val();
				<%if(user!=null){%>
				$.ajax({
					url:"<%=request.getContextPath()%>/insertReComment.do?rbCommentNo="+$(this).val()+"&rbCommentContent="+reCommendArea+"&rbCommentWriter=<%=user.getUserId()%>&rbNo=<%=review.getRbNo()%>",
					async:false,
					timeout: 1000,
					success:function(data){
						console.log("에이잭스실행완료");
						var divs =$("<div id='recomment-list' class='recomment-list"+data.rbCommentNo+"'></div>");
						var htmls ="";
						var imgs = $("<div id='comment-enter'><img src='<%=request.getContextPath()%>/images/enter.png'/></div>");
						if(data!=null){
							htmls+= "<ul><li><div id='recomment-html'><div id='recomment-header'><span>"+data.rbCommentWriter+"</span> <span>"+data.rbCommentDate+"</span></div>";
							htmls+= "<div id='recomment-body'><span>"+data.rbCommentContent+"</span></div></div></li></ul>";
						}
						divs.append(htmls);
						$("#recomment-area").parents("#comment-list").append(imgs);
						$("#recomment-area").parents("#comment-list").append(divs);
						$(".recomment-Area").remove();
						console.log(data);
						isAjaxing = false;
					}
				});
				<%}%>
			}
		});
		$("#nextpage").click(function(){
			if(<%=nextNumber%>==0){
				alert("다음글이 존재하지 않습니다.");
				return;
			}
			location.href="<%=request.getContextPath()%>/review/reviewDetail.do?rbNo=<%=nextNumber%>";
		});
		$("#prevpage").click(function(){
			if(<%=prevNumber%>==0){
				alert("이전글이 존재하지 않습니다.");
				return;
			}
			location.href="<%=request.getContextPath()%>/review/reviewDetail.do?rbNo=<%=prevNumber%>";
		});
		
		$("#like").click(function(){
			<%if(user==null){%>
				alert("로그인후 이용할 수 있습니다.");
				return;
			<%}%>
			
			<%if(user!=null){%>
			$.ajax({
				url:"<%=request.getContextPath()%>/review/reviewLike.do?rbNo=<%=review.getRbNo()%>&userId=<%=user.getUserId()%>",
				success:function(data){
					$("#likeCounter").html(data);
				}
			});
			<%}%>
		});
		
		$("#comment").click(function(){
			var offset = $("#comment-list").offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
		});
		
		$("#comment-textArea").click(function(){
			<%if(user==null){%>
				alert("로그인 후 이용 가능 합니다.");
				$("#comment-area").blur();
				return;
			<%}%>
		});
		$(document).on('click','.comment-delete',function(){
			var replay = confirm("정말 삭제 하실 거에요??");
			var brNo = $(this).val();
			if(replay){
				$.ajax({
					url:"<%=request.getContextPath()%>/review/reviewCommentDelete.do?rbCommentNo="+$(this).val()+"&rbNo=<%=review.getRbNo()%>",
					success:function(data){
						console.log(data);
						if(data==2){
							$(".comment-list"+brNo).remove();	
						}
						if(data==1){
							$(".comment-list"+brNo+" #review-con").html("<span id='review-con' class='del'>[삭제된 댓글 입니다.]</span>");
							$(".comment-list"+brNo+" .comment-delete").remove();
							/* $("#review-con").html("[삭제된 댓글입니다.]"); */
							$("#review-con").addClass("del");
						}
					}		
				})
			}
		});
	</script>

<%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>
