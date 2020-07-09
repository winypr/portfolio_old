<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="matter">
	<div class="container">


		<div class="row">

			<!-- Recent comments widget -->
			<div class="col-md-12">
				<!-- Widget -->
				<div class="widget worange">
					<!-- Widget title -->
					<div class="widget-head">
						<div class="pull-left">게시판</div>
						<div class="widget-icons pull-right">
							<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
							<a href="#" class="wclose"><i class="fa fa-times"></i></a>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="widget-content forum-view">
						<!-- Widget content -->
						<div class="padd">
							<div class="recent-content">
								<div class="subj"> <h5>제목</h5> </div>
								<hr>
								<div class="recent-meta date">
									<h6>Posted on 25/1/2120 by Ashok</h6>
								</div>
								<hr>
								<div class="content">내용</div>
								<div class="clearfix"></div>
							</div>


						</div>
					</div>

					<!-- Widget footer -->
					<div class="widget-foot">

						<button type="button" class="btn btn-success pull-right" id="btnEdit" onClick="location.href='forumWrite.do'">
						<label>수정</label></button>
						<div class="clearfix"></div>

					</div>

				</div>

			</div>
		</div>

	</div>
</div>

<!-- Matter ends -->

</div>
<!--/ Mainbar ends -->
<div class="clearfix"></div>
</div>
<!--/ Content ends -->

<!-- Notification box starts -->
</body>
</html>
