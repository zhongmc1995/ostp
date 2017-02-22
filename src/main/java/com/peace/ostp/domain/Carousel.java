package com.peace.ostp.domain;

import java.util.Date;

public class Carousel {
    private String carouselid;

    private String carouselname;

    private String carouselhref;

    private String note;

    private String createBy;

    private Date createDate;

    private String updateBy;

    private Date updateDate;

    public String getCarouselid() {
        return carouselid;
    }

    public void setCarouselid(String carouselid) {
        this.carouselid = carouselid;
    }

    public String getCarouselname() {
        return carouselname;
    }

    public void setCarouselname(String carouselname) {
        this.carouselname = carouselname;
    }

    public String getCarouselhref() {
        return carouselhref;
    }

    public void setCarouselhref(String carouselhref) {
        this.carouselhref = carouselhref;
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