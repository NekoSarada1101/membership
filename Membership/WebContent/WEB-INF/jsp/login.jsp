<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/form.css">
</head>
<body class="container shadow">
<%
    String error = (String) session.getAttribute("loginFailed");
    session.invalidate(); //エラー文が表示された後再びここに訪問した際にエラー文が表示されないようにする
    if (error == null) {
        error = "";
    }
%>

<article>
    <form action="Login" method="post" id="form" onsubmit="return savePassword()">
        <div class="top shadow"><h1>Login</h1></div>
        <div class="loginError"><%=error%>
        </div>
        <div class="group col-8">
            <h4>Name</h4>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="name" placeholder="Name" required>
            </div>
        </div>
        <div class="group col-8">
            <h4>Password</h4>
            <div class="input-group input-group-lg">
                <input type="password" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="password" placeholder="Password" id="password"
                       required>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="password_save_flg">
                <label class="form-check-label" for="exampleCheck1">パスワードを保存</label>
            </div>
        </div>
        <p><input type="submit" value="Enter" class="btn btn-primary shadow"></p>
    </form>

    <script src="js/login.js"></script>

    <%@include file="/WEB-INF/jsp/footer.jsp" %>
</article>

</body>
</html>
