package com.unknown.model;

import java.util.Date;

//덧글
public class Reply {

//  덧글번호
private Integer rNum;

//  아이디
private String mId;

//  작성일자
private Date rDate;

//  아이피
private String mIp;

//  내용
private String rContent;

//  글번호
private Integer bNum;

public Integer getRNum() {
    return rNum;
}

public void setRNum(Integer rNum) {
    this.rNum = rNum;
}

public String getMId() {
    return mId;
}

public void setMId(String mId) {
    this.mId = mId;
}

public Date getRDate() {
    return rDate;
}

public void setRDate(Date rDate) {
    this.rDate = rDate;
}

public String getMIp() {
    return mIp;
}

public void setMIp(String mIp) {
    this.mIp = mIp;
}

public String getRContent() {
    return rContent;
}

public void setRContent(String rContent) {
    this.rContent = rContent;
}

public Integer getBNum() {
    return bNum;
}

public void setBNum(Integer bNum) {
    this.bNum = bNum;
}

// Reply 모델 복사
public void CopyData(Reply param)
{
    this.rNum = param.getRNum();
    this.mId = param.getMId();
    this.rDate = param.getRDate();
    this.mIp = param.getMIp();
    this.rContent = param.getRContent();
    this.bNum = param.getBNum();
}
}
