package com.unknown.model;

import java.util.Date;

//게임DB덧글
public class DbReply {

//  게임DB덧글번호
private Integer dbReplyNum;

//  아이디
private String mId;

//  작성일자
private Date dbReplyDate;

//  아이피
private String mIp;

//  내용
private String dbReplyContent;

//  평점
private Integer dbRate;

//  게임번호
private Integer gName;

public Integer getDbReplyNum() {
    return dbReplyNum;
}

public void setDbReplyNum(Integer dbReplyNum) {
    this.dbReplyNum = dbReplyNum;
}

public String getMId() {
    return mId;
}

public void setMId(String mId) {
    this.mId = mId;
}

public Date getDbReplyDate() {
    return dbReplyDate;
}

public void setDbReplyDate(Date dbReplyDate) {
    this.dbReplyDate = dbReplyDate;
}

public String getMIp() {
    return mIp;
}

public void setMIp(String mIp) {
    this.mIp = mIp;
}

public String getDbReplyContent() {
    return dbReplyContent;
}

public void setDbReplyContent(String dbReplyContent) {
    this.dbReplyContent = dbReplyContent;
}

public Integer getDbRate() {
    return dbRate;
}

public void setDbRate(Integer dbRate) {
    this.dbRate = dbRate;
}

public Integer getGName() {
    return gName;
}

public void setGName(Integer gName) {
    this.gName = gName;
}

// DbReply 모델 복사
public void CopyData(DbReply param)
{
    this.dbReplyNum = param.getDbReplyNum();
    this.mId = param.getMId();
    this.dbReplyDate = param.getDbReplyDate();
    this.mIp = param.getMIp();
    this.dbReplyContent = param.getDbReplyContent();
    this.dbRate = param.getDbRate();
    this.gName = param.getGName();
}
}