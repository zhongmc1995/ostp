package com.peace.ostp.domain;

import java.util.Date;

public class CommunityAnswerInfo {
    private Integer ansid;

    private String ansauthor;

    private Date anstime;

    private String ansattention;

    private String questionid;

    private String enabled;

    public Integer getAnsid() {
        return ansid;
    }

    public void setAnsid(Integer ansid) {
        this.ansid = ansid;
    }

    public String getAnsauthor() {
        return ansauthor;
    }

    public void setAnsauthor(String ansauthor) {
        this.ansauthor = ansauthor;
    }

    public Date getAnstime() {
        return anstime;
    }

    public void setAnstime(Date anstime) {
        this.anstime = anstime;
    }

    public String getAnsattention() {
        return ansattention;
    }

    public void setAnsattention(String ansattention) {
        this.ansattention = ansattention;
    }

    public String getQuestionid() {
        return questionid;
    }

    public void setQuestionid(String questionid) {
        this.questionid = questionid;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }
}