<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>
<jsp:useBean id="bbs" class="bbs.bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<%
    System.out.println(bbs);
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>MyHome 글쓰기</title>
</head>
<body>
<%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }

        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } else {
            if(bbs.getBbsTitle()==null||bbs.getBbsContent()==null){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력 하지 않은 항목이 존재합니다.')");
                script.println("history.back()");
                script.println("</script>");
            }else{
                BbsDAO BbsDAO = new BbsDAO();
                int result = BbsDAO.write(bbs.getBbsTitle(),userID,bbs.getBbsContent());
                if(result==-1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패하였습니다.");
                    script.println("history.back()");
                    script.println("</script>");
                }else {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href='bbs.jsp'");
                    script.println("</script>");
                }
            }
        }
        %>
</body>
</html>
