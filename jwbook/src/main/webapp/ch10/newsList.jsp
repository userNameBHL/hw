
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

tbody {
  background-color: #00CED1;
}
</style>
<h2><a href='news.nhn?action=getNews' style="text-decoration: none; color: inherit;">방명록 목록</a></h2>
<table>
  <thead>
    <tr>
      <th>번호</th>
      <th>작성자</th>
      <th>이메일</th>
      <th>날짜</th>
      <th>제목</th>
    </tr>
  </thead>
  <c:forEach var="news" items="${newslist}" varStatus="status">
    <tr>
      <a href="news.nhn?action=getNews&id=${news.aid}">
        <td>[${status.count}]</td></a>
      <td>${news.name}</td>
      <td>${news.email}</td>
      <td>${news.date}</td>
      <td>${news.title}</td>
    </tr>
  </c:forEach>
</table>
<hr>
<c:if test="${error != null}">
  <div class="alert alert-danger alert-dismissible fade show mt-3">
    에러 발생: ${error}
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  </div>
</c:if>
<button class="btn btn-outline-info mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#addForm" aria-expanded="false" aria-controls="addForm">입력</button>
<button class="btn btn-outline-primary mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#editForm" aria-expanded="false" aria-controls="editForm">수정</button>
<button class="btn btn-outline-success mb-3" type="button" onclick="location.href='news.nhn?action=getNews'">등록</button>
<div class="collapse" id="addForm">
  <div class="card card-body">
    <form method="post" action="/jwbook/news.nhn?action=addNews" enctype="multipart/form-data">
      <h2>방명록 입력</h2>
      <label class="form-label">작성자</label>
      <input type="text" name="name" id="name" class="form-control">
      <label class="form-label">이메일</label>
      <input type="text" name="email" id="email" class="form-control">
      <label class="form-label">제목</label>
      <input type="text" name="title" id="title" class="form-control">
      <button type="submit" class="btn btn-success mt-3">입력</button>
      <button type="button" class="btn btn-danger mt-3" onclick="clearForm()">취소</button>
      <button type="button" class="btn btn-primary mt-3" onclick="collapseAddForm()">목록</button>
    </form>
  </div>
</div>

<div class="collapse" id="editForm">
  <div class="card card-body">
    <form method="post" action="/jwbook/news.nhn?action=addNews" enctype="multipart/form-data" id="otherForm">
      <h2>방명록 수정</h2>
      <label class="form-label">작성자</label>
      <input type="text" name="name" id="editName" class="form-control">
      <label class="form-label">이메일</label>
      <input type="text" name="email" id="editEmail" class="form-control">
      <label class="form-label">제목</label>
      <input type="text" name="title" id="editTitle" class="form-control">
      <button type="submit" class="btn btn-success mt-3" onclick="return validateEditForm()">수정</button>
      <button type="button" class="btn btn-danger mt-3" onclick="clearForm()">삭제</button>
      <button type="button" class="btn btn-primary mt-3" onclick="collapseEditForm()">목록</button>
    </form>
  </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function clearForm() {
  document.getElementById("name").value = "";
  document.getElementById("email").value = "";
  document.getElementById("title").value = "";
  document.getElementById("otherForm").reset();
}

function collapseAddForm() {
  $('#addForm').collapse('hide');
}
function collapseEditForm() {
	  $('#editForm').collapse('hide');
	}
function validateForm() {
  var name = document.getElementById("name").value;
  var email = document.getElementById("email").value;
  var title = document.getElementById("title").value;

  if (name === "" || email === "" || title === "") {
    alert("모든 입력란을 채워주세요.");
    return false;
  }
  return true;
}

function validateEditForm() {
  var name = document.getElementById("editName").value;
  var email = document.getElementById("editEmail").value;
  var title = document.getElementById("editTitle").value;

  if (name === "" || email === "" || title === "") {
    alert("모든 입력란을 채워주세요.");
    return false;
  }
  return true;
}

document.getElementById("addForm").addEventListener("submit", function (event) {
  if (!validateForm()) {
    event.preventDefault();
  }
});
</script>
</body>
</html>
