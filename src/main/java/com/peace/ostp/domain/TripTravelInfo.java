package com.peace.ostp.domain;

public class TripTravelInfo {
    private String travelid;

    private String travelname;

    private String sporttypeid;
    
    private String attention;
    
    private String keyword;

    private String guide;
    
    private String creattime;

    private String enabled;
    
    private String travelpicture;
    
    private BasicSportType basicSportType;

    public String getTravelid() {
        return travelid;
    }

    public void setTravelid(String travelid) {
        this.travelid = travelid;
    }

    public String getTravelname() {
        return travelname;
    }

    public void setTravelname(String travelname) {
        this.travelname = travelname;
    }

    public String getSporttypeid() {
        return sporttypeid;
    }

    public void setSporttypeid(String sporttypeid) {
        this.sporttypeid = sporttypeid;
    }

    public String getAttention() {
        return attention;
    }

    public void setAttention(String attention) {
        this.attention = attention;
    }
    

    public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getGuide() {
        return guide;
    }

    public void setGuide(String guide) {
        this.guide = guide;
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

	public String getCreattime() {
		return creattime;
	}

	public void setCreattime(String creattime) {
		this.creattime = creattime;
	}

	public String getTravelpicture() {
		return travelpicture;
	}

	public void setTravelpicture(String travelpicture) {
		this.travelpicture = travelpicture;
	}
   
}