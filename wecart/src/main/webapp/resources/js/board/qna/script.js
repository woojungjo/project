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

const commant = document.querySelector(".board_commant_commant_write");

document.querySelector(".board_commant_commant").onclick = function() {
  const style = window.getComputedStyle(commant);
  if (style.display === "none") {
    commant.style.display = "block";
  } else {
    commant.style.display = "none";
  }
};

const commant_ud = document.querySelector(".board_commant_ud");

document.querySelector(".fas.fa-bars").onclick = function() {
  const style = window.getComputedStyle(commant_ud);
  if (style.display === "none") {
    commant_ud.style.display = "block";
  } else {
    commant_ud.style.display = "none";
  }
};


const icon = document.querySelector('.board_commant_write_footer > .fas.fa-lock');


icon.onclick = function() {
  icon.classList.toggle('fa-lock');
  icon.classList.toggle('fa-unlock');
};


var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
         oAppRef: oEditors,
         elPlaceHolder: document.getElementById("ir1"),
         sSkinURI: "wecart/src/main/webapp/WEB-INF/views/board/smarteditor/SmartEditor2Skin.html",
         fCreator: "createSEditor2"
        });


