<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width" initial-scale="1">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="css/custom.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
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

            <button type="button" class="navbar-toggler"

                    data-toggle="collapse" data-target="#navbarSupportedContent"

                    aria-expaned="false" aria-label="Toggle navigation">

                <span class="navbar-toggler-icon"></span>

            </button>

            <a class="navbar-brand" href="main.jsp">JSP 게시판</a>

        </div>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="nav navbar-nav">

                <li><a href="main.jsp">메인</a></li>
                <li><a href="bookstory.jsp">책 후기</a></li>
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



    </nav>

    <div class="container">
        <div class="jumbotron">
            <h1>책 이야기</h1>
            <p>책과 관련된 자유로운 이야기를 펼치세요</p>
            <a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a>
        </div>
    </div>
</body>
</html>
