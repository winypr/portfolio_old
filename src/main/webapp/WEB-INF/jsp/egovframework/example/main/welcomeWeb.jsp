<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
</script>
<div class="content">
	<div class="container-fluid">
		<div class="row">
	        <div class="col-md-12">
	           	<div class="card">
	               	<div class="header">
	                   	<h4 class="title">게시판</h4>
	                   	<p class="category">선택한 게시글 번호 조회 결과</p>
	               	</div>
	               	<div class="content table-responsive table-full-width">
	                   	<table class="table table-hover table-striped">
	                       	<thead>
		                       	<c:forEach items="${selectColumn}" var="selectColumn">
		                       		<c:if test="${selectCount eq '2'}">
		                       			<th><c:out value="${selectColumn}"/></th>
		                       		</c:if>
		                       		<th><c:out value="${selectColumn}"/></th>
		                       	</c:forEach>
	                       	</thead>
	                       	<tbody>
		                       	<c:forEach items="${selectSeqNo}" var="selectSeqNo">
	                       			<c:forEach items="${welcomeWebList}" var="welcomeWebList" varStatus="status">
	                       				<c:if test="${status.count eq selectSeqNo}">
				                           	<tr>
				                           		<c:forEach items="${selectColumn}" var="selectColumn">
				                           				<c:if test="${selectCount eq '2'}">
				                           					<td><c:out value="${welcomeWebList[selectColumn]}"/></td>
				                           				</c:if>
					                           			<td><c:out value="${welcomeWebList[selectColumn]}"/></td>
												</c:forEach>
											</tr>
										</c:if>
									</c:forEach>
								</c:forEach>
	                       	</tbody>
	                   	</table>
	               	</div>
	               	<div class="content">
	                   	<div class="row">
	                   		<div class="col-md-2 col-md-offset-5">
			                   	<button class="btn btn-wd btn-info" onclick="location.href='tableList.do'">다시 선택하기</button>
	                   		</div>
	                   	</div>
                   	</div>
	           	</div>
	       	</div>
	   	</div>
	</div>
</div>