<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script>
	$(function() {
		// /* Date picker 초기화 */
		
			$('#datetimepicker1').datetimepicker({
			  pickTime: false
			});
			
			$('#datetimepicker2').datetimepicker({
				  pickTime: false
			});
	
	})
	
	/**
	 * form 의 input text, input radio, textarea, selectbox 의 값을 obj로 만들어준다.
	 * formToObj 사용 시 form 태그로 감싼 다음 이용하세요
	 * @parameter  obj로 만든 타겟 Id ( form, div, span.. 기능)
	 */
	 function formToObj(frmId) {
		var dataObj = {};
		
		$("#" + frmId).find("input:text, input:hidden, select, textarea, input:radio").each(function(i, v) {
			var $v 		= $(v),
				name 	= $v.attr("name");
			
			if (typeof name !== "undefined") {
				dataObj[name] = $v.val();
			}
		});
		console.log(dataObj)
		return dataObj;
	}
	
	
	var eventC = {

			searchA : function() {
				
			 $.ajax({

				url : "<c:url value='/searchTableList.do'/>",
				type : "post",
				dataType : "JSON",
				data : formToObj("mainSrchForm"), 

				success : function(d) {
					$("#ajax-teble tbody").children().remove();  // 기존 검색 데이터 삭제
					d.forEach(createTable);						 // 검색 데이터 입력 
					alert("검색을 완료하였습니다.")
				},
				
				 error:function(request,status,error){
				    alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				},

			}); 
		} 
	}
	
	function createTable(e, index) {
		
		var tagTr = document.createElement('tr');
		
		for (var key in e) {	
	
				var tagTd = document.createElement('td');
				tagTd.textContent = e[key]
				tagTr.appendChild(tagTd)		
		}
		$("#ajax-teble tbody").append(tagTr);
	}
</script>

<div class="matter">
	<div class="container-fluid">
		<form id="mainSrchForm">
			<!-- <input type="hidden" id="mainMngNo" name="mainMngNo" /> 
			<input type="hidden" id="srchPage" name="srchPage" /> -->

			<div class="row">
				<div class="col-md-12">
					<div class="widget wlightblue">
					
						<div class="widget-head">
							<div class="pull-left">검색</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>

						</div>

						<div class="widget-content">
							<!-- 	<div class="table-responsive"> -->
							<table class="table table-bordered ">
								<thead></thead>
								<tbody>
									<tr>
										<th scope="row">키워드검색</th>
										<td scope="row" colspan="3">
											<div class="pull-left">
												<select id="srchTp" name="srchTp"
													class="selectric form-control" title="제목 선택박스">
													<option value="A">
														전체</option>
													<option value="N">
														이름</option>
													<option value="T">
														타입</option>
													<option value="P">
														장소</option>
												</select>
											</div> <input type="text" id="title" name="title" class="form-control"
											style="width: calc(100% - 244px)" maxlength="50"
											/>

										</td>
									</tr>
									<tr>
										<th scope="row">일자검색</th>
										<td scope="row">
											<div id="datetimepicker1" class="input-append">
												<input data-format="yyyy-MM-dd" class="picker" type="text" id="dpStrtDt" name="dpStrtDt">
												<span class="add-on"> &nbsp;<i
													data-date-icon="fa fa-calendar" class="fa fa-calendar"></i>
												</span>
											</div>
										</td>
										<td scope="row">
											<div id="datetimepicker2" class="input-append">
												<input data-format="yyyy-MM-dd" class="picker" type="text" id="dpEndDt" name="dpEndDt">
												<span class="add-on"> &nbsp;<i
													data-date-icon="fa fa-calendar" class="fa fa-calendar"></i>
												</span>
											</div>

										</td>

									</tr>

								</tbody>
							</table>

						</div>
	</form>
		<div class="widget-foot">
			<label class="btn pull-right btn-danger" onclick="eventC.searchA()"
				>검색</label>
			<div class="clearfix"></div>
		</div>
	</div>
	</div>
