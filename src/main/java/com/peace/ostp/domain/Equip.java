package com.peace.ostp.domain;

import java.util.Date;

public class Equip {
    private String equipid;

    private String equipname;

    private String equipprice;

    private String equipparam;

    private String equiprecommend;

    private String sporttypeid;

    private String equiptypeid;

    private String note;
    
    private String equipimage;

    private String enabled;

    private Date updatedate;

    private Date createdate;

    private String updateby;

    private String createby;

    public String getEquipid() {
        return equipid;
    }

    public void setEquipid(String equipid) {
        this.equipid = equipid;
    }

    public String getEquipname() {
        return equipname;
    }

    public void setEquipname(String equipname) {
        this.equipname = equipname;
    }

    public String getEquipprice() {
        return equipprice;
    }

    public void setEquipprice(String equipprice) {
        this.equipprice = equipprice;
    }

    public String getEquipparam() {
        return equipparam;
    }

    public void setEquipparam(String equipparam) {
        this.equipparam = equipparam;
    }

   

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getEquiptypeid() {
        return equiptypeid;
    }

    public void setEquiptypeid(String equiptypeid) {
        this.equiptypeid = equiptypeid;
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

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getUpdateby() {
        return updateby;
    }

    public void setUpdateby(String updateby) {
        this.updateby = updateby;
    }

    public String getCreateby() {
        return createby;
    }

    public void setCreateby(String createby) {
        this.createby = createby;
    }

	public String getEquiprecommend() {
		return equiprecommend;
	}

	public void setEquiprecommend(String equiprecommend) {
		this.equiprecommend = equiprecommend;
	}

	public String getEquipimage() {
		return equipimage;
	}

	public void setEquipimage(String equipimage) {
		this.equipimage = equipimage;
	}
}