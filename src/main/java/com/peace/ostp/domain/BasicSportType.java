package com.peace.ostp.domain;

import java.util.Date;

public class BasicSportType {
    private String sporttypeid;

    private String sporttypename;

    private String note;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getSporttypename() {
        return sporttypename;
    }

    public void setSporttypename(String sporttypename) {
        this.sporttypename = sporttypename;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}