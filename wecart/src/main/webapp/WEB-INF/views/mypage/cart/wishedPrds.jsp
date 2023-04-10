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
    <link rel="stylesheet" href="/resources/css/mypageCart/wishedPrds.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/3a5b85a601.js" crossorigin="anonymous"></script>
</head>

<body>
    <div id="wrap">
        <div class="widthfix header_color">
            <div id="header">
                <span>우리동네<br>장바구니</span>
                <div id="gnb">
                    <ul class="nav gnb">
                        <li class="nav_item gnb_li"><a href="#" class="nav_text">가격비교</a></li>
                        <li class="nav_item gnb_li"><a href="#" class="nav_text">커뮤니티</a> </li>
                        <li class="nav_item gnb_li"><a href="#" class="nav_text">QNA</a></li>
                    </ul>
                </div>

                <div id="info">
                    <ul class="nav">
                        <li class="nav_item"><span class="nav_text">개포동</span></li>
                        <li class="nav_item"><button onclick=window.location.href='#' id="login_bt">로그인</button></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="widthfix">
            <div id="container">
                <div id="section">
                    <div id="mypage_nav">
                        <ul class="mypage_nav_ul">
                            <li class="mypage_nav_li"><a href="#" class="nav_text">마이페이지</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">개인정보 수정</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">장바구니 목록</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">찜한 상품</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">즐겨찾는 마트</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">내 활동 내역</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">키워드알림</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">활동알림</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">채팅 내역</a></li>
                            <li class="mypage_nav_li"><a href="#" class="nav_text">북마크 내역</a></li>
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
                        
                        <div class = "discription" style="display: inline-block; font-size: 1.5em; font-weight: bold;">
                            찜한 상품(<strong id="numberOfPrd">5</strong>)</div><span>&nbsp; &nbsp; &nbsp; &nbsp; 찜한 상품은 최대 200개까지 저장합니다.</span>



                        <hr>
                        <div class="managePrds">
                            <div class="leftAsUserStandard">
                                <img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture">

                                <div class="leftWordsAsUserStandard">
                                    <div>[자연실록] 당도 높은 맛있는 꿀수박 1kg</div>
                                </div>
                            </div>

                            <div class="rightAsUserStandard">
                                <button onclick="deleteDiv(this)">삭제</button>
                                <button class="mypick_bt" onclick="addPrdToCart()"><i class="fa-solid fa-cart-shopping fa-1x"></i> 담기</button>
                            </div>
                        </div>
                        <hr>
                        <div class="managePrds">
                            <div class="leftAsUserStandard">
                                <img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture">

                                <div class="leftWordsAsUserStandard">
                                    <div>[자연실록] 당도 높은 맛있는 꿀수박 1kg</div>
                                </div>
                            </div>

                            <div class="rightAsUserStandard">
                                <button onclick="deleteDiv(this)">삭제</button>
                                <button class="mypick_bt"><i class="fa-solid fa-cart-shopping fa-1x"></i> 담기</button>
                            </div>
                        </div>
                       
                        <hr>
                        <div class="managePrds">
                            <div class="leftAsUserStandard">
                                <img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture">

                                <div class="leftWordsAsUserStandard">
                                    <div>[자연실록] 당도 높은 맛있는 꿀수박 1kg</div>
                                </div>
                            </div>

                            <div class="rightAsUserStandard">
                                <button onclick="deleteDiv(this)">삭제</button>
                                <button class="mypick_bt"><i class="fa-solid fa-cart-shopping fa-1x"></i> 담기</button>
                            </div>
                        </div>
                        <hr>
                        <div class="managePrds">
                            <div class="leftAsUserStandard">
                                <img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture">

                                <div class="leftWordsAsUserStandard">
                                    <div>[자연실록] 당도 높은 맛있는 꿀수박 1kg</div>
                                </div>
                            </div>

                            <div class="rightAsUserStandard">
                                <button onclick="deleteDiv(this)">삭제</button>
                                <button class="mypick_bt"><i class="fa-solid fa-cart-shopping fa-1x"></i> 담기</button>
                            </div>
                        </div>
                        <hr>
                        <div class="managePrds">
                            <div class="leftAsUserStandard">
                                <img src="/resources/imgs/mypageCart/waterMelon.PNG" alt="prdPicture">

                                <div class="leftWordsAsUserStandard">
                                    <div>[자연실록] 당도 높은 맛있는 꿀수박 1kg</div>
                                </div>
                            </div>

                            <div class="rightAsUserStandard">
                                <button onclick="deleteDiv(this)">삭제</button>
                                <button class="mypick_bt"><i class="fa-solid fa-cart-shopping fa-1x"></i> 담기</button>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>

        <div class="widthfix">
            <div id="footer">

            </div>
        </div>

        <a href="#TOP" id="top_bt" class="a_black_text">
            <i class="fa-solid fa-arrow-up fa-lg"></i>
        </a>
    </div>

    <script>
        function deleteDiv(btn){
            

            var result = confirm("해당 상품을 삭제하시겠습니까?");

            if(result){
                alert("상품이 삭제되었습니다.");

                var divTag = btn.parentNode.parentNode;
                var hrTag = divTag.previousElementSibling;

                var numberElement = document.getElementById("numberOfPrd");
                var changedNumber = parseInt(numberElement.innerText);
                changedNumber -= 1;
                numberElement.innerText = changedNumber;


                hrTag.remove();
                divTag.remove();
                console.log(hrTag) ;
    
                
                window.location.href = "/mypage/cart/wishedPrdsRemoved";
            } // if
        } // deleteDiv(btn)
        
        function addPrdToCart(){
        	alert("상품이 카트에 담겼습니다");
        	
        	window.location.href= "/todayCart/cartList";
        } // addPrdToCart()

    </script>

</body>

</html>>