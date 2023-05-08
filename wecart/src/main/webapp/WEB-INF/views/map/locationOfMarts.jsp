<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

		<script id="scriptMap" src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
            rel="stylesheet">
		
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be8f3b8bf2f892c159cfeb384998199&libraries=services"></script>
        
		<script src="/resources/js/board/mate/map.js" defer></script>
		<link rel="stylesheet" href="/resources/css/board/mate/map.css">
		
</head>
<body>
		<% Object auth = session.getAttribute("__AUTH__"); %>
		
		<% if(auth != null) { %>
			<jsp:include page="../header_footer/main_header.jsp" flush="true" />
		<% } else { %>
			<jsp:include page="../header_footer/home_header.jsp" flush="true" />
			<script>
			alert("주소 확인을 위해 로그인을 해주십시오.");
			window.location = "/user/login";
			</script>
		<% } %>
		
		
		
			<!-- MateBoard -->
	  <div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
		
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                    키워드 <input type="text" id="keyword" placeholder="예시: 자양동 마트">
		                    <button type="submit" onclick="searchPlaces(); return false; ">검색</button> 
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		    
		</div>
             
		
		<jsp:include page="../header_footer/footer.jsp" flush="true" />
		
</body>
</html>