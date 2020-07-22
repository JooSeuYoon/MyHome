<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset = UTF-8>
    <meta name = "viewport" content="width=device-width" initial-scale = "1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <title>MyHome Join</title>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>


</head>
<body>
    <nav class="navbar navbar-default">

        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed"

                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

                    aria-expaned="false">

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

                <span class="icon-bar"></span>

            </button>

            <a class="navbar-brand" href="main.jsp">JSP 게시판</a>

        </div>

        <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">

            <ul class="nav navbar-nav">

                <li><a href="main.jsp">메인</a></li>

                <li><a href="bbs.jsp">게시판</a></li>

            </ul>

            <ul class="nav navbar-nav navbar-right">

                <ul class="nav navbar-nav">

                    <li><a href="login.jsp">로그인</a></li>

                    <li><a href="join.jsp">회원가입</a></li>

                </ul>

            </ul>

        </div>

    </nav>

    <div class="container">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="jumbotron" style="padding-top: 20px;">
                <form method="post" action="joinAction.jsp">
                    <h3 style="text-align: center;">회원가입</h3>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="10">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
                    </div>

                    <input type="submit" class="btn btn-primary form-control" value="회원가입">
                </form>
            </div>
        </div>
    </div>
</body>
</html>