<%--
  Created by IntelliJ IDEA.
  User: ajana
  Date: 2020-07-20
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" conten="text/html; charset=UTF-8">
    <title>JSP LogOut</title>
</head>
<body>

    <script>
        var lc = confirm('로그아웃 하시겠습니까?');
        if(lc){
            <%
                session.invalidate();
            %>
            alert('로그아웃 되었습니다.');
            location.href='main.jsp';
        }else{
            history.back();
        }
    </script>
</body>
</html>
