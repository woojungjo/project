const downloadDiv = document.getElementById("sale_board_attach_download");
const downloadBtn = document.getElementById("download_button");

downloadBtn.onclick = function() {
  const style = window.getComputedStyle(downloadDiv);
  if (style.display === "none") {
    downloadDiv.style.display = "block";
  } else {
    downloadDiv.style.display = "none";
  }
};

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
            url: '/board/sale/read/commentwrite',
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
            url: '/board/sale/read/commentdelete',
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
            url: '/board/sale/read/commentlike',
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
            url: '/board/sale/read/commentupdate',
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
    $('body').on('click', 'div.fa-heart', function(event) {
  
      var authID = event.target.parentElement.previousElementSibling;
      console.log(authID)
      console.log(authID.value)
  
      if(authID.value != ""){
  
      var form = $(this).closest('form');
      console.log(form)
      var jsonData = form.serializeJSON();
      console.log(jsonData)
      var jsonStr = JSON.stringify(jsonData); 
      console.log(jsonStr)
  
        $.ajax({
            url: '/board/sale/read/postlike',
            type: 'POST',
            contentType: 'application/json',
            data: jsonStr,
  
            success: function() {
                $(".sale_board_like_hate").load(location.href + " .sale_board_like_hate");
  
                // DOM tree 조작
            } // success
        }); // .ajax
      } else{
        window.alert('로그인이 필요합니다.');
      }
    }); // .onclick
  });

  $(function() {
    $('body').on('click', 'div.fa-heart-crack', function(event) {
  
      var authID = event.target.parentElement.previousElementSibling.previousElementSibling;
      console.log(authID)
      console.log(authID.value)
  
      if(authID.value != ""){
  
      var form = $(this).closest('form');
      console.log(form)
      var jsonData = form.serializeJSON();
      console.log(jsonData)
      var jsonStr = JSON.stringify(jsonData); 
      console.log(jsonStr)
  
        $.ajax({
            url: '/board/sale/read/posthate',
            type: 'POST',
            contentType: 'application/json',
            data: jsonStr,
  
            success: function() {
                $(".sale_board_like_hate").load(location.href + " .sale_board_like_hate");
  
                // DOM tree 조작
            } // success
        }); // .ajax
      } else{
        window.alert('로그인이 필요합니다.');
      }
    }); // .onclick
  });

  document.querySelector('#delete').addEventListener('click',function(){

    if (confirm("삭제하시겠습니까?")) {
      const form = document.querySelector("#updateOrDelete");
      form.action = "/board/sale/delete";
      form.method = "post";
      form.submit();
    }
  })




  