</div>
	

<div class="row">
	<div class="col-md-12">

		<div class="widget worange">
			<div class="widget-head">
				<div id="testId" class="pull-left">Table</div>
				<div class="widget-icons pull-right">
					<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
					<a href="#" class="wclose"><i class="fa fa-times"></i></a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="widget-content">
				<div class="table-responsive">
					<table id="ajax-teble" class="table table-bordered">
						<thead>
							<tr>
								<th>NO</th>
								<th>타입</th>
								<th>이름</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>장소</th>
							</tr>
						</thead>
						<tbody>
							
							<%-- --%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
		<div id="ui-datepicker-div"
			class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>
		<div class="bootstrap-datetimepicker-widget dropdown-menu">
			<div class="datepicker">
				<div class="datepicker-days" style="display: block;">
					<table class="table-condensed">
						<thead>
							<tr>
								<th class="prev">‹</th>
								<th colspan="5" class="switch">May 2020</th>
								<th class="next">›</th>
							</tr>
							<tr>
								<th class="dow">Su</th>
								<th class="dow">Mo</th>
								<th class="dow">Tu</th>
								<th class="dow">We</th>
								<th class="dow">Th</th>
								<th class="dow">Fr</th>
								<th class="dow">Sa</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="day old">26</td>
								<td class="day old">27</td>
								<td class="day old">28</td>
								<td class="day old">29</td>
								<td class="day old">30</td>
								<td class="day">1</td>
								<td class="day">2</td>
							</tr>
							<tr>
								<td class="day">3</td>
								<td class="day">4</td>
								<td class="day">5</td>
								<td class="day">6</td>
								<td class="day">7</td>
								<td class="day">8</td>
								<td class="day">9</td>
							</tr>
							<tr>
								<td class="day">10</td>
								<td class="day">11</td>
								<td class="day">12</td>
								<td class="day">13</td>
								<td class="day">14</td>
								<td class="day">15</td>
								<td class="day">16</td>
							</tr>
							<tr>
								<td class="day">17</td>
								<td class="day">18</td>
								<td class="day">19</td>
								<td class="day">20</td>
								<td class="day">21</td>
								<td class="day">22</td>
								<td class="day">23</td>
							</tr>
							<tr>
								<td class="day">24</td>
								<td class="day">25</td>
								<td class="day">26</td>
								<td class="day">27</td>
								<td class="day">28</td>
								<td class="day">29</td>
								<td class="day active">30</td>
							</tr>
							<tr>
								<td class="day">31</td>
								<td class="day new">1</td>
								<td class="day new">2</td>
								<td class="day new">3</td>
								<td class="day new">4</td>
								<td class="day new">5</td>
								<td class="day new">6</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="datepicker-months" style="display: none;">
					<table class="table-condensed">
						<thead>
							<tr>
								<th class="prev">‹</th>
								<th colspan="5" class="switch">2020</th>
								<th class="next">›</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="7"><span class="month">Jan</span><span
									class="month">Feb</span><span class="month">Mar</span><span
									class="month">Apr</span><span class="month active">May</span><span
									class="month">Jun</span><span class="month">Jul</span><span
									class="month">Aug</span><span class="month">Sep</span><span
									class="month">Oct</span><span class="month">Nov</span><span
									class="month">Dec</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="datepicker-years" style="display: none;">
					<table class="table-condensed">
						<thead>
							<tr>
								<th class="prev">‹</th>
								<th colspan="5" class="switch">2020-2029</th>
								<th class="next">›</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="7"><span class="year old">2019</span><span
									class="year active">2020</span><span class="year">2021</span><span
									class="year">2022</span><span class="year">2023</span><span
									class="year">2024</span><span class="year">2025</span><span
									class="year">2026</span><span class="year">2027</span><span
									class="year">2028</span><span class="year">2029</span><span
									class="year old">2030</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>