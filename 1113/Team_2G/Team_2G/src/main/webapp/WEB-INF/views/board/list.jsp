<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <%@include file="../includes/header.jsp"%>


<!-- /.col-lg-12
	<div class="col-lg-12">
		<h1 class="page-header">NoticeBoard(공지게시판)</h1>
	</div>
	 -->

<div class="row2">
		<div class="panel panel-option">
	<!-- 	<img src="/resources/images/bgbg.png" class="mainbg" width="100%" height="500px"/>  -->
			<div class="panel-heading" >
				공지사항 게시판
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr class="trbg">
							<th width="150" height="50">#번호</th>
							<th width="500" >제목</th>
							<th width="100">작성자</th>
							<th width="200">작성일</th>
							<th width="200">수정일</th>
						</tr>
					</thead>
	
					<c:forEach items="${list}" var="board">
						<tr>
							<td height="50px"><c:out value="${board.bno}"></c:out></td>
							
							
							<td><a class="move" href='<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td>
							<td><c:out value="${board.writer}"></c:out></td>
							<td><fmt:formatDate value="${board.regdate}"
									pattern="yyyy-MM-dd" />
							<td><fmt:formatDate value="${board.moddate}"
									pattern="yyyy-MM-dd" />
						</tr>

					</c:forEach>

				</table>
				<!-- /.table-responsive -->
				
				
				<div class="row">
					<div class="col-lg-14">
						<form action="/board/list" id="searchForm" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}" />>&lt;검색 조건 선택&gt;</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}" />>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}" />>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}" />>작성자</option>								
									
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}" />>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}" />>제목 or 작성자</option>
								<option value="TWC"
								<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}" />>제목 or 내용 or 작성자</option>
							</select>
							<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">							
							<button class="btn btn-default">검색(Search)</button>
							
							<!-- 		
							<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">글목록보기(List)</button>
							 -->
					</form>	
					</div>				
				</div>

				<!-- Page308 pagination 붙여넣기 적용 후에 Ctrl + Shift + F 클릭 적용해 줌 -->
				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${ pageMaker.startPage -1}">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button"><a href="${num}">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${ pageMaker.endPage +1}">Next</a></li>
						</c:if>				
					</ul>
				</div> <!-- end Pagination -->
				
				<!-- Page311 : 실제 페이지를 클릭하면 동작을 하는 부분은 별도의 form 태그를 이용해서 처리하도록 합니다! -->
				<form action="/board/list" id="actionForm" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}" />">
					<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
					
					
				</form>

			</div>
			<!-- /.panel-body -->
			</div>
		<!-- /.panel -->
		</div>

<!-- /.row -->

<script type="text/javascript">
	// 새로운 게시물의 번호는 BoardController의 addFlashAttribute() 메서드로
	// 저장되었기 때문에 한 번도 사용된 적이 없다면 사용자가 "/board/list"를 호출하거나,
	// '새로고침'을 통해서 호출하는 경우 아무런 내용이 없게 됩니다.
	// 또한, addFlashAttribute() 메서드를 이용해서 일회성으로만 데이터를 사용할 수 
	// 있으므로 이를 이용하여 경고창이나 모달창 등을 보여주는 방식으로 처리할 수 있습니다.
	$(document).ready(
			function() {
				var result = '<c:out value="${result}" />';

				
				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '') {
						return;
					}

					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다!");
					}
					$("#myModal").modal("show");
				}
				// 모달창 관련 자바스크립트 소스 코딩(종료)

								
				// Page312 a 태그가 원래의 동작을 못하도록 JavaScript 처리를 합니다.
				var actionForm = $("#actionForm");
				
				$(".paginate_button a").on("click", function(e) {
					
					e.preventDefault();
					
					console.log('click');
					
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
				
				// Page315 : list.jsp 게시물 조회를 위한 이벤트 처리 추가
				$(".move").on("click", function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
					actionForm.attr("action", "/board/get");
					actionForm.submit();
				});
				
				// Page342 자바스크립트 소스 코딩 시작
				var searchForm = $("#searchForm");
				
				$("#searchForm button").on("click", function(e) {
					if(!searchForm.find("option:selected").val()){
						alert("검색 종류를 선택해 주시기 바랍니다!");
						return false;
					}
					
					if(!searchForm.find("input[name='keyword']").val()){
						alert("키워드를 입력해 주시기 바랍니다!");
						return false;						
					}
					
					// 여러 종류들 중에서 검색 버튼을 클릭하면
					// 기본 검색 결과 페이지는 1페이지가 되도록 수정 처리합니다.
					searchForm.find("input[name='pageNum']").val("1");
					// 브라우저에서 검색 버튼을 클릭하면 form 태그의 전송은 막고,
					// 페이지의 번호는 1이 되도록 처리 합니다.
					// 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
					e.preventDefault();
					searchForm.submit();
				});				
				// Page342 자바스크립트 소스 코딩 끝
			});
</script>

<%@include file="../includes/footer.jsp"%>
