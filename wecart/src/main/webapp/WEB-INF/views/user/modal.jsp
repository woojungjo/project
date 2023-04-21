<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 모달 창 스타일 */
        .modal {
          display: none;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: auto;
          background-color: rgba(0,0,0,0.4);
        }
        
        .modal-content {
          background-color: #fefefe;
          margin: 15% auto;
          padding: 20px;
          border: 1px solid #888;
          width: 80%;
        }
        
        .close {
          color: #aaa;
          float: right;
          font-size: 28px;
          font-weight: bold;
        }
        
        /* 모달 창 열기 버튼 스타일 */
        .open-button {
          background-color: #4CAF50;
          color: white;
          padding: 10px 15px;
          border: none;
          cursor: pointer;
          opacity: 0.8;
          position: fixed;
          bottom: 23px;
          right: 28px;
          width: 200px;
          font-size: 18px;
        }
        
        .open-button:hover {
          opacity: 1;
        }
      </style>
    </head>
    <body>
      
      <!-- 모달 창 버튼 -->
      <button class="open-button" onclick="openModal()">모달 창 열기</button>
      
      <!-- 모달 창 -->
      <div id="myModal" class="modal">
        <div class="modal-content">
          <span class="close" onclick="closeModal()">&times;</span>
          <p>이것은 모달 창입니다.</p>
        </div>
      </div>
      
      <!-- 자바스크립트 -->
      <script>
        // 모달 창 열기 함수
        function openModal() {
          document.getElementById("myModal").style.display = "block";
        }
        
        // 모달 창 닫기 함수
        function closeModal() {
          document.getElementById("myModal").style.display = "none";
        }
      </script>
      
    </body>
    </html>