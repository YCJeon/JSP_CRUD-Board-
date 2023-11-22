<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jsp_crud.BoardDAO, com.example.jsp_crud.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
	body {
		font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		padding: 20px;
	}
	h1 {
		color: #333333;
	}
	#list {
		border-collapse: collapse;
		width: 100%;
		margin-top: 20px;
	}
	#list td, #list th {
		border: 1px solid #ddd;
		padding: 8px;
		text-align: center;
	}
	#list tr:nth-child(even) {
		background-color: #f2f2f2;
	}
	#list tr:hover {
		background-color: #ddd;
	}
	#list th {
		padding-top: 12px;
		padding-bottom: 12px;
		background-color: #5f5959;
		color: white;
	}
	#add_post{
		padding: 5px 10px;
		background-color: #cccccc;
		border: none;
		color: #ffffff;
		cursor: pointer;
	}
	#add_post:hover {
		background-color: #999999;
	}
	.btn-edit, .btn-delete {
		padding: 5px 10px;
		background-color: #ab542e;
		border: none;
		color: white;
		text-decoration: none;
	}
	.btn-delete {
		background-color: #ff0000;
	}
	.btn-edit:hover, .btn-delete:hover {
		background-color: #ab542e;
	}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<h1>자유게시판</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>Id</th>
	<th>Title</th>
	<th>Writer</th>
	<th>Category</th>
	<th>Content</th>
	<th>Regdate</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSeq()}</td>
		<td><a href="view.jsp?id=${u.getSeq()}">${u.getTitle()}</a></td>
		<td>${u.getWriter()}</td>
		<td>${u.getCategory()}</td>
		<td>${u.getContent()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
	</tr>
</c:forEach>
</table>
<br/><a id="add_post" href="addpostform.jsp">Add New Post</a>
</body>
</html>