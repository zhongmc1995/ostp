package com.peace.ostp.domain;

import java.util.Date;

public class BasicSport {
    private String sportid;

    private String sporttypeid;
    
    private String sporttypename;

    private String sportname;

    private String sportkeywords;

    private String sportnote;

    private String enabled;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    public String getSportid() {
        return sportid;
    }

    public void setSportid(String sportid) {
        this.sportid = sportid;
    }

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getSportname() {
        return sportname;
    }

    public void setSportname(String sportname) {
        this.sportname = sportname;
    }

    public String getSportkeywords() {
        return sportkeywords;
    }

    public void setSportkeywords(String sportkeywords) {
        this.sportkeywords = sportkeywords;
    }

    public String getSportnote() {
        return sportnote;
    }

    public void setSportnote(String sportnote) {
        this.sportnote = sportnote;
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

	public String getSporttypename() {
		return sporttypename;
	}

	public void setSporttypename(String sporttypename) {
		this.sporttypename = sporttypename;
	}
}