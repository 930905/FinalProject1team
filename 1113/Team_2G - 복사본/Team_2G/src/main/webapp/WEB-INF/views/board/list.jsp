<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="Law Firm Service Responsive HTML Website Template. Simple and clean layout built with bootstrap mobile framework. Its Free Download it.">
<meta name="keywords" content="law,legal services, business law, criminal, bankruptcy services,
  lawyer, immigration law, family law, civil litigations, real estate law, injury, taxation law, free website templates,responsive HTML website template">
<title>MODUA</title>
<!-- Bootstrap -->
<link href="/resources/css_main/bootstrap.min.css" rel="stylesheet">
<!-- Style CSS -->
<link href="/resources/css_main/style.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=PT+Serif:400,400i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<!-- FontAwesome CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/fontello.css">
<link href="/resources/css_main/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css_main/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/css_main/owl.theme.default.css" rel="stylesheet">

<!-- freeboard link -->
<link rel="stylesheet" href="/resources/css_free/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css_free/style.css">
<link rel="stylesheet" href="/resources/css_free/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css_free/owl.carousel.min.css">

</head>

<body>

<!-- freeboard start -->
        <!-- page-header-start -->
        <div class="page-header">
            <div class="container">
              <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div class="page-section"> <span class="page-text">Frequently Ask Question</span>
                    <h1 class="page-title">The Most Commonly Asked Questions</h1>
                  </div>
                </div>
              </div>
            </div>
          </div>
  <!-- page-header-close --> 

    <!-- job_listing_area_start  -->
    <div class="job_listing_area">
        <div class="container">
            <div class="row">
                <div align="left" class="col-lg-3 recent_joblist left">
                    <div class="job_filter white-bg">
                        <div class="form_inner white-bg">
                            <h1>자유게시판</h1>
                        </div>
                    </div>
            	</div>
            </div>
            <c:forEach items="${list}" var="board">
            <div class="col-lg-9">
                    <div class="job_lists m-0">
                        <div class="col-lg-12 col-md-12">
                            <div class="single_jobs white-bg d-flex justify-content-between">
                                <div class="jobs_left d-flex align-items-center">
                                    <div class="jobs_conetent">
                                       <a href="job_details.html">
                                      		<td><h2><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></h2></td>
                                       </a>
                                       <div class="links_locat d-flex align-items-center">
                                           <div class="location">
                                               <p> <i class="fa fa-map-marker"></i>
                                              		<td><c:out value="${board.bno}"></c:out></td>
                                               </p>
                                           </div>
                                           <div class="location">
                                               <p> <i class="fa fa-clock-o"></i>
                                              		<td><c:out value="${board.writer}"></c:out></td>
                                               </p>
                                           </div>
                                       </div>
                                    </div>
                                </div>
                                <div class="jobs_right">
                                    <div class="date">
                                        <p>
	                                   		<td><fmt:formatDate value="${board.regdate}"
												pattern="yyyy-MM-dd" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
        

            <div class="search">
                <div class="search_area">
                    <div class="search_place">
                        <form action="/board/list" id="searchForm" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selectrd':''}"/>
								>&lt;검색 조건 선택&gt;</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selectrd':''}"/>
								>제목
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selectrd':''}"/>
								>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selectrd':''}"/>
								>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selectrd':''}"/>
								>제목 or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selectrd':''}"/>
								>제목 or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selectrd':''}"/>
								>제목 or 내용 or 작성자</option>
							</select>
							<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							<button class="btn btn-default">검색</button>
						</form>
						<button data-oper='list' class="btn btn-info" onclick="location.href='list'">글목록보기(List)</button>
						
                    </div>
                </div>
            </div>
	  </div>
			
			<!-- paging start -->
           <div class="pagination_wrap" style="padding-bottom: 7em;">
               <ul>
                    <c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a href="${ pageMaker.startPage -1}">Prev</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button"><a href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a href="${ pageMaker.endPage +1}">Next</a></li>
					</c:if>	
               </ul>
            </div>
             
            <!-- Page311 : 실제 페이지를 클릭하면 동작을 하는 부분은 별도의 form 태그를 이용해서 처리하도록 합니다! -->
			<form action="/board/list" id="actionForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}"/>"/>
				<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>"/>
			</form>
            <!-- paging close -->
         </div>
         
				<!-- Modal 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">처리 알림!</h4>
							</div>
							<div class="modal-body">처리가 완료 되었습니다!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" id="close">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->




    </div>
    <!-- job_listing_area_end -->
    <!-- freeboard close -->


<script type="text/javascript">
	$(document).ready(
			function() {
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
				
				// list.jsp에서  등록하기 버튼 클릭하면
				// 게시물의 등록 웹페이지로 이동 처리 합니다.
				$("#regBtn").on("click", function() {
					self.location = "/board/register";
				});
				
				var result = '<c:out value="${result}" />';

				// 모달창 관련 자바스크립트 소스 코딩(시작)	
				// checkModal() 함수는 파라미터에 따라서 모달창을 보여주거나 내용을 수정한 뒤
				// 보이도록 처리합니다. checkModal()에서는 새로운 게시글이 작성되는 경우
				// RedirectAttributes로 게시물의 번호가 전송되므로 이를 이용해서 모달창의 내용을
				// 수정 처리합니다. $("#modal").modal('show')를 호출하면 모달창이 보이게 됩니다.
				// 실행 확인은 웹 프로젝트 실행 후 '/board/register'를 이용해서 새로운 게시물을 작성하고
				// 나면 자동으로 '/board/list'로 이동하면서 모달창이 보이게 됩니다.		
				/*
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
				*/
				// 모달창 관련 자바스크립트 소스 코딩(종료)
				
		});
</script>

</body>

</html>