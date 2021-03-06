<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page import="reply.reply"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="java.util.ArrayList" %>
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
    <title>MyHome 글 보기</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String)session.getAttribute("userID");
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

    <div class="container">
        <div class="row">
            <table class="table " >
                <thead>
                    <tr>
                        <th colspan="3" style="background-color: #eeeeee; text-align: center"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><h4><%=bbs.getBbsTitle()%></h4></td>
                    </tr>
                    <tr>
                        <td><%=bbs.getUserID()%> | <%=bbs.getBbsDate()%></td>
                    </tr>
                    <tr>
                        <td style="min-height: 200px; text-align: left; padding-top: 30px;padding-bottom: 100px;"><h5><%=bbs.getBbsContent()%></h5></td>
                    </tr>
                </tbody>
            </table>
            <%
                if(userID!=null&&userID.equals(bbs.getUserID())){
            %>
            <a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-secondary mr-1 mb-2">글 수정</a>
            <a onclick="return confirm('삭제하시겠습니까?')" href="delete.jsp?bbsID=<%=bbsID%>" class="btn btn-danger mr-1 mb-2">글 삭제</a>
            <%
                }
            %>
        </div>
    </div>

    <%
        if(userID!=null){
    %>

    <div class="container">
        <div class="row">
            <table class="table" style="border: 1px solid #dddddd">
                <tbody>
                <form method="post" action="replywriteAction.jsp">
                    <tr>
                        <td><%=userID%></td>
                        <td>
                            <div class="form-group row">
                                <input type="text" class="form-control" name="replyContent" placeholder="댓글 작성" maxlength="100"/>
                                <input type="hidden" name="bbsID" value="<%=bbs.getBbsID()%>">
                            </div>
                        </td>
                        <td> <button type="submit" class="btn btn-primary">작성</button></td>
                        <td> <a href="javascript:window.location.reload(true)" class="btn btn-secondary">댓로고침</a> </td>
                    </tr>
                </form>
                </tbody>
            </table>
        </div>
    </div>

    <%
        }

        ReplyDAO rDAO = new ReplyDAO();
        ArrayList<reply> list = rDAO.getList(bbsID);

        if(list.size()!=0){
    %>

    <div class="container">
        <div class = "row">
            <table class="table" style="border: 1px solid #dddddd">
                <tbody>
                    <%
                        for(int i=0;i<list.size();i++){
                    %>
                    <tr>
                        <td style="width: 15%"><%=list.get(i).getUserID()%></td>
                        <td style="width: 15%"><%=list.get(i).getReplyDate().substring(2,16)%></td>
                        <td style="width: 50%"><%=list.get(i).getReplyContent()%></td>
                        <%
                            if(userID!=null){
                        %>
                        <td style="width: 20%"><a onclick="return confirm('삭제하시겠습니까?')" href="replydeleteAction.jsp?replyID=<%=list.get(i).getReplyID()%>" class="btn btn-danger">삭제</a> </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <%
        }
    %>

    <div class = "container">
        <div class = "row">
            <a href="bbs.jsp" class="btn btn-primary">글 목록</a>
        </div>
    </div>

</body>
</html>
