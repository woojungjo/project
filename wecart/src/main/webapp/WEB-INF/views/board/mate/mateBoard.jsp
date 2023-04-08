<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장메이트100p</title>

    <script src="/Board/YJ_Resources/js/script.js" defer></script>
    <script src="/Board/YS_Resources/js/script2.js" defer></script>

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
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="/Board/YS_Resources/css/style2.css">

</head>
<body>
	<jsp:include page="/Woojung_JSP/afterlogin_header.jsp" flush="true" />
 	
 	 <main>
        <!--*********************************************메인 내용은 여기부터*********************************************-->
        
        <article id="board">
            <div class="qna_board_name">장메이트 게시판</div>
            <ul>
            
                <li class="board_list">
                    <div class="board_grid">
                        <div class="board_head">
                           <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        	</div>
                            <div>WRITE_DT</div>
                            <button type=button value="recruiting" >모집중</button>

                        </div>
                        <div id="mate_board_container1">
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="fas fa-paperclip"></div>
                        
                        </div>
                        
                        <div id="mate_board_container2">
                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    	<div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                        <div class="currentMemberNum">2</div>
                        <div>/</div>
                        <div class="finalMemberNum">4</div>
                        <p></p>
                        </div>
                        
                        
                        <div class="board_tail">
                            <div><span class="fas fa-eye"></span>VIEWS</div>
                            <div><span class="fas fa-comment-dots"></span>댓글</div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_grid">
                        <div class="board_head">
                           <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        	</div>
                            <div>WRITE_DT</div>
							<button type=button value="completed" >참여완료</button>
                        </div>
                        
                        <div id="mate_board_container1">
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="fas fa-paperclip"></div>
                        
                        </div>
                        
                        <div id="mate_board_container2">
                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    	<div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                        <div class="currentMemberNum">2</div>
                        <div>/</div>
                        <div class="finalMemberNum">4</div>
                        <p></p>
                        </div>
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="board_tail">
                            <div><span class="fas fa-eye"></span>VIEWS</div>
                            <div><span class="fas fa-comment-dots"></span>댓글</div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_grid">
                        <div class="board_head">
                           <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        	</div>
                            <div>WRITE_DT</div>
							<button type=button value="completed" >참여완료</button>
                        </div>
                        
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                                                <div id="mate_board_container1">
                        <div class="fas fa-paperclip"></div>
                        
                        </div>
                        
                        <div id="mate_board_container2">
                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    	<div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                        <div class="currentMemberNum">2</div>
                        <div>/</div>
                        <div class="finalMemberNum">4</div>
                        <p></p>
                        </div>
                        <div class="board_tail">
                            <div><span class="fas fa-eye"></span>VIEWS</div>
                            <div><span class="fas fa-comment-dots"></span>댓글</div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_grid">
                        <div class="board_head">
                           <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        	</div>
                            <div>WRITE_DT</div>
    						<button type=button value="recruiting" >모집중</button>
                        </div>
                        
                        <div id="mate_board_container1">
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="fas fa-paperclip"></div>
                        
                        </div>
                        
                        <div id="mate_board_container2">
                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    	<div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                        <div class="currentMemberNum">2</div>
                        <div>/</div>
                        <div class="finalMemberNum">4</div>
                        <p></p>
                        </div>
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="board_tail">
                            <div><span class="fas fa-eye"></span>VIEWS</div>
                            <div><span class="fas fa-comment-dots"></span>댓글</div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_grid">
                        <div class="board_head">
                           <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        	</div>
                            <div>WRITE_DT</div>
							<button type=button value="completed" >참여완료</button>

                        </div>
                        
                        <div id="mate_board_container1">
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="fas fa-paperclip"></div>
                        
                        </div>
                        
                        <div id="mate_board_container2">
                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    	<div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                        <div class="currentMemberNum">2</div>
                        <div>/</div>
                        <div class="finalMemberNum">4</div>
                        <p></p>
                        </div>
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="board_tail">
                            <div><span class="fas fa-eye"></span>VIEWS</div>
                            <div><span class="fas fa-comment-dots"></span>댓글</div>
                        </div>
                    </div>
                </li>
                <li class="board_list">
                    <div class="board_grid">
                        <div class="board_head">
                           <div class="mate_board_writer">
                            <button type="button" value=""><i class="fa-solid fa-piggy-bank"></i>￦3500 </button>
                            작성자(닉네임)
                        	</div>
                            <div>WRITE_DT</div>
							<button type=button value="recruiting" >모집중</button>
                        </div>
                        
                        <div id="mate_board_container1">
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="fas fa-paperclip"></div>
                        
                        </div>
                        
                        <div id="mate_board_container2">
                        <div class="mate_board_maps"><i class="fa-solid fa-location-dot"></i>롯데마트 송파점</div>
                    	<div id="mate_board_contents_dt_and_members">
                        <div class="mate_board_contents_dt"><i class="fa-regular fa-clock"></i>&nbsp;만남 예정 시간</div>
                        <div class="mate_board_contents_members"><i class="fa-solid fa-people-group"></i></div>
                        <div class="currentMemberNum">2</div>
                        <div>/</div>
                        <div class="finalMemberNum">4</div>
                        <p></p>
                        </div>
                        <div class="board_title"><a href="QnaBoardRead.html">TITLE</a></div>
                        <div class="board_tail">
                            <div><span class="fas fa-eye"></span>VIEWS</div>
                            <div><span class="fas fa-comment-dots"></span>댓글</div>
                        </div>
                    </div>
                </li>
               
                
            </ul>


            <form action="" method="POST">

                <div id="board_search">
                    <button type="button"><span class="fas fa-arrow-down-wide-short" />최신순</button>
                    <div>
                        <select name="검색">
                            <option value="">제목 +  내용</option>
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">작성자</option>
                        </select>
                        <input type="text">
                        <button type="submit">검색</button>
                    </div>
                    <a href="BoardWrite.html"><button type="button"><span class="fas fa-pen-to-square" />글쓰기</button></a>
                </div>
            </form>

            <div id="move_page">
                <div><span class="fas fa-arrow-left-long"/>&nbsp;이전</div>
                <div>1 &nbsp; 2 &nbsp; 3 &nbsp; 4 &nbsp; 5 &nbsp; ... &nbsp; 12345</div>
                <div>다음&nbsp;<span class="fas fa-arrow-right-long"/></div>
            </div>

        </article>



        <!--*********************************************메인 내용은 여기까지*********************************************-->
    </main>
       <jsp:include page="/Woojung_JSP/footer.jsp" flush="true" />
</body>


</html>

