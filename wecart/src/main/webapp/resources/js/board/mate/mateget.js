const bookmarkIcon = document.querySelector('.mate_board_bookMark i');

bookmarkIcon.addEventListener('click', function() {
  bookmarkIcon.classList.toggle('fa-regular');
  bookmarkIcon.classList.toggle('fa-solid');
});

const downloadDiv = document.getElementById("qna_board_attach_download");
const downloadBtn = document.getElementById("download_button");

downloadBtn.onclick = function() {
  const style = window.getComputedStyle(downloadDiv);
  if (style.display === "none") {
    downloadDiv.style.display = "block";
  } else {
    downloadDiv.style.display = "none";
  }
};

/*
const buttons = document.querySelectorAll('.board_change input[type="button"]');

buttons.forEach(function(button) {
  button.addEventListener('click', function() {
    button.style.color = 'white';
    button.style.backgroundColor = '#EB9C5C';
    button.style.border='none';
  });
});
*/

/*
const buttons = document.querySelectorAll('.board_change input[type="button"]');
let activeButton = null;

buttons.forEach(function(button) {
  button.addEventListener('click', function() {
    if (activeButton !== null) {
      activeButton.style.color = '';
      activeButton.style.backgroundColor = '';
     
    }
    
    if (activeButton !== button) {
      button.style.color = 'white';
      button.style.backgroundColor = '#3f4945';
      activeButton = button;
    } else {
      activeButton = null;
    }
  });
});
*/
/*
$(document).ready(function() {
  $('.currentMemberNum').click(function() {
    $('#sub').css('display', 'block');
	$('#sub').toggle();
  });
});
*/
$('.currentMemberNum').mouseenter(function() {
  $('#sub').show(); // hide the dropbox when the mouse leaves
});

$('#sub').mouseleave(function() {
  $('#sub').css('display', 'none'); // hide the #sub element on mouse leave
});

/*
const reportButton = document.querySelector('.mate_board_report');
reportButton.addEventListener('click', () => {
  if (confirm('이 글을 신고하시겠습니까?')) {
    // 예 버튼을 눌렀을 때 처리할 코드
    alert('신고가 접수되었습니다.');
  } else {
    // 아니오 버튼을 눌렀을 때 처리할 코드
    alert('신고가 취소되었습니다.');
  }
});
*/

const reportButton = document.querySelector('.mate_board_report');
reportButton.addEventListener('click', () => {
  swal.fire({
    title: '신고하기',
    text: '이 글을 신고하시겠습니까?',
    icon: 'warning',
    showCancelButton: true,
    /*confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',*/
    confirmButtonColor: 'none',
    confirmButtonText: 'YES',
    cancelButtonText: 'NO',
    customClass: {
      confirmButton: 'custom-confirm-button-class',
      cancelButton: 'custom-cancel-button-class'
    }
  }).then((result) => {

      if (result.isConfirmed) {
		// swal.fire('신고가 접수되었습니다.');
    	// 추가 AJAX 통신 시작
	      $.ajax({
	        type: "POST", // HTTP 요청 방식
	        url: "/board/mate/increaseReportCnt", // 요청 보낼 URL
	        data: { post_no: postNo }, // 요청에 담을 데이터
	        success: function(response) { // 요청에 대한 응답 처리
	          swal.fire('신고가 접수되었습니다.');
	        },
	        error: function(xhr, status, error) { // 에러 처리
	          console.error(xhr.responseText);
	        }
	      });
      } else if (result.dismiss === Swal.DismissReason.cancel) {
        // 아니오 버튼을 눌렀을 때 처리할 코드
        /*alert('신고가 취소되었습니다.');*/
        swal.fire('신고가 취소되었습니다.');
  }
  });
});
 
/* '수정' 버튼 클릭 이벤트 처리
document.querySelector('.mate_board_modify').addEventListener('click', function() {
  // 수정 작업 수행 코드
  
  // 페이지 새로고침
  location.reload();
});
*/
var modifyBtn = document.querySelector('.mate_board_modify');
modifyBtn.addEventListener('click', function(){
  var postNo = this.getAttribute('data-post-no');
  window.location = "/board/mate/matemodify/" + postNo;
});


