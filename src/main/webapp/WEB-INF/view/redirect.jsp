<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<html>
<head>
    <title>알림창</title>
    <link rel="icon" type="image/png" href="https://res.kurly.com/images/marketkurly/logo/ico_16.png">
</head>
<body>
<script>
var url = "${url}";

alert('${msg}');
if(url=="back") history.back();
else location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';  
</script>
</body>
</html>