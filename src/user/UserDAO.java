package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDAO(){
        try {
            String dbURL="jdbc:mysql://localhost:3306/MyHome?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
            String dbID = "root";
            String dbPassword = "Zmfntldh12!";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public int login(String userID,String userPassword){
        String SQL="SELECT userPassword FROM USER WHERE UserID = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword)) {
                    return 1; //로그인 성공
                }
                else return 0; //비밀번호 오류
            }
            return -1; //로그인 실패 시 실행
        }catch (Exception e){
            e.printStackTrace();
        }
        return -2;
    }
}
