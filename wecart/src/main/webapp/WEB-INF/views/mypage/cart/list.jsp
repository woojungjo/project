<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeCart</title>

    <link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
    <link rel="icon" href="ico/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/resources/css/mypageCart/list.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/3a5b85a601.js" crossorigin="anonymous"></script>


	<script>
		
		// 기간 설정 후 버튼 클릭하여 이 페이지를 다시 리로드하고 그때
		// 기간에 따라 쇼핑 리스트를 정렬
	    function sendPeriod(){
	    	var period = document.getElementById("selectedPeriod").value;
	    	var url = "/mypage/cart/list?period=" + period;
	    	window.location.href= url;
	    } // sendPeriod()
	    
	    // 상세보기를 클릭 시, 
	    // 해당 장바구니의 id를 mypage/cart/get()에 전달하여
	    // 해당 장바구니를 보여줌 (Restful API를 사용할지 말지 고민)
	    function seeDetailCart(){
	    	
	    } // seeDetailCart()
	    
	</script>
</head>

<body>
    
        <% Object auth = session.getAttribute("__AUTH__"); %>
		
		<% if(auth != null) { %>
			<jsp:include page="../../header_footer/main_header.jsp" flush="true" />
		<% } else { %>
			<jsp:include page="../../header_footer/home_header.jsp" flush="true" />
		<% } %>

	<div id="wrap">
        <article class="article">

            <div id="mypage_nav">
                <ul class="mypage_nav_ul">
                    <li class="mypage_nav_li"><a href="#" class="nav_text">마이페이지</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">개인정보 수정</a></li>
                    <li class="mypage_nav_li"><a href="/mypage/cart/list" class="nav_text">장바구니 목록</a></li>
                    <li class="mypage_nav_li"><a href="/mypage/cart/wishedPrds" class="nav_text">찜한 상품</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">즐겨찾는 마트</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">내 활동 내역</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">키워드알림</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">활동알림</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">채팅 내역</a></li>
                    <li class="mypage_nav_li"><a href="#" class="nav_text">북마크 내역</a></li>
                </ul>
            </div>

            <div id="content">
                <div>
                    <p>
                        <select id="selectedPeriod">
                            <option value="week">일주일</option>
                            <option value="1month">1개월</option>
                            <option value="3months">3개월</option>
                            <option value="6months">6개월</option>
                        </select>
                        <button onclick="sendPeriod()">전송</button> 
                    </p>

                    <table class="shoppingBasketList">
                        <tbody>
                            <tr>
                                <td><img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture"></td>

                                <td>
                                    <h3>장바구니 번호: 1 </h3><br>
                                    장바구니 등록일: 230326<br>
                                    상품명: 수박 외 5건 <br><br>

                                    <p><a href="/mypage/cart/get">상세보기 </a> </p>

                                </td>
                            </tr>

                            <tr>
                                <td><img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture"></td>

                                <td>
                                    <h3>장바구니 번호: 2 </h3><br>
                                    장바구니 등록일: 230326<br>
                                    상품명: 수박 외 5건 <br><br>

                                    <p><a href="/mypage/cart/get">상세보기 </a> </p>

                                </td>

                            <tr>
                                <td><img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture"></td>

                                <td>
                                    <h3>장바구니 번호: 3 </h3><br>
                                    장바구니 등록일: 230326<br>
                                    상품명: 수박 외 5건 <br><br>

                                    <p><a href="/mypage/cart/get">상세보기 </a> </p>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </article>
    </div>
     <jsp:include page="../../header_footer/footer.jsp" flush="true" />

</body>

</html>