/* '삭제' 버튼 클릭 이벤트 처리 수정하기 

document.querySelector('.mate_board_delete').addEventListener('click', function() {
  if (confirm('정말 삭제하시겠습니까?')) {
  
    // 삭제 작업 수행 코드

    alert('삭제되었습니다.');	
  }
});//confirm
*/

document.querySelector('.mate_board_delete').addEventListener('click',function(){

  if (confirm("삭제하시겠습니까?")) {
    const form = document.querySelector("#matemodifyDelete");
    form.action = "/board/mate/materemove";
    form.method = "post";
    form.submit();
    alert('삭제되었습니다.');	
  }
})

 	
const subDivs = document.querySelectorAll('#sub > div');
const currentMemberNum = document.querySelector('.currentMemberNum');

currentMemberNum.textContent = subDivs.length;
/*
// 참여하기 버튼을 눌렀을 때
$('.mate_board_contents_join').on('click', function() {
  // 현재 선택된 옵션
  var $selectedOption = $('.mate_board_recruiting_option option:selected');
  // 현재 참여 인원 수
  var current = parseInt($selectedOption.data('current'));
  // 최대 참여 인원 수
  var max = parseInt($selectedOption.data('max'));
  
  // 참여 가능한 경우
  if (current < max) {
    // 참여 인원 수 1 증가
    $selectedOption.data('current', current + 1);
    // 성공 메시지 표시
    alert('참여가 완료되었습니다.');
  }
  // 참여 불가능한 경우
  else {
    // 에러 메시지 표시
    alert('참여인원이 다 찼으므로 참여할 수 없습니다.');
  }
});
*/

$('.mate_board_join_button').click(function() {
    var currentMemberNum = parseInt($('.currentMemberNum').text());
    var finalMemberNum = parseInt($('.finalMemberNum').text());
    var recruitingOption = $('.mate_board_recruiting_option').val();

    if (currentMemberNum === finalMemberNum && recruitingOption === 'completed') {
        alert('참여인원이 다 찼으므로 참여할 수 없습니다.');
    } else if (currentMemberNum < finalMemberNum) {
	 	console.log(currentMemberNum);
        $('#sub').append('<div class="sub' + (currentMemberNum) + '"><li class="sub_participants' + (currentMemberNum) + '">참여자' + (currentMemberNum+1) + ' <span class="sub_waiting">(대기)</span></li></div>');
        currentMemberNum++;
        $('.currentMemberNum').text(currentMemberNum);
        console.log(currentMemberNum);
        alert('대기 목록에 등록되었습니다.');
			 if(currentMemberNum === finalMemberNum){
				  console.log("currentMemberNum is equal to finalMemberNum");
	            $('.mate_board_recruiting_option').val('completed');
	            $('.mate_board_recruiting_option option[value="completed"]').text('참여완료');
	        } else {
	            $('.mate_board_recruiting_option').val('recruiting');
	             $('.mate_board_recruiting_option option[value="recruiting"]').text('모집중');
	        }
    }
});

/*
$('.mate_board_join_button').click(function() {
    var currentMemberNum = parseInt($('.currentMemberNum').text());
    var finalMemberNum = parseInt($('.finalMemberNum').text());
    var recruitingOption = $('.mate_board_recruiting_option').val();

    if (currentMemberNum === finalMemberNum && recruitingOption === 'completed') {
        $('.mate_board_recruiting_option option[value="completed"]').text('참여완료');
        $('.mate_board_recruiting_option').val('completed');
        return; // exit the function if the condition is true
    }

    if (currentMemberNum < finalMemberNum) {
        console.log(currentMemberNum);
        $('#sub').append('<div class="sub' + (currentMemberNum+1) + '"><li><i class="fa-solid fa-piggy-bank"></i>3500</li><li class="sub_participants' + (currentMemberNum+1) + '">참여자' + (currentMemberNum+1) + ' <span class="sub_waiting">(대기)</span></li></div>');
        currentMemberNum++;
        $('.currentMemberNum').text(currentMemberNum + 1);
        console.log(currentMemberNum);
        alert('대기 목록에 등록되었습니다.');

        if(currentMemberNum === finalMemberNum){
            console.log("currentMemberNum is equal to finalMemberNum");
            $('.mate_board_recruiting_option').val('completed');
            $('.mate_board_recruiting_option option[value="completed"]').text('참여완료');
        } else {
            $('.mate_board_recruiting_option').val('recruiting');
            $('.mate_board_recruiting_option option[value="recruiting"]').text('모집중');
        }
    }
});
*/
/*
$('.sub_participants1').click(function() {
  var result = confirm('참여자를 참여시키겠습니까?');
  if (result) {
      $(this).text('참여자A(참여)');
  } else {
       $(this).parent().remove();
       $('.currentMemberNum').text(parseInt($('.currentMemberNum').text())-1);
  }
});
*/


