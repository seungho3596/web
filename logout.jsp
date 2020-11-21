<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
</head>
<body>
<%
session.invalidate(); // 세션 초기화

// 로그인 유지 쿠키 삭제
Cookie[] c = request.getCookies();
if (c != null) {
	for (Cookie cf : c) {
		if (cf.getName().equals("id")) {
			cf.setMaxAge(0);
			cf.setPath("/");
			response.addCookie(cf);
		}
	}
}

%>
<script>
alert("로그아웃 되었습니다.");
location.href='index.html';
</script>
</body>
</html>
