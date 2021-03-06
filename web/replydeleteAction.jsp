<%@ page import="java.io.PrintWriter" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="reply.reply" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>댓글 삭제</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID=(String)session.getAttribute("userID");
        }
        if(userID == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 이후에 댓글 삭제가 가능합니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }

        int replyID = 0;
        if(request.getParameter("replyID")!=null){
            replyID = Integer.parseInt(request.getParameter("replyID"));
        }
        if(replyID==0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 댓글 입니다.')");
            script.println("history.back()");
            script.println("</script>");
        }

        reply reply = new ReplyDAO().getreply(replyID);

        if(!userID.equals(reply.getUserID())){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }else{
            ReplyDAO reDAO = new ReplyDAO();
            int result = reDAO.delete(replyID);

            if(result==-1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글 삭제에 실패하였습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글이 삭제 되었습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
        }
    %>

</body>
</html>
