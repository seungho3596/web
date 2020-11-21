<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 목록</title>
</head>
<center>
    <body>
        <!-- 세션을로 지정한값을 불러온다 -->
        <%
            String name = (String) session.getAttribute("id") + "의 장바구니";
        %>

        <%=name%>
        <%
        Cookie[] c = request.getCookies();
        if (c != null) {
        	for (Cookie cf : c) {
        		if (cf.getName().equals("id")){
        			String ids = cf.getValue();
        			session.setAttribute("id", ids);
        		}
        	}
        }

        // 세션값 가져오기
        String id = (String) session.getAttribute("id"); // Object 타입이므로 다운캐스팅
        %>

        <h2>선택한 목록</h2>
        <hr>
        <!--  porductList에 값이 없다면 업다는 말이 나오고 있다면 porductList 의 값을 보여주라 -->
        <%
            if (session.getAttribute("productList") == null)
                out.println(session.getAttribute("id") + "  선택한 목록이 없습니다");
            else
                out.println(session.getAttribute("productList"));
        %>
        <hr>
          <input type="button" onclick="location.href='index.html'" value="LogOut" />
        <!-- 세션을 삭제 할수있는 코드가 있는데로 넘어 가는 코드 -->
        <!-- 이 코드를 만든이유 -->
        <!--<form action="5delete.jsp">
            <input type="submit" value="로그아웃" name="longout"
                onclick="window.location.reload()"> <a
                href="javascript:history.back()">뒤로 가기</a>
        </form>-->
    </body>
</center>

</html>