//$('#sub').children('div').has('.sub_waiting').click(function() {
//$('#sub').find('.sub_waiting').click(function() {

$('#sub').on('click', 'div', function() {
if ($(this).find('.sub_waiting').length) {
var result = confirm('참여자를 참여시키겠습니까?');
var currentMemberNum = parseInt($('.currentMemberNum').text());
var finalMemberNum = parseInt($('.finalMemberNum').text());
if (result) {
$(this).find('.sub_waiting').removeClass('sub_waiting').addClass('sub_joint').text('(참여)');

} else {
 $(this).parent().remove();
 $('.currentMemberNum').text(parseInt($('.currentMemberNum').text())-1);
 currentMemberNum--;
 console.log(currentMemberNum);
  		if(currentMemberNum !== finalMemberNum){
			$('.mate_board_recruiting_option').val('recruiting');
            $('.mate_board_recruiting_option option[value="recruiting"]').text('모집중');
        } //if
	}//if-else
}//if
});//function

var currentUrl = window.location.href;

switch (true) {
  case currentUrl.indexOf("RegionBoard") !== -1:
    document.getElementById("region").classList.add("now");
    break;
  case currentUrl.indexOf("UsedBoard") !== -1:
    document.getElementById("used").classList.add("now");
    break;
  case currentUrl.indexOf("MateBoard") !== -1:
    document.getElementById("mate").classList.add("now");
    break;
  case currentUrl.indexOf("CrawlingBoard") !== -1:
    document.getElementById("crawling").classList.add("now");
    break;
  case currentUrl.indexOf("SaleBoard") !== -1:
    document.getElementById("sale").classList.add("now");
    break;
}

var currentUrl = window.location.href;

switch (true) {
  case currentUrl.indexOf("RegionBoard") !== -1:
    document.getElementById("region").classList.add("now");
    break;
  case currentUrl.indexOf("UsedBoard") !== -1:
    document.getElementById("used").classList.add("now");
    break;
  case currentUrl.indexOf("MateBoard") !== -1:
    document.getElementById("mate").classList.add("now");
    break;
  case currentUrl.indexOf("CrawlingBoard") !== -1:
    document.getElementById("crawling").classList.add("now");
    break;
  case currentUrl.indexOf("SaleBoard") !== -1:
    document.getElementById("sale").classList.add("now");
    break;
}

/* comment */
document.body.addEventListener('click', function(event) {
    if (event.target.classList.contains('board_commant_commant')) {
      const commentForm = event.target.parentElement.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
      commentForm.classList.toggle('hidden');
    }
  });
  
  // 확인필요
document.body.addEventListener('click', function(event) {
if (event.target.classList.contains('fa-bars')) {
    const commentUD = event.target.childNodes[1];
    const style = window.getComputedStyle(commentUD);
    if (style.display === "none") {
    commentUD.style.display = "block";
    } else {
    commentUD.style.display = "none";
    }
}
});


