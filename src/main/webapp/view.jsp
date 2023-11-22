<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.jsp_crud.BoardDAO, com.example.jsp_crud.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>View Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      padding: 20px;
    }
    h1 {
      color: #333333;
    }
    table {
      width: 50%;
      margin-top: 20px;
      border-collapse: collapse;
    }
    th, td {
      padding: 10px;
      border: 1px solid #cccccc;
    }
    th {
      background-color: #f2f2f2;
    }
    input[type="button"] {
      padding: 5px 10px;
      background-color: #cccccc;
      border: none;
      color: #ffffff;
      cursor: pointer;
    }
    input[type="button"]:hover {
      background-color: #999999;
    }
  </style>
</head>
<body>

<%
  BoardDAO boardDAO = new BoardDAO();
  String j=request.getParameter("id");
  BoardVO u=boardDAO.getBoard(Integer.parseInt(j));
%>

<h1>View Page</h1>
<table>
  <tr><td>Regdate:</td><td><%= u.getRegdate()%></td></tr>
  <tr><td>Title:</td><td><%= u.getTitle()%></td></tr>
  <tr><td>Writer:</td><td><%= u.getWriter()%></td></tr>
  <tr><td>Category:</td><td><%= u.getCategory()%></td></tr>
  <tr><td>Content:</td><td><%= u.getContent()%></td></tr>
  <tr><td colspan="2"><input type="button" value="BACK" onclick="history.back()"/></td></tr>
</table>

</body>
</html>