<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.bbs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>MyHome 글 수정</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String)session.getAttribute("userID");
        }

        if(userID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 이후 사용할 수 있습니다.')");
            script.println("location.href='login.jsp'");
            script.println("</script>");
        }

        int bbsID = 0;
        if(request.getParameter("bbsID")!=null){
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }

        if(bbsID==0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다.')");
            script.println("location.href='bbs.jsp'");
            script.println("</script>");
        }
        bbs bbs = new BbsDAO().getbbs(bbsID);

        if(!userID.equals(bbs.getUserID())){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("location.href='bbs.jsp'");
            script.println("</script>");
        }else {
            if(request.getParameter("bbsTitle")==null||request.getParameter("bbsContent")==null
            ||request.getParameter("bbsTitle").equals("")||request.getParameter("bbsContent").equals("")){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('작성하지 않은 부분이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else{
                BbsDAO bbsDAO = new BbsDAO();
                int result = bbsDAO.update(bbsID,request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
                if(result==-1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글 수정에 실패하였습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else{
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
