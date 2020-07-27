<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width" initial-scale="1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <link rel="stylesheet" href="css/custom.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <title>MyHome</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
    %>

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

        <%
            if(userID==null){
        %>
        <ul class="nav navbar-nav navbar-right">

            <ul class="nav navbar-nav">

                <li><a href="login.jsp">로그인</a></li>

                <li><a href="join.jsp">회원가입</a></li>

            </ul>

        </ul>
        <%
            } else {
        %>
        <ul class="nav navbar-nav navbar-right">

            <ul class="nav navbar-nav">

                <li><a href="logoutAction.jsp">로그아웃</a></li>

            </ul>

        </ul>
        <%
            }
        %>

    </div>

</nav>

    <div class="container">
        <div class="jumbotron">
            <h1>웹사이트 소개</h1>
            <p>이 웹 사이트는 부트스트랩으로 만든 JSP 웹 사이트입니다. </p>
            <a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a>
        </div>
    </div>
</body>
</html>
