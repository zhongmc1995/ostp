package com.peace.ostp.domain;

public class PhotoPhotoGraphy {
    private String pictureid;

    private String title;

    private String author;

    private String publishtime;

    private String origin;

    private String sporttypeid;

    private String styletypeid;

    private String leveltype;

    private String photoparam;

    private String introduction;

    private String currentliketimes;

    private String totalliketimes;

    private String enabled;
    
    private String photourl;
    
    private String thumbphotography;
    
    private BasicSportType basicSportType;
    
    private BasicPhotoStyle basicPhotoStyle;

	private String begintime;
    
    private String endtime;
    
    private String minliketimes;
    
    private String maxliketimes;
    
    private String tminliketimes;
    
    private String tmaxliketimes;
    
    public BasicSportType getBasicSportType() {
		return basicSportType;
	}

	public void setBasicSportType(BasicSportType basicSportType) {
		this.basicSportType = basicSportType;
	}

	public BasicPhotoStyle getBasicPhotoStyle() {
		return basicPhotoStyle;
	}

	public void setBasicPhotoStyle(BasicPhotoStyle basicPhotoStyle) {
		this.basicPhotoStyle = basicPhotoStyle;
	}
	
    public String getMinliketimes() {
		return minliketimes;
	}

	public void setMinliketimes(String minliketimes) {
		this.minliketimes = minliketimes;
	}

	public String getMaxliketimes() {
		return maxliketimes;
	}

	public void setMaxliketimes(String maxliketimes) {
		
		this.maxliketimes = maxliketimes;
	}

	public String getTminliketimes() {
		return tminliketimes;
	}

	public void setTminliketimes(String tminliketimes) {
		this.tminliketimes = tminliketimes;
	}

	public String getTmaxliketimes() {
		return tmaxliketimes;
	}

	public void setTmaxliketimes(String tmaxliketimes) {
		this.tmaxliketimes = tmaxliketimes;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getEndtime() {
		return endtime;
	}
	
	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	

	public String getPhotourl() {
		return photourl;
	}

	public void setPhotourl(String photourl) {
		this.photourl = photourl;
	}

	public String getPictureid() {
        return pictureid;
    }

    public void setPictureid(String pictureid) {
        this.pictureid = pictureid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getStyletypeid() {
        return styletypeid;
    }

    public void setStyletypeid(String styletypeid) {
        this.styletypeid = styletypeid;
    }

    public String getLeveltype() {
        return leveltype;
    }

    public void setLeveltype(String leveltype) {
        this.leveltype = leveltype;
    }

    public String getPhotoparam() {
        return photoparam;
    }

    public void setPhotoparam(String photoparam) {
        this.photoparam = photoparam;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCurrentliketimes() {
        return currentliketimes;
    }

    public void setCurrentliketimes(String currentliketimes) {
        this.currentliketimes = currentliketimes;
    }

    public String getTotalliketimes() {
        return totalliketimes;
    }

    public void setTotalliketimes(String totalliketimes) {
        this.totalliketimes = totalliketimes;
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

	public String getThumbphotography() {
		return thumbphotography;
	}

	public void setThumbphotography(String thumbphotography) {
		this.thumbphotography = thumbphotography;
	}
}