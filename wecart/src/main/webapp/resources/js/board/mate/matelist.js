var listBtn = document.querySelector('#listBtn');
listBtn.addEventListener('click', function(){
  location.href='/board/mate/matelist';
  //?currPage=${param.currPage}&amount=${param.amount}
});

/*
var listBtn = document.querySelector('#listBtn');

listBtn.addEventListener('click', function () {
    var url = '/board/mate/matelist?currPage=' + encodeURIComponent('${param.currPage}');
    location.href = url
});
            */
var mateDeleteBtn = document.querySelector('.mate_board_delete');

/*

var mateModifyBtn = document.querySelector('.mate_board_modify');
var mateListBtn = document.querySelector('.mate_board_list');
mateListBtn.addEventListener('click', function(){
	location.href='/board/mate/matelist?currPage=${param.currPage}&amount=${param.amount}';
    /*var url = '/board/mate/matelist?currPage=' + encodeURIComponent('${param.currPage}') + '&amount=' + encodeURIComponent('${param.amount}');
    location.href = url;
});
*/
/*
mateListBtn.addEventListener('click', function(){
    location.href='/board/mate/matelist?currPage=${param.currPage}&amount=${param.amount}';
});//.addEventListener



mateListBtn.addEventListener('click', function(){
    var url = encodeURIComponent("?currPage=${param.currPage}&amount=${param.amount}");
    location.href=url;
});//.addEventListener
*/


//수정하기!!!!!!
mateDeleteBtn.addEventListener('click', function(){
    //Form 태그 조작해서 삭제 요청 전송 
    var form =document.querySelector('form');
    
    form.setAttribute('method', 'POST');
    form.setAttribute('action', '/board/mate/mateDelete');
    form.submit();
});//.addEventListener

