<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>무한스크롤 예제</title>
  <style>
    html, body{ margin: 0; }
    h1 {position: fixed; top: 0; width: 100%; height: 60px; text-align: center; background: white; margin: 0; line-height: 60px;}
    section .box {height: 500px; background: tomato;}
    section .box p {margin: 0; color: white; padding: 80px 20px;}
    section .box:nth-child(2n) {background: teal;}
  </style>
</head>
<body>         
  <h1>무한스크롤</h1>
  <section>
    <div class="box">
      <p>
        1번째 블록
      </p>
    </div>
    <div class="box">
      <p>
        2번째 블록
      </p>
    </div>
  </section>
  <script>
    var count = 2;
    window.onscroll = function(e) {
      //console.log(window.innerHeight , window.scrollY,document.body.offsetHeight)
      if((window.innerHeight + window.scrollY) >= document.body.offsetHeight * 0.8) { 
        setTimeout(function(){
          var addContent = document.createElement("div");
          addContent.classList.add("box");
          
          
          addContent.innerHTML = `<p>${++count}번째 블록</p>`
          
          
          
          document.querySelector('section').appendChild(addContent);
        }, 1000)  
      }
    }
  </script>
</body>
</html>