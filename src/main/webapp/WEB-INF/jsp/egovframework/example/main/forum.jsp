<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<script>
	$(function() {

		$("#btnForumWrite").click(function() {
			
			location.href= "<c:url value='/forumWrite.do'/>"

		});
	
		$("#forumTable tr").click(function() {
			
			var fmNo = ($(this).children().eq(0).text())
			console.log(fmNo)
			$.ajax({

				url : "<c:url value='/searchforumVeiw.do'/>",
				type : "post",
				dataType : "json",
				data : {"fmNo" : $(this).children().eq(0).text()},
			
				success : function(d) {
					
					console.log(d);
					$('.matter').children().remove();
					 $('.matter').load("<c:url value='/forumView.do'/> .matter > .container" , function(){
						 
						$(".forum-view .subj > h5").text(d[0].fmSubj);
						$(".forum-view .date > h6").text("Posted on " + d[0].fmDate + " by " + d[0].fmWriter);
						$(".forum-view .content").text(d[0].fmContent);
						
					 }); 
					
					
					
					//location.href = "<c:url value='/forumView.do'/> " */
				} 
			})
			
		});
	})
			
		/* 
			$('.matter').children().remove();
	           // Contents 영역 교체
	        $('.matter').load("<c:url value='/forumWrite.do'/> .matter > .container" );
				 */
				 
				/*  $.ajax({

						url : "<c:url value='/forumWrite.do'/>",
						type : "post",
						dataType : "html",
					
						success : function(d) {
							//location.href ="<c:url value='/forumWrite.do'/>"
							$('.matter').children().remove();
					           // Contents 영역 교체
					        $('.matter').html(d);
						
						} */


	
</script>
				<div class="matter">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="widget worange">
									<div class="widget-head">
									  <div class="pull-left">게시판</div>
									  <div class="widget-icons pull-right">
										<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a> 
										<a href="#" class="wclose"><i class="fa fa-times"></i></a>
									  </div>
									  <div class="clearfix"></div>
									</div>
									<div class="widget-content">
										<div class="table-responsive">
											<table class="table table-bordered" id="forumTable">
												<thead>
													<tr>
													  <th>#</th>
													  <th>제목</th>
													  <th>작성자</th>
													  <th>작성일</th>
													</tr>
												</thead>
												<tbody>
											<c:forEach items="${forumList}" var="forumListVar" varStatus="status">
											<tr>
												<td><c:out value="${forumListVar.fmNo}" /></td>
												<td><c:out value="${forumListVar.fmSubj}" /></td>
												<td><c:out value="${forumListVar.fmWriter}" /></td>
												<td><c:out value="${forumListVar.fmDate}" /></td>
											</tr>
										</c:forEach>                                                     
												</tbody>
											</table>
										</div>
									</div>
									<div class="widget-foot">
										<ul class="pagination pull-left">
										  <li><a href="#">Prev</a></li>
										  <li><a href="#">1</a></li>
										  <li><a href="#">2</a></li>
										  <li><a href="#">3</a></li>
										  <li><a href="#">4</a></li>
										  <li><a href="#">Next</a></li>
										</ul>
										<div class="pull-right" id="btnForumWrite">
										<button type="button" class="btn btn-success" style="padding-top: 5px;">글쓰기</button>
										</div>
										<div class="clearfix"></div> 
									</div>
									
								</div>

								</div>
						</div>
						</div>
				</div><!--/ Matter ends -->
