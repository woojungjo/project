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

// const commantForm = document.querySelectorAll(".board_commant_commant_write");
// const commantBtn = document.querySelectorAll(".board_commant_commant");

// for (let i = 0 ; i < commantForm.length; i++) {
//   commantBtn[i].addEventListener('click', function() {
//     const style = window.getComputedStyle(commantForm[i]);
//     if (style.display === "none") {
//       commantForm[i].style.display = "block";
//     } else {
//       commantForm[i].style.display = "none";
//     }  
//   });
// }
document.body.addEventListener('click', function(event) {
  if (event.target.classList.contains('board_commant_commant')) {
    const commentForm = event.target.parentElement.parentElement.nextElementSibling.nextElementSibling;
    commentForm.classList.toggle('hidden');
  }
});



const commant_ud = document.querySelectorAll(".board_commant_ud");
const dlBars = document.querySelectorAll(".fas.fa-bars");

for(let i = 0; i < commant_ud.length; i++){
  dlBars[i].addEventListener('click', function() {
    const style = window.getComputedStyle(commant_ud[i]);
    if (style.display === "none") {
      commant_ud[i].style.display = "block";
    } else {
      commant_ud[i].style.display = "none";
    }
  });
}

// const icon = document.querySelectorAll('.board_commant_write_footer > .fas.fa-unlock');
// const commentsecret = document.querySelectorAll('form input[name="seclet_yn"]');

// for(let i = 0; i < icon.length; i ++){
//   icon[i].onclick = function() {
//     if (icon[i].classList.contains('fa-unlock')) {
//       commentsecret[i].value = "1";
//       icon[i].classList.remove('fa-unlock');
//       icon[i].classList.add('fa-lock');
      
//     } else{
//       commentsecret[i].value = "0";
//         icon[i].classList.remove('fa-lock');
//         icon[i].classList.add('fa-unlock');

//       }
// };
// }

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



// var oEditors = [];
//         nhn.husky.EZCreator.createInIFrame({
//          oAppRef: oEditors,
//          elPlaceHolder: document.getElementById("ir1"),
//          sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
//          fCreator: "createSEditor2"
//         });




// $('button.board_commant_submit').on('click', function(event) {
//   console.clear(); console.group("Ajax Request");

//   event.preventDefault(); // 폼 전송을 막음
	
//   var form = $('#comment-form');
//   console.log('1. form:', form);

//   var jsonData = form.serializeJSON();
//   console.log(`2. jsonData:`, jsonData);
//   console.log(`2-1. content: ${jsonData.content}`);

//   var jsonStr = JSON.stringify(jsonData);
//   console.log(`3. jsonStr: ${jsonStr}`);

//   $.ajax({
//     url: '/board/qna/read/commentwrite',
//     type: 'POST',
//     contentType: 'application/json',
//     dataType: 'json',
//     data: jsonStr,

//       success: function(data) {
//         console.info('**** success called back:', data);
//         $(".board_commant").load(location.href + " .board_commant");

//         // DOM tree 조작

//       } // success
//     }); // .ajax

//     console.groupEnd();
// }); // .onclick

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
          url: '/board/qna/read/commentwrite',
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