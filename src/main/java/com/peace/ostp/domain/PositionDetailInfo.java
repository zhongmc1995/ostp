package com.peace.ostp.domain;

public class PositionDetailInfo {
    private String positionid;

    private String positiontypeid;
    
    private String positioncoordinate;

    private String sporttypeid;

    private String positionname;

    private String positionpicture;

    private String positiondescribe;

    private String positiontime;
    
    private String creattime;

    private String enabled;
    
    private BasicSportType basicSportType;
    
    private PositionTypeInfo positionTypeInfo;
    //开始时间
    private String begintime;
    //结束时间
    private String endtime;
    //缩略图的位置
    private String positionthumbnailpicture;
    
    public String getPositionid() {
        return positionid;
    }

    public void setPositionid(String positionid) {
        this.positionid = positionid;
    }

    public String getPositiontypeid() {
        return positiontypeid;
    }

    public void setPositiontypeid(String positiontypeid) {
        this.positiontypeid = positiontypeid;
    }

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname;
    }

    public String getPositionpicture() {
        return positionpicture;
    }

    public void setPositionpicture(String positionpicture) {
        this.positionpicture = positionpicture;
    }

    public String getPositiondescribe() {
        return positiondescribe;
    }

    public void setPositiondescribe(String positiondescribe) {
        this.positiondescribe = positiondescribe;
    }

    public String getPositiontime() {
        return positiontime;
    }

    public void setPositiontime(String positiontime) {
        this.positiontime = positiontime;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }
    
	public BasicSportType getBasicSportType() {
		return basicSportType;
	}

	public void setBasicSportType(BasicSportType basicSportType) {
		this.basicSportType = basicSportType;
	}

	public PositionTypeInfo getPositionTypeInfo() {
		return positionTypeInfo;
	}

	public void setPositionTypeInfo(PositionTypeInfo positionTypeInfo) {
		this.positionTypeInfo = positionTypeInfo;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getPositionthumbnailpicture() {
		return positionthumbnailpicture;
	}

	public void setPositionthumbnailpicture(String positionthumbnailpicture) {
		this.positionthumbnailpicture = positionthumbnailpicture;
	}

	public String getPositioncoordinate() {
		return positioncoordinate;
	}

	public void setPositioncoordinate(String positioncoordinate) {
		this.positioncoordinate = positioncoordinate;
	}

	public String getCreattime() {
		return creattime;
	}

	public void setCreattime(String creattime) {
		this.creattime = creattime;
	}

}