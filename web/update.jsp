<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width" initial-scale="1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <title>MyHome 글 수정</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }

        if(userID==null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 이후에 글 수정이 가능합니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }

        int bbsID = 0;
        if(request.getParameter("bbsID")!=null){
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
        if(bbsID == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다.')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
        }
        bbs bbs = new BbsDAO().getbbs(bbsID);
        if(!userID.equals(bbs.getUserID())){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 존재하지 않습니다.')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
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
        <div class="row">
            <form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
                <table class="table table-striped" style="text-align: center; border:1px solid #dddddd">
                    <thead>
                        <tr>
                            <th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" max="50" value="<%=bbs.getBbsTitle()%>"></td>
                        </tr>
                        <tr>
                            <td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent()%></textarea> </td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-primary pull-right">글 수정</button>
            </form>
        </div>
    </div>
</body>
</html>
