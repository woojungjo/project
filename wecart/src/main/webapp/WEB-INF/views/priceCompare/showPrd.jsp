<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WeCart</title>

<link rel="shortcut icon" href="ico/favicon.ico" type="image/x-icon">
<link rel="icon" href="ico/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/resources/css/mypageCart/showPrd.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
<script src="https://kit.fontawesome.com/3a5b85a601.js"
	crossorigin="anonymous"></script>

<!-- star from fontawsome -->
<script src="https://kit.fontawesome.com/f55d6db1b8.js"
	crossorigin="anonymous"></script>

   
<script>
		//
		// AJAX로 모델 가져오고
		
		var user = '<%= session.getAttribute("__AUTH__") %>'; 

		// 장바구니
		// 장바구니 버튼을 클릭 시, 
		// 오늘에 카트로 해당 상품을 담는디
        function addPrdToTodayCart() {
            var input = confirm("상품을 장바구니에 추가하시겠습니까?");
    		
            console.log(input);
            if (input) {
            	/*
    	    	const url = 'http://localhost:8080/todayCart/register';
    	        const data = { item: '수박', id: 1237 };
    	        const xhr = new XMLHttpRequest();
    	        xhr.open('POST', url, true);
    	        xhr.setRequestHeader('Content-Type', 'application/json');
    	        
    	    	
    	    	xhr.onload = function(){
    	    		if(xhr.status === 200 ){
    	    			console.log(xhr.response);
    	    		} else {
    					console.error(xhr.statusText);        			
    	    		} // if - else
    	    	} // function
            
            
	    		xhr.send(JSON.stringify(data));*/
	    		
	    		// auth가 안 올라왔을 시에는 redirect
	    		if(user == "null"){
	    			alert("로그인을 부탁드립니다. ");
	    			window.location = "/user/login";
	    		} // if
	    		
	    		var json = {goods_id: '${__GOODS__.goods_id}'};
	    		$.ajax('/mypage/cart/saveGoodsIntoTodayCart',
	    		{
	    			type: 'post',
	    			//url: '/todayCart/register',
	    			data: JSON.stringify({goods_id: '${__GOODS__.goods_id}'}),
	    			contentType: "application/json; charset=utf-8",
	    			success: function(object){

	    				if(object == "false"){
	    					alert('이미 등록된 상품 입니다.');
	    				}else{
	    					if(confirm('성공적으로 등록되었습니다. 장바구니로 이동하시겠습니까?')) {
	    						window.location = "/todayCart/cartList";	
	    					}
	    				}
	    				
	    				console.log("success의 경우를 확인합니다. ");
	    				console.log("user: " + user);
	    				
	    				console.log("object: " + object);
	    			},
	    			error: function(){

	    				console.log("error의 경우를 확인합니다.");
	    				console.log("user: "+ user);
	    				console.log("object: " + object);

	    			}
	    		}) // ajax
            } // if 

        } // addPrdToTodayCart
        
        // 하트
        // 하트를 누를 시
        // 하트는 변하게 되고, 해당 상품을 좋아요에 담는다
        function addPrdToLike(btn){
        	// 하트가 변하는 스코프
        	{
                 var className = btn.className;
                 var iTag = btn.childNodes;


                 console.log(iTag);
                 console.log(iTag[0]);
                 console.log(iTag[1]);
                 if(btn.childNodes[1] === "i.fa-solid.fa-heart.fa-2xl"){
                     console.log("hello");
                     btn.childNodes[1] = "fa-regular fa-heart fa-2x";
                 }else{

                 } // if - else
             } // changedHeart
             
	        var json = {goods_id: '${__GOODS__.goods_id}'};
	    	$.ajax('/mypage/cart/saveGoodsIntoWishedGoods', {
	    		
	    		type: 'post',
	    		data: JSON.stringify(json),
    			contentType: "application/json; charset=utf-8",
				success: function(object){
    				console.log("success의 경우를 확인합니다. ");
					console.log("object: " + object);
					
					if(object === "false"){
						alert("상품이 이미 찜목록에 담겨있습니다.");						
					}else{
						alert("상품이 찜목록에 담겼습니다");
					}
					
					window.location = "/mypage/cart/wishedPrds"
				},
				error: function(object){
    				console.log("error의 경우를 확인합니다.");
    				console.log("object: " + object);
				}
	    	}); //AJAX
	    
        } // saveGoodsIntoWishGoods
        
        // 마트 위치
        // 위치 아이콘을 누를 시
        // 해당 마트가 보여지는 지도로 날라간다
        function locationOfMarts(){
        	
        	// 일단 <a href > 로 구현
        	
        } // locationOfMarts()
        
    </script>	

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


		<div class="widthfix">
			<div id="search">
				<div class="cate">
					<i class="fa-solid fa-bars fa-2x"></i> <span>카테고리</span>
				</div>
				<div class="search_bar">
					<form action="/priceCompare/search" method="get">
						<div class="search_form">
							<input type="text" name="keyword" placeholder="검색어를 입력해주세요"
								class="search_input">
							<button type="submit" class="submit_bt">
								<i class="fa-solid fa-magnifying-glass fa-lg"></i>
							</button>
						</div>
					</form>
				</div>
				<div>
					<button type="button" class="mypick_bt mypick_goods">
						<i class="fa-regular fa-heart fa-2x"></i>
					</button>
					<button type="button" class="mypick_bt mypick_cart">
						<i class="fa-solid fa-cart-shopping fa-2x"></i>
					</button>
				</div>
			</div>
		</div>


		<article class="article">

			<div id="middleContainer">
				<div class="leftFromUser">
					<h3>과일류 > ${__GOODS__.goods_id}</h3>
					<h3>용량: ${ __GOODS__.capacity }</h3>
					<img src= ${__GOODS__.goods_pic }
						alt= ${__GOODS__.goods_name } />
				</div>

				<div class="rightFromUser">
					<p></p>
					<div>
						<button type="button" class="mypick_btHeart"
							onclick="addPrdToLike(this)">
							<i class="fa-regular fa-heart fa-2x"></i>
						</button>

						<!-- <button type="button" class="mypick_btHeart" onclick="changedHeart(this)">
                            <i class="fa-solid fa-heart fa-2xl"></i></button> -->
						<button type="button" onclick="addPrdToTodayCart()">장바구니</button>
					</div>
					<table class="tableToShowPrice">
						<c:forEach items="${__PRICEDTO__}" var="dto"  >
							<tr>
								<td>
									${dto.retail_name}
									&emsp;
								<button type="button">
									<a href="/map/locationOfMarts"><i class="fa-solid fa-location-dot"></a></i>
								</button> &emsp;
								</td>
								<td>
									${dto.price }
								</td>
							</tr>
					
						</c:forEach>
						<c:if test="${fn:length(__PRICEDTO__) == 0}">
							<tr>
    							<div>리스트가 비어있습니다.</div>
    						</tr>
						</c:if>
					</table>
				</div>
			</div>
		</article>

		<jsp:include page="../header_footer/footer.jsp" flush="true" />
		
		<script>
			//상단 찜목록, 오늘의장바구니 페이지 이동
	        var mypickGoods = document.querySelector(".mypick_goods");
	        console.log("mypickGoods: ", mypickGoods);
		    mypickGoods.addEventListener('click', () => {
		        location.href = "/mypage/cart/wishedPrds";
		    });
		
		    var mypickCart = document.querySelector(".mypick_cart");
		    mypickCart.addEventListener('click', function (e) {
		        console.log(e.target);
		        location = "/todayCart/cartList";
		    });
		</script>

</body>

</html>