<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminMemberManager.css" />
<div class="videoWrapper">
<iframe src="<%=request.getContextPath() %>/sign/memberManager.do" frameborder="0" width="900px" height="417px" marginWidth=0>
</iframe>
<iframe src="<%=request.getContextPath() %>/review/reviewBoardManager.do" frameborder="0" width="1000px" height="500px" marginWidth=0></iframe>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>