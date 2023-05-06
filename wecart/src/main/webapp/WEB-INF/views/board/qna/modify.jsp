<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>WeCart</title>

        <script id="scriptMap" src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
            rel="stylesheet">
		
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be8f3b8bf2f892c159cfeb384998199&libraries=services"></script>
        
		<script src="/resources/js/board/mate/map.js" defer></script>
		<link rel="stylesheet" href="/resources/css/board/mate/map.css">
		
		<script src="/resources/js/board/register.js" defer></script>
		
        <script src="/resources/js/board/mate/list.js" defer></script>
        <script src="/resources/js/board/mate/script.js" defer></script>
        <link rel="stylesheet" href="/resources/css/board/mate/style.css">
        <link rel="stylesheet" href="/resources/css/board/qna/style.css">
        <script src="/resources/js/board/qna/script.js" defer></script>
        <script src="/resources/js/board/qna/smarteditor.js" defer></script>

        <!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
        <script type="text/javascript" src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"
            defer></script>
        <!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    </head>

    <body>
    	<% Object auth = session.getAttribute("__AUTH__"); %>
	      <% if(auth != null) { %>
	         <jsp:include page="../../header_footer/main_header.jsp" flush="true" />
	      <% } else { %>
	         <jsp:include page="../../header_footer/home_header.jsp" flush="true" />
	      <% } %>
	      
        <main>
            <!--*********************************************메인 내용은 여기부터*********************************************-->

            <main id="board_main">
                <form action="/board/qna/modify" method="post">
					
					<input type="hidden" name="post_no" value="${readVO.post_no}">
                    <input type="hidden" name="member_id" value="${__AUTH__.member_id}">
                    <input type="hidden" id="secret_yn" name="secret_yn" value="${readVO.secret_yn}">
                    <input type="hidden" id="views" name="views" value="${readVO.views}">
                    
                    <div id="board_write">

                        <div id="board_write_top">
                            <div>수정하기</div>
                            <!-- input type="text" name="post_no" value="${readVO.post_no}" readonly-->
                            <button type="submit" id="modifySaveBtn">저장</button>
                        </div>
                        <div><hr></div>
                
                <input id="smartEditorTitle" name="title" type="text" value="${readVO.title}"
                        style="width:1128px; height:30px;" />
				<!-- 스마트에디터 -->
                    <div id="smarteditor">
                        <textarea 
                            name="content" 
                            id="content" 
                            rows="10" 
                            cols="100" 
                            placeholder="내용을 입력해주세요"
                            style="width: 1128px"
                            >
                            ${readVO.content}
	                    </textarea>
                    </div>
 				<!-- 스마트에디터 -->

				<!-- QnA -->
                    <div id="board_secret">
                        <input type="checkbox">&nbsp;비밀글을 작성합니다.
                    </div>
					    
					</div>
                </form> 
            </main>
 <!--*********************************************메인 내용은 여기까지*********************************************-->
            
	<jsp:include page="../../header_footer/footer.jsp" flush="true" />
   
    </body>

    </html>