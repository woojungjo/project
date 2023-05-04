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
	         <jsp:include page="../header_footer/main_header.jsp" flush="true" />
	      <% } else { %>
	         <jsp:include page="../header_footer/home_header.jsp" flush="true" />
	      <% } %>
	      
        <main>
            <!--*********************************************메인 내용은 여기부터*********************************************-->

            <main id="board_main">
                <form action="/board/register" method="post" id="register">

                    <input type="hidden" name="member_id" value="${__AUTH__.member_id}">
                    <input type="hidden" name="meeting_status" value="1">
                    <input type="hidden" name="report_cnt" value="0">
                    <input type="hidden" name="views" value="0">
                    <input type="hidden" id="secret_yn" name="secret_yn" value="0">
                     <!-- <input type="hidden" id="meeting_time" name="meeting_time" value="23/05/02 04:27:56">
            <input type="hidden" name="participant_id_1" value="1">
                    <input type="hidden" name="participant_id_2" value="1">
                     <input type="hidden" name="participant_id_3" value="1"> -->
                    
                    
                    <div id="board_write">

                        <div id="board_write_top">
                            <div>글쓰기</div>
                            <button type="submit" id="registerBtn">등록</button>
                        </div>
                        <div><hr></div>
                        
                        <select name="sortOfBoard" id="boardSelect">
                            <option>게시판을 선택해 주세요</option>
                            <option value="1">지역게시판</option>
                            <option value="2">중고거래</option>
                            <option value="3">장메이트</option>
                            <option value="4">크롤링</option>
                            <option value="5">세일정보</option>
                            <option value="6">Q&A</option>
                        </select>
                        
                 	<div id="mate_board_maps">
	            		<i class="fa-solid fa-location-dot"></i><input id="materegister_smeeting_area" name="meeting_area" type="text" placeholder="미팅장소 설정">
                    </div>

                    <!--input id="" name="meeting_time" type="text" placeholder="미팅시간 설정"-->
                    <div id="materegister_setMeetingTime">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i></div>
                        <input type="datetime-local" name="meeting_time">
                    </div>
                </div> <!--board_main-->
                
                
                <input id="smartEditorTitle" name="title" type="text" placeholder="제목을 입력해 주세요"
                        style="width:1128px; height:30px;" />
				<!-- 스마트에디터 -->
                    <div id="smarteditor">
                        <textarea 
                            name="content" 
                            id="content" 
                            rows="10" 
                            cols="100" 
                            placeholder="내용을 입력해주세요"
                            style="width: 1128px">
	                    </textarea>
                    </div>
 				<!-- 스마트에디터 -->

				<!-- QnA -->
                    <div id="board_secret">
                        <input type="checkbox">&nbsp;비밀글을 작성합니다.
                    </div>

				<!-- MateBoard -->
				  <div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					                    키워드 <input type="text" id="keyword">
					                    <button type="submit" onclick="searchPlaces(); return false; ">검색</button> 
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					    
					</div>
                </form> 
            </main>
 <!--*********************************************메인 내용은 여기까지*********************************************-->
            
	<jsp:include page="../header_footer/footer.jsp" flush="true" />
   
    </body>

    </html>