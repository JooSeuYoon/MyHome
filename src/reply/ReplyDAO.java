package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;

public class ReplyDAO {
    private Connection conn;
    private ResultSet rs;

    public ReplyDAO(){
        try {
            String dbURL = "jdbc:mysql://localhost:3306/MyHome?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&characterEncoding=euckr";
            String dbID = "root";
            String dbPassword = "Zmfntldh12!";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int getNext(int bbsID){
        String SQL = "SELECT replyID FROM reply WHERE bbsID = ? BY replyID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,bbsID);

            rs = pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1)+1;
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public int write(String userID,int bbsID, String replyContent){
        String SQL = "INSERT INTO reply VALUES(?,?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext(bbsID));
            pstmt.setString(2,userID);
            pstmt.setInt(3,bbsID);
            pstmt.setString(4,replyContent);
            pstmt.setInt(5,1);

            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    public ArrayList<reply> getList(int bbsID){
        String SQL = "SELECT * FROM reply WHERE bbsID = ? AND replyAvail = 1 ORDER BY replyID ASC DESC";
        ArrayList<reply> list = new ArrayList<reply>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,bbsID);
            rs = pstmt.executeQuery();

            while (rs.next()){
                reply re = new reply();
                re.setReplyID(rs.getInt(1));
                re.setUserID(rs.getString(2));
                re.setBbsID(rs.getInt(3));
                re.setReplyContent(rs.getString(4));
                re.setReplyAvail(rs.getInt(5));
                list.add(re);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public int delete(int bbsID, int replyID){
        String SQL = "UPDATE REPLY SET replyAvail = 0 WHERE bbsID=? AND replyID=?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,bbsID);
            pstmt.setInt(2,replyID);

            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }



}