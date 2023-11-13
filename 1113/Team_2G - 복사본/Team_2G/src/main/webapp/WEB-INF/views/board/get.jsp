<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!-- header link include -->
<%@include file="../includes/header_link_include.jsp" %>

	<link rel="stylesheet" href="/resources/css_free/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css_free/stylerg.css">
    <link rel="stylesheet" href="/resources/css_free/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css_free/owl.carousel.min.css">
</head>
<body>
<!-- header include -->
<%@include file="../includes/header_include.jsp"  %>

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




 
    <div class="job_details_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="apply_job_form white-bg">
                        <h4>게시물 상세보기</h4>
                        <form action="#">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input_field">
                                        <input type="text" name="bno" placeholder="bno" value='<c:out value="${board.bno}" />' readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input_field">
                                        <input type="text" name="writer" placeholder="writer" value='<c:out value="${board.writer}" />' readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input_field">
                                        <input type="text" name="title" placeholder="title" value='<c:out value="${board.title}" />' readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input_field">
                                        <textarea name="content" cols="30" rows="10" placeholder="Textarea" readonly="readonly">
                                        	<c:out value="${board.content}" />
                                        </textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="submit_btn">
                                    	<button data-oper='modify' class="btn boxed-btn3 w-100" onclick="location.href='/freeboard/modify?bno=<c:out value="${board.bno}" /> '">글내용 수정(Modify)</button>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="submit_btn">
                                        <button id="listBtn" class="boxed-btn3 w-100" type="button">목록보기</button>
                                    </div>
                                </div>
                            </div>
                        </form>
		                <form id="operForm" action="/freeboard/modify" method="get">
		                  <input type="hidden" id="bno" name="bno" value="<c:out value="${board.bno}"/>">
		                  <input type="hidden" id="pageNum" name="pageNum" value="<c:out value="${cri.pageNum}"/>">
		                  <input type="hidden" id="amount" name="amount" value="<c:out value="${cri.amount}"/>">
		                  <input type="hidden" name="type" value="<c:out value="${cri.type}"/>"/>
		                  <input type="hidden" name="keyword" value="<c:out value="${cri.keyword}"/>"/>
		                </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
    <!-- Page414 댓글 목록 처리 get jsp 소스 코딩 시작  -->
<!-- 댓글 목록 처리 : 댓글의 목록 처리를 위해서는 별도의 div 태그를 생성해서 처리해야 합니다.
          게시글과 관련된 화면 아래쪽에 div 태그를 추가합니다. 추가하는 div태그에는 나중에 화면의
          모습을 파악할 수 있도록 간단한 텍스트 등을 구성해 봅니다. -->
    <div class="row">
       <div class="col-lg-12">
          <div class="panel panel-default">
             <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i>Reply(댓글)
                <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">NewReply(댓글 등록)</button>
             </div>
             <div class="panel-body">
                   <!-- 댓글의 목록은 ul 태그 내에 li 태그를 이용해서 처리합니다.
                            각 li 태그는 하나의 댓글을 의미하므로 수정이나 삭제 시 이를 클릭하게 됩니다.
                            수정이나 삭제 시에는 반드시 댓글 번호(rno)가 필요하므로 'data-rno' 속성을
                            이용해서 이를 처리합니다. -->  
                   <ul class="chat">
                      <!-- start reply -->
                      <li class="left clearfix" data-rno='18'>
                      <div>
                         <div class="header">
                            <strong class="primary-font">장나라</strong>
                            <small class="pull-right text-muted">2023-10-03 16:24:23</small>
                         </div>
                         <p>댓글 등록 화면 테스트!</p>
                      </div>
                   </li> <!-- end reply -->
                </ul> <!-- end ul .chat-->
             </div> <!-- end panel body -->
             		<!-- Page439 get.jsp 소스 추가 내용 -->
		<!-- panel-footer는 댓글이 화면상에서 출력되는 
		         영역의 아래쪽에 추가해 줍니다. .panel-footer에
		         댓글 페이지 번호를 출력해 줍니다. -->
		<div class="panel-footer">
			
		</div>
          </div> <!-- end panel panel-default -->
       </div> <!-- end col-lg-12 -->
    </div> <!-- end row -->
    
    <!-- Modal 추가 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
       aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog">
          <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                   aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">REPLY MODAL(댓글)</h4>
             </div>
             <div class="modal-body">
                <div class="form-group">
                   <label>REPLY(댓글)</label>
                   <input class="form-control" name="reply" value="New Reply!">
                </div>
                <div class="form-group">
                   <label>Replyer(댓글 등록자)</label>
                   <input class="form-control" name="replyer" value="replyer">
                </div>
                <div class="form-group">
                   <label>Reply Date(댓글 등록일)</label>
                   <input class="form-control" name="replyDate" value="">
                </div>
             </div>
             <div class="modal-footer">
                <button id="modalModBtn" type="button" class="btn btn-warning">Modify(댓글 수정)</button>
                <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove(댓글 삭제)</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register(댓글 등록)</button>
                <button id="modalCloseBtn" type="button" class="btn btn-default"
                   data-dismiss="modal">Close</button>
             </div>
          </div>
          <!-- /.modal-content -->
       </div>
       <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

