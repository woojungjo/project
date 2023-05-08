<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WeCart</title>

<link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
<link rel="icon" href="ico/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/mypageCart/wishedPrds.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
<script src="https://kit.fontawesome.com/3a5b85a601.js"
	crossorigin="anonymous"></script>

<script>

		// 버튼 옆에 있는 찜한 상품을 카트로 보내는 함수
	    // 담기에 해당하는 객체를 받아 
	    // /todayCart/register 로 보내는 방법
	    function saveGoodsToTodayCart(goodsIdValue){
	    	
    		var json = {goods_id: goodsIdValue};
    		$.ajax('/mypage/cart/saveGoodsIntoTodayCart',
			{
    			type: 'post',
    			//url: '/todayCart/register',
    			data: JSON.stringify({goods_id: goodsIdValue}),
    			contentType: "application/json; charset=utf-8",
    			success: function(object){

    				console.log("success의 경우를 확인합니다. ");
    				console.log("object: " + object);
    				if(object == "false" ){
    					alert("상품이 이미 오늘에 장바구니에 담겨있습니다.");
    				}else{
    			    	alert("상품이 카트에 담겼습니다");
    				}
    				
    			}, // Success
    			error: function(object){

    				console.log("error의 경우를 확인합니다.");
    				console.log("user: "+ user);
    				console.log("object: " + object);

    			} // Error
			}); // AJAX
	    } // saveGoodsToTodayCart()
	    
	    
	    // 해당 상품을 찜목록에서 삭제하는 함수
	    function deleteGoods(goodsIdValue){
            var result = confirm("해당 상품을 삭제하시겠습니까?");

            if(result){
                alert("상품이 삭제되었습니다.");
				
                var data = {goods_id : goodsIdValue};
                
				$.ajax('/mypage/cart/removeWishedGoods', 
				{
					type: 'post',
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					success: function(object) {
						console.log('Success of AJAX');
						window.location = "/mypage/cart/wishedPrds";
					},
					error: function(){
						console.log('Failure of AJAX');
					}
				}) // AJAX
            } // if
        } // deleteDiv(btn)
       
    </script>

</head>
<body>
		<% Object auth = session.getAttribute("__AUTH__"); %>
		
		<% if(auth != null) { %>
			<jsp:include page="../../header_footer/main_header.jsp" flush="true" />
		<% } else { %>
			<jsp:include page="../../header_footer/home_header.jsp" flush="true" />
			<script>
				alert("로그인을 해주세요.");
				window.location = "/user/login";
			</script>
		<% } %>

		<div class="widthfix">
			<div id="container">
				<div id="section">
					<div id="mypage_nav">
						<ul class="mypage_nav_ul">
							<li class="mypage_nav_li"><a href="#" class="nav_text">마이페이지</a></li>
							<li class="mypage_nav_li"><a href="/mypage/edit/checkUser" class="nav_text">개인정보
									수정</a></li>
							<li class="mypage_nav_li"><a href="/mypage/cart/list" class="nav_text">장바구니
									목록</a></li>
							<li class="mypage_nav_li"><a href="/mypage/cart/wishedPrds" class="nav_text">찜한
									상품</a></li>
							<li class="mypage_nav_li"><a href="#" class="nav_text">즐겨찾는
									마트</a></li>
							<li class="mypage_nav_li"><a href="#" class="nav_text">내
									활동 내역</a></li>
							<li class="mypage_nav_li"><a href="#" class="nav_text">키워드알림</a></li>
							<li class="mypage_nav_li"><a href="#" class="nav_text">활동알림</a></li>
							<li class="mypage_nav_li"><a href="#" class="nav_text">채팅
									내역</a></li>
							<li class="mypage_nav_li"><a href="#" class="nav_text">북마크
									내역</a></li>
						</ul>
					</div>

					<div id="mypage_article">
						<p>
						<pre>  </pre>
						</p>
						<p>
						<pre>  </pre>
						</p>
						<!-- <pre><h3 style="display: inline-block; ">찜한 상품(20)</h3>  찜한 상품은 최대 200개까지 저장합니다.</pre> -->
						<!-- <pre style="display: inline;"><font size="+2"><b>찜한 상품(<div id="numberOfPrd">5</div>)</b></font>  찜한 상품은 최대 200개까지 저장합니다.</pre> -->

						<div class="discription"
							style="display: inline-block; font-size: 1.5em; font-weight: bold;">
							
							 <c:set var="numGoods" value="${fn:length(__GOODS_OBJECT_LIST__)}" />
							찜한 상품(<strong id="numberOfPrd">${fn:length(__GOODS_OBJECT_LIST__)}</strong>)
						</div>
						<span>&nbsp; &nbsp; &nbsp; &nbsp; 찜한 상품은 최대 200개까지 저장합니다.</span>



						<hr>
						<c:forEach items="${__GOODS_OBJECT_LIST__}" var="goods" varStatus="number">
						<div class="managePrds">
							<div class="leftAsUserStandard">
								
								<img src="${goods.goods_pic}"
									alt="prdPicture">

								<div class="leftWordsAsUserStandard">
									<div>상품명: ${goods.goods_name}</div>
								</div>
							</div>

							<div class="rightAsUserStandard">
								<button onclick="deleteGoods('${goods.goods_id}')">삭제</button>
								<button class="mypick_bt" onclick="saveGoodsToTodayCart('${goods.goods_id}')">
									<i class="fa-solid fa-cart-shopping fa-1x"></i> 담기
								</button>
							</div>
						</div>
						<hr>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		 <jsp:include page="../../header_footer/footer.jsp" flush="true" />

		<a href="#TOP" id="top_bt" class="a_black_text"> <i
			class="fa-solid fa-arrow-up fa-lg"></i>
		</a>
	

	<script>

    </script>

</body>

</html>
>
