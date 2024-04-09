<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>admin table</h1>
	<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">이메일 </th>
				<th bgcolor="orange" width="200">이름</th>
				<th bgcolor="orange" width="150">비밀번호</th>
				<th bgcolor="orange" width="150">날짜</th>
				<th bgcolor="orange" width="100">관리자</th>
			</tr>

	<c:forEach items="${membersList}" var="members">
			<tr>
				<td>${members.name}</td>
				<td>${members.email}</td>
				<td>${members.password}</td>
				<td>${members.join_date}</td>
				<td>${members.admin}</td>
			</tr>
	</c:forEach>
		</table>
</body>
</html>