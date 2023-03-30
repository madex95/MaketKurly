<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<title>List View</title>
</head>
<body>

<c:forEach items="${Alllist}" var="all">
<p><c:out value="${all.ID}"/></p>
</c:forEach>

<p><c:out value="${Alllist}" /></p>
 
</body>
</html>
