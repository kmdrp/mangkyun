package model.dto;

/**
 * Created by 이석현 on 2017-07-13.
 */
public class Reply {
    private int reply_num;
    private int board_num;
    private String writer_id;
    private String writer_nick;
    private String content;
    private String regdate;
    int anony;
    private int like;

    public int getReply_num() {
        return reply_num;
    }

    public void setReply_num(int reply_num) {
        this.reply_num = reply_num;
    }

    public String getWriter_id() {
        return writer_id;
    }

    public void setWriter_id(String writer_id) {
        this.writer_id = writer_id;
    }

    public String getWriter_nick() {
        return writer_nick;
    }

    public void setWriter_nick(String writer_nick) {
        this.writer_nick = writer_nick;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getAnony() {
        return anony;
    }

    public void setAnony(int anony) {
        this.anony = anony;
    }
}
