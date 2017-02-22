package com.peace.ostp.domain;

import java.util.Date;

public class CommunityQuestionInfo {
    private String questionid;

    private String questiontitle;

    private String questioncontent;

    private String questionauthor;

    private String questionattention;

    private Date questiontime;

    private String enabled;

    public String getQuestionid() {
        return questionid;
    }

    public void setQuestionid(String questionid) {
        this.questionid = questionid;
    }

    public String getQuestiontitle() {
        return questiontitle;
    }

    public void setQuestiontitle(String questiontitle) {
        this.questiontitle = questiontitle;
    }

    public String getQuestioncontent() {
        return questioncontent;
    }

    public void setQuestioncontent(String questioncontent) {
        this.questioncontent = questioncontent;
    }

    public String getQuestionauthor() {
        return questionauthor;
    }

    public void setQuestionauthor(String questionauthor) {
        this.questionauthor = questionauthor;
    }

    public String getQuestionattention() {
        return questionattention;
    }

    public void setQuestionattention(String questionattention) {
        this.questionattention = questionattention;
    }

    public Date getQuestiontime() {
        return questiontime;
    }

    public void setQuestiontime(Date questiontime) {
        this.questiontime = questiontime;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

	@Override
	public String toString() {
		return "CommunityQuestionInfo [questionid=" + questionid + ", questiontitle=" + questiontitle
				+ ", questioncontent=" + questioncontent + ", questionauthor=" + questionauthor + ", questionattention="
				+ questionattention + ", questiontime=" + questiontime + ", enabled=" + enabled + "]";
	}
}