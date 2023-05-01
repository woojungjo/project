function showBoardSecret() {
	
    const boardSelect = document.getElementById('boardSelect');
    const boardSecret = document.getElementById('board_secret');

    // value=6 Q&A 
  if (boardSelect.value === '6') {
    boardSecret.style.display = 'block';
  } else {
    boardSecret.style.display = 'none';
  }//if-else

   
    //value=3 mateBoard

  const scriptMap = document.getElementById('mate_board_maps');
  const setMeetingTime = document.getElementById('materegister_setMeetingTime');
  const mateboardmaps = document.querySelector('.map_wrap');

  if (boardSelect.value === '3') {
    scriptMap.style.display = 'block';
    setMeetingTime.style.display='block';
    mateboardmaps.style.display='block';
  } else {
    scriptMap.style.display = 'none';
    setMeetingTime.style.display='none';
    mateboardmaps.style.display='none';
  }//if-else

}//showBoardSecret()

window.onload = function() {
  showBoardSecret(); // call the function when the page is loaded
  var boardSelect = document.getElementById('boardSelect');
  boardSelect.addEventListener('change', showBoardSecret); // call the function when the value of the select element is changed
};//window.onload


//secret_yn

  var checkbox = document.querySelector('#board_secret input[type="checkbox"]');
  var charinput = document.querySelector('#secret_yn');
  
  checkbox.addEventListener('change', function() {
    if (this.checked) {
      charinput.value = "1";
    } else {
      //charinput.value = "0";
    }
  });