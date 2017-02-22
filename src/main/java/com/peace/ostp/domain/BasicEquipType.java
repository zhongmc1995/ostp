package com.peace.ostp.domain;

import java.util.Date;

public class BasicEquipType {
    private String equiptypeid;

    private String equiptypename;

    private String note;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    public String getEquiptypeid() {
        return equiptypeid;
    }

    public void setEquiptypeid(String equiptypeid) {
        this.equiptypeid = equiptypeid;
    }

    public String getEquiptypename() {
        return equiptypename;
    }

    public void setEquiptypename(String equiptypename) {
        this.equiptypename = equiptypename;
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