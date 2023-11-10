<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<%@include file="../includes/header.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read(게시글 상세보기)</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

					<div class="form-group">
						<label>Bno</label>
						<input class="form-control" name="bno" value='<c:out value="${board.bno}" />' readonly="readonly">					
					</div>		
					
					<div class="form-group">
						<label>Title</label>
						<input class="form-control" name="title" value='<c:out value="${board.title}" />' readonly="readonly">					
					</div>		
					
					<div class="form-group">
						<label>Text area</label>
						<textarea rows="3" class="form-control" name="content" readonly="readonly"><c:out value="${board.content}" /></textarea>					
					</div>
					
					<div class="form-group">
						<label>Writer</label>
						<input class="form-control" name="writer" value='<c:out value="${board.writer}" />' readonly="readonly">					
					</div>					
					
					<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">글목록보기(List)</button>					
					
					
					<!-- Page317 : 기존 get.jsp 에서 버튼을 클릭하면 form 태그를 이용하는 방식이기에
					     데이터를 추가해서 이동하도록 수정 코딩해 줍니다. -->
					
					
			</div> <!-- end panel-body -->			
		</div> <!-- end panel-default -->	          					
	</div> <!-- end col-lg-12 -->
</div> <!-- end row -->
     


<script type="text/javascript">
	$(document).ready(function() {		
		
		var operForm = $("#operForm");
		
				
		$("button[data-oper='list']").on("click", function(e) {
			// 사용자가 수정 버튼을 누르는 경우에는 bno 값을 같이 전달하고,
			// <form> 태그를 submit 시켜서 처리합니다.
			// 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
			// <form> 태그 내의 bno 태그를 지우고 submit() 메서드를 통해서
			// 리스트 페이지로 이동합니다.
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list")
			operForm.submit();
		});
	});
</script>
    

<%@include file="../includes/footer.jsp" %>

