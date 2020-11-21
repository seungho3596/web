<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="loginstyle.css">
    </head>
    <body>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                </div>
                <!--<div class="social-icons">
                    <img src="img/fb.png" alt="facebook">
                    <img src="img/tw.png" alt="twitter">
                    <img src="img/gl.png" alt="google">
                </div>-->
                <%
                Cookie[] c = request.getCookies();
                if (c != null) {
                	for (Cookie cf : c) {
                		if (cf.getName().equals("id")) {
                			response.sendRedirect("sessionMain.jsp");
                		}
                	}
                }
                %>
                <form id="login" action="authentication.jsp" class="input-group" method="post">
                    <input name="id" type="text" class="input-field" placeholder="User name or Email" required>
                    <input name="pw" type="password" class="input-field" placeholder="Enter Password" required>
                    <input name="loginChk" type="checkbox" class="checkbox" value="true"><span>로그인 상태 유지</span>
                    <button class="submit">Login</button>
                </form>
                <form id="register" action="authentication.jsp" class="input-group" method="post">
                    <input type="text" class="input-field" placeholder="User name or Email" required>
                    <input type="email" class="input-field" placeholder="Your Email" required>
                    <input type="password" class="input-field" placeholder="Enter Password" required>
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit">REGISTER</button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");


            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
    </body>
</html>
