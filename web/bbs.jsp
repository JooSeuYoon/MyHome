<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.util.ArrayList" %>
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

    <title>MyHome 게시판</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String)session.getAttribute("userID");
        }

        int pageNumber = 1;

        if(request.getParameter("pageNumber")!=null){
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
            <table class="table table-striped" style="text-align: center;border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        BbsDAO bbsDAO = new BbsDAO();
                        ArrayList<bbs> list = bbsDAO.getList(pageNumber);
                        for(int i = 0;i<list.size();i++){
                    %>
                    <tr>
                        <td><%=list.get(i).getBbsID()%></td>
                        <td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>
                        <td><%=list.get(i).getUserID()%></td>
                        <td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+ "시" +
                        list.get(i).getBbsDate().substring(14,16) + "분"%></td>
                    </tr>
                <%
                    }
                %>
                </tbody>

                <%
                    if(pageNumber != 1){
                %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber-1%>"
                   class="btn btn-success btn-arrow-left">이전</a>
                <%
                    }
                    if(bbsDAO.nextPage(pageNumber+1)){
                %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber+1%>"
                   class="btn btn-success btn-arrow-left">다음</a>
                <%
                    }
                %>
            </table>
            <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
        </div>
    </div>

</body>
</html>
