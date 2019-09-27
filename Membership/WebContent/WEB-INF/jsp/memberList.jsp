<%@ page import="model.MemberBean" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    List<MemberBean> list = (List<MemberBean>) session.getAttribute("memberlist");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>会員一覧</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/list.css">
</head>
<body class="container shadow">
<article>
    <div class="top shadow"><h1>Member List</h1></div>
    <div class="list">
        <table class="table table-hover">
            <thead>
            <tr>
                <th scope="col">会員名</th>
                <th scope="col">会員住所</th>
            </tr>
            </thead>

            <tbody>
            <% for (MemberBean bean : list) { %>
            <tr>
                <td><%=bean.getName() %>
                </td>
                <td><%=bean.getAddr() %>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <form action="Index" method="get">
        <p><input type="submit" value="戻る" class="btn btn-primary shadow"></p>
    </form>

    <%@include file="/WEB-INF/jsp/footer.jsp" %>
</article>

</body>
</html>
