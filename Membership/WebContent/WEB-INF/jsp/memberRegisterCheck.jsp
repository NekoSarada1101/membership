<%@ page import="model.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登録確認</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/list.css">
</head>
<body class="container shadow">
<%
    MemberBean memberBean = (MemberBean) session.getAttribute("memberBean");
    int count = memberBean.getPassword().length();
    String hidden_pass = "";
    for (int i = 0; i < count; i++) {
        hidden_pass += "*";
    }
%>

<article>
    <div class="top shadow"><h1>登録内容の確認</h1></div>
    <table class="table">
        <tbody>
        <tr>
            <th>ID</th>
            <td><%=memberBean.getId()%>
            </td>
        </tr>
        <tr>
            <th>Name</th>
            <td><%=memberBean.getName()%>
            </td>
        </tr>
        <tr>
            <th>Phone Address</th>
            <td><%=memberBean.getPhone_addr()%>
            </td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%=memberBean.getAddr()%>
            </td>
        </tr>
        <tr>
            <th>Authority</th>
            <td><%=memberBean.getAuth()%>
            </td>
        </tr>
        <tr>
            <th>Password</th>
            <td><%=hidden_pass%>
            </td>
        </tr>
        </tbody>
    </table>

    <form action="Comp" method="post">
        <input type="submit" value="登録">
    </form>
    <form action="Register" method="get">
        <input type="submit" value="修正">
    </form>

</article>
</body>
</html>
