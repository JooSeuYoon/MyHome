<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.user" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">

    <title>MyHome Join</title>
</head>
<body>
    <% if(user.getUserID()==null || user.getUserPassword()==null
        || user.getUserName()==null || user.getUserEmail()==null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력 하지 않은 항목이 존재합니다.')");
        script.println("history.back()");
        script.println("</script>");
        }else{
        UserDAO userDAO = new UserDAO();
        int result = userDAO.join(user);

        if(result==-1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디 입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }
        else{
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('회원가입 성공하였습니다.')");
            script.println("location.href = 'index.jsp'");
            script.println("</script>");
        }
    }
    %>

</body>
</html>
