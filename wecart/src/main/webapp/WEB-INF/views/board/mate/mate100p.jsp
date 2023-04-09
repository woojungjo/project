<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장메이트</title>

    <script src="/Board/YJ_Resources/js/script.js" defer></script>

    <!-- <script src="https://kit.fontawesome.com/78271596c1.js" crossorigin="anonymous"></script> -->

    <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>

    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" /> -->

    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
        rel="stylesheet">
        
    <link rel="stylesheet" href="/Board/YS_Resources/css/style.css">
    <link rel="stylesheet" href="/Board/YJ_Resources/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.3/sweetalert2.min.css" integrity="sha512-NvuRGlPf6cHpxQqBGnPe7fPoACpyrjhlSNeXVUY7BZAj1nNhuNpRBq3osC4yr2vswUEuHq2HtCsY2vfLNCndYA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert2/11.7.3/sweetalert2.min.js" integrity="sha512-eN8dd/MGUx/RgM4HS5vCfebsBxvQB2yI0OS5rfmqfTo8NIseU+FenpNoa64REdgFftTY4tm0w8VMj5oJ8t+ncQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.1.0-beta.1/js/select2.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

</head>
<body>
    	<jsp:include page="/Woojung_JSP/afterlogin_header.jsp" flush="true" />
    	
        <main id="board_main">

<!-- 
            <div class="board_change">
                <input type="button" value="지역">
                <input type="button" value="중고거래">
                <input type="button" value="장메이트">
                <input type="button" value="크롤링">
                <input type="button" value="세일정보">
            </div>
 -->
                <div class="board_change">
                    <a href="RegionBoard.html"><button id="region">지역</button></a>
                    <a href="UsedBoard.html"><button id="used">중고거래</button></a>
                    <a href="MateBoard.html"><button id="mate">장메이트</button></a>
                    <a href="CrawlingBoard.html"><button id="crawling">크롤링</button></a>
                    <a href="SaleBoard.html"><button id="sale">세일정보</button></a>
                </div>
            <div id="mate_board_read">

                    <div class="mate_board_name">장메이트 게시판</div>
                <div id="mate_board_info">
                    <!-- <button type="button" class="mate_board_recruiting" >모집중</button> -->
                    
                    <div class="mate_board_recruiting">
                        <select class="mate_board_recruiting_option">
                            <option value="recruiting" >모집중</option >
                            <option value="completed"  >참여완료</option>
                        </select>
                    </div>
                        <!-- <ul class="dropdown-menu"  style="display: none;">
                            <li><a href="#">모집중</a></li>
                            <li><a href="#">참여완료</a></li>
                        </ul> -->

                    <div id="mate_board_writer_and_bookMark">
                        <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        </div>
                        <div class="mate_board_bookMark"><i class="fa-regular fa-bookmark"></i></div>
                    </div>

                    <div id="mate_board_writedt_mate_board_views"></div>
                    
                    <!-- <fmt:formatDate pattern ="yyyy/MM/dd HH:mm:ss" value="${boardVO.insert_ts}"/> -->

                    <div id="mate_board_writedt_and_views">
                        <div class="mate_board_writedt">작성일자</div>
                        <div class="mate_board_views"><div class="fas fa-eye"></div>조회수</div>
                    </div>    
                    <div class="mate_board_title"><!--div class="fas fa-lock"--></div> 글제목</div>
                </div> <!--mate_board_info-->

                <div id="mate_board_contents">
                    
                    <div class="mate_board_contents_wrapper">
                    <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    <div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        
                        <div id="member">
                            <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                            <div class="currentMemberNum"></div>
                            <div>/</div>
                            <div class="finalMemberNum">4</div>

                            <ul id="sub">
                                <div class="sub_writers">
                                    <li><i class="fa-solid fa-piggy-bank"></i>3500</li>
                                    <li  class="sub_writer" >작성자 <span class="sub_alias">(닉네임)</span></li>
                                </div>   
                                <hr>
                                <div class="sub1">
                                    <li><i class="fa-solid fa-piggy-bank"></i>4000</li>
                                    <li  class="sub_participants1" >참여자1 <span class="sub_waiting">(대기)</span></li>
                                </div>
                                <div class="sub2">
                                    <li><i class="fa-solid fa-piggy-bank"></i>4500</li>
                                    <li  class="sub_participants2" >참여자2 <span class="sub_joint">(참여)</span></li>
                                </div>
                                <div class="sub3">
                                    <li><i class="fa-solid fa-piggy-bank"></i>4500</li>
                                    <li  class="sub_participants3" >참여자3 <span class="sub_joint">(참여)</span></li>
                                </div>
                                
                                 <!-- 
                                <div class="sub4">
                               		 <li><i class="fa-solid fa-piggy-bank"></i>4500</li>
                                <li  class="sub_participants4" >참여자4 <span class="sub_waiting">(대기)</span></li>
                           		</div>
                           		 -->
                            </ul><!--sub-->
                        </div><!--member-->
                    </div>
                    <hr>

                    <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam itaque reiciendis totam suscipit? Corrupti ipsam dolorum ut sint nesciunt non, ex aperiam facere nostrum. Reprehenderit, officia. Quod minima quis et!
                    </p>  

                    <div id="map" style="width:500px;height:400px; margin: 0 auto; "></div>
                    
                    <div class="mate_board_contents_join">
                        <button type="button" class="mate_board_join_button">참여하기</button>
                    </div>
                </div>
                </div><!--mate_board_contents-->
            
				

                <div id="mate_board_info_below">
                    <button type="button" class="mate_board_report">신고</button>
                    
                    <div class="mate_board_attach"><button id="download_button"><div class="fas fa-paperclip"></div>첨부파일</button>
                        <div id="mate_board_attach_download">
                            <ul>
                                <li><div class="fas fa-paperclip"></div> 파일 다운로드1</li>
                                <li><div class="fas fa-paperclip"></div> 파일 다운로드2</li>
                                <li><div class="fas fa-paperclip"></div> 파일 다운로드3</li>
                            </ul>
                        </div>
                    </div> <!--qna_board_attach-->

                    <div id="mate_board_modify_and_delete">
                        <button type="button" class="mate_board_modify" >수정</button>
                        <button type="button" class="mate_board_delete" >삭제</button>
                    </div>

            </div> <!--mate_board_info_below-->

            <article id="board_read">
                
            </article>
        </main>

       <jsp:include page="/Woojung_JSP/footer.jsp" flush="true" />
</body>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0be8f3b8bf2f892c159cfeb384998199"></script>	
	
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(34.8861, 127.5091),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);
    
 // 마커가 표시될 위치입니다 
    var markerPosition  = new kakao.maps.LatLng(34.8861, 127.5091); 

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);   
</script>

</html>