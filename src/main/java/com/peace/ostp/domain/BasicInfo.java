package com.peace.ostp.domain;

import java.util.Date;

public class BasicInfo {
    private String infoId;

    private String author;

    private String title;

    private String firstlevelinfotypeid;

    private String secondlevelinfotypeid;

    private String sporttypeid;

    private String copyfrom;

    private String keywords;

    private String content;

    private String imgurl;

    private Date createtime;

    private String enabled;
    
    private String sporttypename;
    
    private String firstlevelinfotypename;
    
    private String secondlevelinfotypename;
    
    private Date beginTime;
    
	private Date endTime;
	
	private InfoFirstLevelType infoFirstLevelType;
	
	private InfoSecondLevelType infoSecondLevelType;
	
	private BasicSport basicSport;
	
	public InfoFirstLevelType getInfoFirstLevelType() {
		return infoFirstLevelType;
	}

	public void setInfoFirstLevelType(InfoFirstLevelType infoFirstLevelType) {
		this.infoFirstLevelType = infoFirstLevelType;
	}

	public InfoSecondLevelType getInfoSecondLevelType() {
		return infoSecondLevelType;
	}

	public void setInfoSecondLevelType(InfoSecondLevelType infoSecondLevelType) {
		this.infoSecondLevelType = infoSecondLevelType;
	}

	public BasicSport getBasicSport() {
		return basicSport;
	}

	public void setBasicSport(BasicSport basicSport) {
		this.basicSport = basicSport;
	}



    public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}


    public String getInfoId() {
        return infoId;
    }

    public void setInfoId(String infoId) {
        this.infoId = infoId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFirstlevelinfotypeid() {
        return firstlevelinfotypeid;
    }

    public void setFirstlevelinfotypeid(String firstlevelinfotypeid) {
        this.firstlevelinfotypeid = firstlevelinfotypeid;
    }

    public String getSecondlevelinfotypeid() {
        return secondlevelinfotypeid;
    }

    public void setSecondlevelinfotypeid(String secondlevelinfotypeid) {
        this.secondlevelinfotypeid = secondlevelinfotypeid;
    }

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getCopyfrom() {
        return copyfrom;
    }

    public void setCopyfrom(String copyfrom) {
        this.copyfrom = copyfrom;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

	public String getSporttypename() {
		return sporttypename;
	}

	public void setSporttypename(String sporttypename) {
		this.sporttypename = sporttypename;
	}

	public String getFirstlevelinfotypename() {
		return firstlevelinfotypename;
	}

	public void setFirstlevelinfotypename(String firstlevelinfotypename) {
		this.firstlevelinfotypename = firstlevelinfotypename;
	}

	public String getSecondlevelinfotypename() {
		return secondlevelinfotypename;
	}

	public void setSecondlevelinfotypename(String secondlevelinfotypename) {
		this.secondlevelinfotypename = secondlevelinfotypename;
	}
    
}