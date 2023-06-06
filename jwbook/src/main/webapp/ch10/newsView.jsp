<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<title>방명록 관리 앱</title>
</head>
   <body>
   <div class="container w-75 mt-5 mx-auto">
   <style>
    table {
    border-collapse: collapse;
  }

  th, td {
    border: 1px solid black;
    padding: 8px;
  }
    thead {
    background-color: lightgray;
  }
   .text-center {
    text-align: center;
  }
  .green-text {
    color: green;
  }
  
  </style>
 <div class="text-center">
    <h2>방명록 등록</h2>
    <hr>
    <div class="card w-75 mx-auto">
	    <div class="card-body">

	    <table class="green-text">
		<thead>
  		<tr>
    	<th>작성자</th>
    	<th><input type="text" name="name" /></th>
  		</tr>
  		</thead>
  		<tr>
  		<th>이메일</th>
    	<th><input type="email" name="name" /></th>
  		</tr>
  		<tr>
  		<th>제목</th>
    	<th><input type="title" name="name" /></th>
  		</tr>
  		<tr>
  		<th>비밀번호</th>
    	<th><input type="text" name="name" /></th>
  		</tr>
  		</table>
  		<br>
  		<textarea cols="40" rows="10"class="form-control"></textarea>
	    </div>
    </div>
    <br>
     <button type="submit" class="btn btn-success mt-3">등록</button>
     <button type="button" class="btn btn-danger mt-3" onclick="clearForm()">취소</button>
     <a href="javascript:history.back()" class="btn btn-primary mt-3"><< Back</a>
    
    </div>
    </div>
    </body>
</html>