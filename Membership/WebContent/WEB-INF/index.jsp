<%@ page import="model.MemberBean" %>
<%@ page import="model.LoginBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body class="container shadow">
<%
    LoginBean loginBean = (LoginBean) session.getAttribute("loginBean");
    String name = "ゲスト";
    if (loginBean != null) {
        name = loginBean.getName();
    }
%>

<article>
    <div><h1>ようこそ<%=name%>さん</h1></div>
    <form action="Login" method="get">
        <input type="submit" value="ログイン" class="btn btn-primary shadow">
    </form>

    <form action="Register" method="get">
        <input type="submit" value="会員登録" class="btn btn-success shadow">
    </form>

    <form action="Selector" method="post">
        <input type="submit" value="会員一覧" class="btn btn-info shadow">
    </form>

    <%if (!name.equals("ゲスト")) {%>
    <form action="Logout" method="post">
        <input type="submit" value="ログアウト" class="btn btn-secondary shadow">
    </form>
    <%}%>

    <%@include file="/WEB-INF/jsp/footer.jsp" %>
</article>
</body>
</html>