<!--  Page400 아래 1줄 소스 코딩 추가 -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
    

<!-- footer&script include -->
<%@include file="../includes/footer_and_script_include.jsp"  %>
<script type="text/javascript">
	
	// 목록보기
	$("#listBtn").on("click", function() {
		self.location = "/freeboard/list";
	});
	
</script>

<script type="text/javascript">
   $(document).ready(function() {
      
      var operForm = $("#operForm");
      
      $("button[data-oper='modify']").on("click", function(e) {
         operForm.attr("action", "/freeboard/modify").submit();
      });
      
      $("button[data-oper='list']").on("click",function(e) {
            // 사용자가 수정 버튼을 누르는 경우에는 bno 값을 같이 전달하고,
            // <form> 태그를 submit 시켜서 처리합니다.
            // 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
            // <form> 태그 내의 bno 태그를 지우고 submit() 메서드를 통해서
            // 리스트 페이지로 이동합니다.
            operForm.find("#bno").remove();
            operForm.attr("action", "/freeboard/list")
            operForm.submit();
      });
   });
   
   // +++++++++++++++++++++++++++++++++++++++++++++ 댓글 관련 스크립트 시작
      // 특정 게시물의 댓글 관련 이벤트 처리 : 게시글의 조회 페이지가 열리면 자동으로 댓글 목록을 가져와서
      // li 태그를 구성해야 합니다. 이에 대한 처리는 $(documnet).ready() 내에서 이루어지게 합니다.
      // Page415 이벤트 처리를 위한 자바스크립트 소스 코딩 시작
      $(document).ready(function () {
      var bnoValue = '<c:out value = "${board.bno}"/>';
      var replyUL = $(".chat");
         
      // showList() 메서드는 페이지 번호를 파라미터로 받도록 하며,
      // 만일 파라미터가 없는 경우에는 자동으로 1페이지가 되도록 설정합니다.
      // 웹브라우저에서 DOM 처리가 끝나면 자동으로 showList() 메서드가 호출되면서
      // ul 태그 내에 내용으로 처리됩니다. 만약 1페이지가 아닌 경우라면
      // 기존 ul태그에 li태그들이 추가되는 형태입니다.
      showList(1);
      
      function showList(page) {
    	  
    	  console.log("show list" + page);
    	  
         replyService.getList({bno:bnoValue, page:page||1}, function(replyCnt, list) {
        	 
        	 console.log("replyCnt : " + replyCnt);
        	 console.log("list : " + list);
        	 
             // Page438 위에서 showList() 함수가 파라미터로 전달되는 page 변수를
             // 이용해서 원하는 댓글 페이지를 가져오게 되면, 이때, 만약(if)
             // page 번호가 '-1'로 전달되면 마지막 페이지를 찾아서 다시 호출하게 됩니다.
        	 if (page == -1) {
				pageNum = Math.ceil(replyCnt/10.0);
				shouList(pageNum);
				return;
			}
        	 
            var str = "";
            if (list == null || list.length == 0) {
               replyUL.html("");
               return;
            }
            for (var i = 0, len = list.length || 0; i < len; i++) {               
               str +="<li class='left clearfix' data-rno='" + list[i].rno+"'>";
               str +=" <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"<Strong>";
               str +=" <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
               str +=" </div>";
               str +=" <p>"+list[i].reply+"</p></div></li>";
            }
            
            replyUL.html(str);
            
            //Page441 아래 1줄 소스 추가 코딩
            showReplyPage(replyCnt);
            
         });  // end function
      } // end showList
      
      // Page440 get.jsp 소스 코딩 : 앞서 div class='panel-footer'에 댓글
      // 페이지 번호를 출력하는 로직인 showReplyPage() 메서드를 정의해 줍니다.   
      var pageNum = 1;
      var replyPageFooter = $(".panel-footer");
      
      function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum/10.0) * 10;
		console.log(endNum);
		var startNum = endNum-9;
		console.log(startNum);
		var prev = startNum != 1;
		console.log(prev);
		var next = false;
		console.log(next);
		
		if (endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);
		}
		if (endNum * 10 < replyCnt) {
			next = true;
		}
		
		var str = "<div><ul class='pagination pull-right'>";
		if (prev) {
			str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>";
		}
		for (var i = startNum; i < endNum; i++) {
			var active = pageNum == i ? "active" : "";
			str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if (next) {
			
			str += " <li class='page-item "+active+"'><a class='page-link' href='"+(endNum+1)+"'>next</a></li>";
		}
		
		str +=  "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
      
	// Page 441 : 마지막 처리는 replyPageFooter를 활용해서 
	//            페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 합니다.      
	replyPageFooter.on("click", "li a", function(e) {
		// 댓글의 페이지 번호는 a 태그 내에 존재하므로 이벤트 처리에서는
        // a 태그의 기본 동작을 제한하고(preventDefault()) 댓글 페이지 번호를
        // 변경한 후에 해당 페이지의 댓글을 가져오도록 합니다.   
        e.preventDefault();
		console.log("page click");
		var targetpageNum = $(this).attr("href");
		console.log("targetpageNum = " + targetpageNum);
		pageNum = targetpageNum;
		showList(pageNum);
	});
      
      // Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 시작
      // 새로운 댓글의 추가 시, 버튼 이벤트 처리 : 댓글 목록 상단의 'New Reply'를 클릭하면
      // 화면에서는 모달창을 보여줘서 처리합니다. 모달과 관련된 객체들은 여러 함수에서 사용할 것이므로
      // 바깥쪽으로 빼두어 매번 jQuery를 호출하지 않도록 합니다.
      var modal = $(".modal");
      var modalInputReply = modal.find("input[name='reply']");
      var modalInputReplyer = modal.find("input[name='replyer']");
      var modalInputReplyDate = modal.find("input[name='replyDate']");
      
      var modalModBtn = $("#modalModBtn");
      var modalRemoveBtn = $("#modalRemoveBtn");
      var modalRegisterBtn = $("#modalRegisterBtn");
      
        // 사용자가 'New Reply' 버튼을 클릭하면 입력에 필요없는 항목들은 안 보이게 처리하고,
        // 모달창을 보이게 합니다.
        $("#addReplyBtn").on("click", function(e) {
         modal.find("input").val("");
         
         // 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
         modalInputReplyDate.closest("div").hide();
         // 아래 hide() 메서드가 포함된 구문을 주석 철기 후 실행 확인해 보시기 바랍니다.
         modal.find("button[id != 'modalCloseBtn']").hide();
         
         modalRegisterBtn.show();
         $(".modal").modal("show");
      });
        
     // Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 시작
     // 새로운 댓글의 추가는 필요한 댓글의 내용(Reply)과 댓글의 작성(Replyer) 항목만으로
     // 추가해서 모달창 아래쪽의 'Register' 버튼을 클릭해서 처리하게 합니다.
     modalRegisterBtn.on("click", function(e) {
		var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue // 댓글은 게시글에 달리는 것이기 때문에 게시글의 번호를 넣어준다.
		};
		// 댓글이 정상적으로 추가되면 경고창(alert)을 이용해서 성공했다는 사실을 알려주고,
        // 등록한 내용으로 다시 등록할 수 없도록 입력항목을 비우고 모달창을 닫아줍니다.
        replyService.add(reply, function(result) {
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			
			// 1이라고 되어 있는 건 나중에 페이징 처리할 때 페이지 넘버로 바꿀 것.
			// 댓글 리스트 갱신 처리하고 1페이지로 리턴처리하는 역할을 합니다.
			// showList(1); 
			// Page438, Page439 : 위에서 사용자가 새로운 댓글을
            // 추가하면 showList(-1);을 호출하여 우선 전체 댓글의
            // 숫자를 파악하게 합니다. 이후에 다시 마지막 페이지를 호출해서
            // 이동시키는 방식으로 동작하게 됩니다. 이러한 방식은 여러 번
            // 서버를 호출해야 하는 단점이 있기는 하지만, 댓글의 등록 행위가
            // 댓글 조회나 페이징에 비해서 적기 때문에 심각한 문제는 아닙니다.
			showList(-1);
		});
	});
        
     // Page 425 : 댓글 조회 클릭 이벤트 처리
     // 특정한 댓글 조회 클릭 이벤트 처리
     // Ajax로 댓글을 조회한 후 수정/삭제를 처리하게 합니다.
     // 댓글을 가져온 후에는 필요한 항목들을 채우고 수정과 삭제가 필요한 댓글 번호(rno)는
     // 'data-rno' 속성을 만들어서 추가해 둡니다.
     $(".chat").on("click", "li", function() {
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply) {
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
			modal.data("rno", reply.rno);
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
	});
        
     // Page426~ Page427 댓글의 수정 이벤트 처리
     // 댓글의 수정 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
     // 댓글의 수정은 댓글(reply)만 수정이 가능합니다. 왜냐하면 ReplyMapper.xml에서
     // update 처리가 댓글(reply)만 수정 적용하게 되어 있기 때문입니다.
     modalModBtn.on("click", function(e) {
		var reply = {rno:modal.data("rno"), reply:modalInputReply.val()}
		replyService.update(reply, function(result) {
			alert(result);
			modal.modal("hide");
			
			// 1이라고 되어 있는 건 나중에 페이징 처리할 때 페이지 넘버로 바꿀 것.
			// 댓글 리스트 갱신 처리하고 1페이지로 리턴처리하는 역할을 합니다.
			// showList(1); 
			// Page442 페이징이 적용된 댓글을 수정할 때, 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
			showList(pageNum);
		});
	});
     
     // Page427 댓글의 삭제 이벤트 처리
     // 댓글의 삭제 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
     // 댓글 삭제 역시 모달창에 있는 'data-rno'값을 이용해서 처리합니다.
     modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {
			alert(result);
			modal.modal("hide");
			
			// 1이라고 되어 있는 건 나중에 페이징 처리할 때 페이지 넘버로 바꿀 것.
			// 댓글 리스트 갱신 처리하고 1페이지로 리턴처리하는 역할을 합니다.
			// showList(1); 
			// Page442 페이징이 적용된 댓글을 수정할 때, 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
			showList(pageNum);
		});
	});
     
 });
 
</script>
</body>

</html>

