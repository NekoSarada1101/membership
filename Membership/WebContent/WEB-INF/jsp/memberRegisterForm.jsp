<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新規登録</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/form.css">
</head>
<body class="container shadow">
<%
    String error = (String) session.getAttribute("error");
    if (error == null) {
        error = "";
    }
%>

<article>
    <form action="Check" method="post">
        <div class="top shadow"><h1>Sign up</h1></div>
        <div class="group col-8">
            <h4>ID</h4><span>Only numbers</span><span class="error">　<%=error%></span>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="id" placeholder="1" pattern="[0-9]"
                       title="数字のみで入力してください" autofocus required>
            </div>
        </div>
        <div class="group col-8">
            <h4>Name</h4>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="name" required>
            </div>
        </div>
        <div class="group col-8">
            <h4>Phone Address</h4><span>No hyphen</span>
            <div class="input-group input-group-lg">
                <input type="tel" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="phone_addr" placeholder="00011112222"
                       pattern="^([0-9]{11})$" title="ハイフン無しで入力してください" required>
            </div>
        </div>
        <div class="group col-8">
            <h4>Address</h4><span>Prefectures</span>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="addr" placeholder="東京都" list="prefectures"
                       required>
                <datalist id="prefectures">
                    <option value="北海道">
                    <option value="青森県">
                    <option value="岩手県">
                    <option value="宮城県">
                    <option value="秋田県">
                    <option value="山形県">
                    <option value="福島県">
                    <option value="茨城県">
                    <option value="栃木県">
                    <option value="群馬県">
                    <option value="埼玉県">
                    <option value="千葉県">
                    <option value="東京都">
                    <option value="神奈川県">
                    <option value="新潟県">
                    <option value="富山県">
                    <option value="石川県">
                    <option value="福井県">
                    <option value="山梨県">
                    <option value="長野県">
                    <option value="岐阜県">
                    <option value="静岡県">
                    <option value="愛知県">
                    <option value="三重県">
                    <option value="滋賀県">
                    <option value="京都府">
                    <option value="大阪府">
                    <option value="兵庫県">
                    <option value="奈良県">
                    <option value="和歌山県">
                    <option value="鳥取県">
                    <option value="島根県">
                    <option value="岡山県">
                    <option value="広島県">
                    <option value="山口県">
                    <option value="徳島県">
                    <option value="香川県">
                    <option value="愛媛県">
                    <option value="高知県">
                    <option value="福岡県">
                    <option value="佐賀県">
                    <option value="長崎県">
                    <option value="熊本県">
                    <option value="大分県">
                    <option value="宮崎県">
                    <option value="鹿児島県">
                    <option value="沖縄県">
                </datalist>
            </div>
        </div>
        <div class="group col-8">
            <h4>Authority</h4>
            <div class="input-group input-group-lg">
                <input type="text" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="auth" required>
            </div>
        </div>
        <div class="group col-8">
            <h4>Password</h4><span>6 characters or more and please type using half-width characters  </span>
            <div class="input-group input-group-lg">
                <input type="password" class="form-control" aria-label="Sizing example input"
                       aria-describedby="inputGroup-sizing-lg" name="password" pattern="^([a-zA-Z0-9]{6,})$"
                       title="6字以上の半角英数字で入力してください" required>
            </div>
        </div>

        <p><input type="submit" value="Sign up" class="btn btn-primary shadow"></p>
    </form>

    <%@include file="/WEB-INF/jsp/footer.jsp" %>
</article>
</body>
</html>
