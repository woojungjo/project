
/*
var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
         oAppRef: oEditors,
         elPlaceHolder: document.getElementById("ir1"),
         sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
         fCreator: "createSEditor2"
        });
        
 */
 var oEditors = [];
 
$(function(){
	 console.log("NAVER SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",  
          fCreator: "createSEditor2",
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
              }
          }, 
          /*
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
          },
          */
      });
      
      //버튼 클릭시 form 전송
     $("#registerBtn").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          let content = document.getElementById("ir1").value
          
		    if(content == '<p><br></p>') { //비어있어도 기본 P태그가 붙더라.
		        alert("내용을 입력해주세요.")
		        oEditors.getById["ir1"].exec("FOCUS")
		        return
		    } else {
		        console.log(content)
		      	let writePost = {
	            title: $("#smartEditorTitle").val()
	            ,content: content
       			 }
       			let test = JSON.stringify(writePost);
       			console.log(writePost)
       			        //ajax 통신으로 서버로 보내 데이터 저장함
		        $.ajax({
		            url: "register"
		            , data: test
		            , type: 'POST'
		            ,contentType: 'application/json', 
		            success: function(data) {
		                console.log('success')
		                alert('저장되었습니다.')
		                //location.href='board/register'
		            }
		            , error: function(jqXHR, textStatus, errorThrown) {
		                console.log(jqXHR)
		                alert('오류가 발생하였습니다.')
		            }
		        })
		    }
    
          $("#register").submit();
      });    
});
 
 