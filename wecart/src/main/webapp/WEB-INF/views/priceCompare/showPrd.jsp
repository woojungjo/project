<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	    				console.log("success의 경우를 확인합니다. ");
	    				console.log("user: " + user);
	    				console.log("object: " + data);
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
             
	    	alert("상품이 찜목록에 담겼습니다");
	    	
	    	const url = 'http://localhost:8080/priceCompare/addPrd';
	        const data = { item: '수박', id: 1237 };
	        const xhr = new XMLHttpRequest();
	        xhr.open('POST', url);
	        xhr.setRequestHeader('Content-Type', 'application/json');
	        
	    	
	    	xhr.onload = function(){
	    		if(xhr.status === 200 ){
	    			console.log(xhr.response);
	    		} else {
					console.error(xhr.statusText);        			
	    		}
	    	};
	    	
	    	xhr.onerror = function(){
	    		
	    		console.error('Error: Network Error');
	    	};
	    	
	    	xhr.send(JSON.stringify(data));
        } // addPrdToLike
        
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
					<button type="button" class="mypick_bt">
						<i class="fa-regular fa-heart fa-2x"></i>
					</button>
					<button type="button" class="mypick_bt">
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
					<p style="color: red">최저가격: &emsp;&emsp;&emsp;&emsp; ${ __GOODS__.low_price }</p>
					<table class="tableToShowPrice">
						<tr>
							<td>마트 1&emsp;
								<button type="button">
									<a href="/map/locationOfMarts"><i class="fa-solid fa-location-dot"></a></i>
								</button> &emsp;
							</td>
							<td>13.000</td>
						</tr>
						<tr>
							<td>마트 2&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 3&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 4&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 5&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
						<tr>
							<td>마트 6&emsp;
								<button type="button">
									<i class="fa-solid fa-location-dot"></i>
								</button> &emsp;
							<td>15.000</td>
						</tr>
					</table>

				</div>
			</div>
		</article>

		<jsp:include page="../header_footer/footer.jsp" flush="true" />

</body>

</html>