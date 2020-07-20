<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.user" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>

<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width" initial-scale="1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <title>MyHome Login</title>

</head>

<body>
    <%
        String userID = null;

        if(session.getAttribute("userID")!=null){
            userID = (String)session.getAttribute("userID");
        }

        if(userID!=null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 상태입니다.')");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }

        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUserID(),user.getUserPassword());
        if(result==1){
            session.setAttribute("userID",user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 되었습니다.')");
            script.println("location.href='main.jsp'");
            script.println("</script>");
        }
        else if(result==0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if(result==-1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else if(result==-2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('데이터베이스 오류가 발생하였습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
    %>
</body>
</html>


