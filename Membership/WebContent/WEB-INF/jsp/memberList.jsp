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
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<article>
    <table>
        <tr>
            <th>会員名</th>
            <th>会員住所</th>
        </tr>
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
    </table>
</article>

</body>
</html>