document.body.addEventListener('click', function(event) {
    if (event.target.classList.contains('fa-unlock') || event.target.classList.contains('fa-lock')) {
      const commentSecretInput = event.target.parentElement.parentElement.querySelector('form input[name="secret_yn"]');
  
      if (event.target.classList.contains('fa-unlock')) {
        console.log("lock")
        commentSecretInput.value = "1";
        event.target.classList.remove('fa-unlock');
        event.target.classList.add('fa-lock');
      } else {
        console.log("unlock")
        commentSecretInput.value = "0";
        event.target.classList.remove('fa-lock');
        event.target.classList.add('fa-unlock');
      }
    }
  });

  $(function() {
    $('body').on('click', 'button.board_commant_submit', function(event) {
        console.clear(); console.group("Ajax Request");
  
        event.preventDefault(); // 폼 전송을 막음
  
        // var form = $('#comment-form');
        var form = $(this).closest('form');
        console.log('1. form:', form);
  
        var jsonData = form.serializeJSON();
        console.log(`2. jsonData:`, jsonData);
        console.log(`2-1. content: ${jsonData.content}`);
  
        var jsonStr = JSON.stringify(jsonData);
        console.log(`3. jsonStr: ${jsonStr}`);
  
        $.ajax({
            url: '/board/mate/read/commentwrite',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: jsonStr,
  
            success: function(data) {
                console.info('**** success called back:', data);
                $(".board_commant").load(location.href + " .board_commant");
  
                // DOM tree 조작
            } // success
        }); // .ajax
  
        console.groupEnd();
    }); // .onclick
  });

  $(function() {
    $('body').on('click', '.board_comment_delete', function() {
      var comment_no = $(this).siblings('input[name="comment_no"]').val()
  
        $.ajax({
            url: '/board/mate/read/commentdelete',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({comment_no: comment_no}),
  
            success: function() {
                $(".board_commant").load(location.href + " .board_commant");
  
                // DOM tree 조작
            } // success
        }); // .ajax
    }); // .onclick
  });

  $(function() {
    $('body').on('click', 'span.fa-heart', function(event) {
  
      var authID = event.target.previousElementSibling;
      console.log(authID)
      console.log(authID.value)
  
      // var commentWriter = event.target.parentElement.previousElementSibling;
      // console.log(commentWriter)
  
      if(authID.value != ""){
  
      var form = $(this).closest('form');
      console.log(form)
      var jsonData = form.serializeJSON();
      console.log(jsonData)
      var jsonStr = JSON.stringify(jsonData); 
      console.log(jsonStr)
  
        $.ajax({
            url: '/board/mate/read/commentlike',
            type: 'POST',
            contentType: 'application/json',
            data: jsonStr,
  
            success: function() {
                $(".board_commant").load(location.href + " .board_commant");
  
                // DOM tree 조작
            } // success
        }); // .ajax
      } else{
        window.alert('로그인이 필요합니다.');
      }
    }); // .onclick
  });

  $(function() {
    $('body').on('click', '.board_comment_update', function(event) {
  
        const update = event.target.parentElement.parentElement.parentElement.parentElement.parentElement.nextElementSibling;
        update.classList.toggle('hidden');
        
        const removeform = event.target.parentElement.parentElement.parentElement.parentElement.parentElement;
        removeform.classList.toggle('hidden');
  
    }); // .onclick
  });
  
  $(function() {
    $('body').on('click', 'button.board_commant_update', function(event) {
        console.clear(); console.group("Ajax Request");
  
        event.preventDefault(); // 폼 전송을 막음
  
        // var form = $('#comment-form');
        var form = $(this).closest('form');
        console.log('1. form:', form);
  
        var jsonData = form.serializeJSON();
        console.log(`2. jsonData:`, jsonData);
        console.log(`2-1. content: ${jsonData.content}`);
  
        var jsonStr = JSON.stringify(jsonData);
        console.log(`3. jsonStr: ${jsonStr}`);
  
        $.ajax({
            url: '/board/mate/read/commentupdate',
            type: 'POST',
            contentType: 'application/json',
            dataType: 'json',
            data: jsonStr,
  
            success: function(data) {
                console.info('**** success called back:', data);
                $(".board_commant").load(location.href + " .board_commant");
  
                // DOM tree 조작
            } // success
        }); // .ajax
  
        console.groupEnd();
    }); // .onclick
  });
  
