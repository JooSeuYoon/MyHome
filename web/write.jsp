<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width" initial-scale="1">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/custom.css">
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
    %>
    <%
        if(userID!=null){
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="main.jsp">책 이야기</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="main.jsp">메인<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bookstory.jsp">책 이야기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bbs.jsp">자유게시판</a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <%
                    if(userID==null){
                %>
                <li class="nav-item" >
                    <a class="nav-link" href = "join.jsp" >회원가입</a >
                </li>
                <li class="nav-item">
                    <a class="nav-link" href = "login.jsp" >로그인</a >
                </li >
                <%
                }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="logoutAction.jsp">로그아웃</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </nav>

    <form method="post" action="writeAction.jsp">
    <div class="container">
        <div class="row">
                <table class="table table-striped" style="text-align: center;border: 1px solid #dddddd">
                    <thead>
                        <tr>
                            <th colspan="2" style="background-color: #eeeeee;text-align: center;">글쓰기 양식</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
                </div>
        </div>
    </form>
    <%
        }else{
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 이후 글을 작성할 수 있습니다.')");
            script.println("location.href='login.jsp'");
            script.println("</script>");
        }
    %>
</body>
</html>
