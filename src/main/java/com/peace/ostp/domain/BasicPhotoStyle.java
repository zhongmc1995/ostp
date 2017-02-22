package com.peace.ostp.domain;

import java.util.Date;

public class BasicPhotoStyle {
    private String photostyleid;

    private String photostylename;

    private String note;

    private String enabled;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    public String getPhotostyleid() {
        return photostyleid;
    }

    public void setPhotostyleid(String photostyleid) {
        this.photostyleid = photostyleid;
    }

    public String getPhotostylename() {
        return photostylename;
    }

    public void setPhotostylename(String photostylename) {
        this.photostylename = photostylename;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
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