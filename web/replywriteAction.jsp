<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
%>

<jsp:useBean id="reply" class="reply.reply" scope="page" />
<jsp:setProperty name="reply" property="replyContent" />
<jsp:setProperty name="reply" property="replyID" />
<jsp:useBean id="bbs" class="bbs.bbs" scope="page"/>

<%
    System.out.println(reply);
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>댓글 작성</title>
</head>
<body>
<%
    String userID = null;
    if(session.getAttribute("userID")!=null){
        userID=(String)session.getAttribute("userID");
    }

    if(userID==null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 이후에 댓글 작성이 가능합니다.')");
        script.println("location.href='login.jsp");
        script.println("</script>");
    }else{
        if(reply.getReplyContent()==null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('댓글 내용을 입력해 주세요.')");
            script.println("history.back()");
            script.println("</script>");
        }else{
            ReplyDAO rDAO = new ReplyDAO();
            int result = rDAO.write(userID,bbs.getBbsID(),reply.getReplyContent());
            if(result==-1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글 작성에 실패하였습니다.");
                script.println("history.back()");
                script.println("</script>");
            }else{
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글이 작성되었습니다.')");
                script.println("history.back()");
                script.println("</script>");
            }

        }
    }
%>

</body>
</html>
