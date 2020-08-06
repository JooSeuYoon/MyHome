package reply;

public class reply {
    private int bbsID;
    private int replyID;
    private String userID;
    private String replyContent;
    private int replyAvail;

    public int getBbsID() {
        return bbsID;
    }

    public void setBbsID(int bbsID) {
        this.bbsID = bbsID;
    }

    public int getReplyID() {
        return replyID;
    }

    public void setReplyID(int replyID) {
        this.replyID = replyID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }

    public int getReplyAvail() {
        return replyAvail;
    }

    public void setReplyAvail(int replyAvail) {
        this.replyAvail = replyAvail;
    }
}
