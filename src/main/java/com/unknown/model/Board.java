package com.unknown.model;

import java.sql.Timestamp;

//글
public class Board {

//  글번호
private Integer bNum;

//  게시판이름
private String bName;

//  제목
private String pTitle;

//  카테고리
private String pCategory;

//  아이디
private String mId;

//  작성시간
private Timestamp bDate;

//  조회수
private Integer bHit;

//  추천
private Integer bGood;

//  내용
private String bContent;

//  첨부파일
private String bFile;

//  거래상태
private String bState;

//  아이피
private String mIp;

//  연락처
private String mTel;

//  물품금액
private Integer bPrice;

public Integer getBNum() {
    return bNum;
}

public void setBNum(Integer bNum) {
    this.bNum = bNum;
}

public String getBName() {
    return bName;
}

public void setBName(String bName) {
    this.bName = bName;
}

public String getPTitle() {
    return pTitle;
}

public void setPTitle(String pTitle) {
    this.pTitle = pTitle;
}

public String getPCategory() {
    return pCategory;
}

public void setPCategory(String pCategory) {
    this.pCategory = pCategory;
}

public String getMId() {
    return mId;
}

public void setMId(String mId) {
    this.mId = mId;
}

public Timestamp getBDate() {
    return bDate;
}

public void setBDate(Timestamp bDate) {
    this.bDate = bDate;
}

public Integer getBHit() {
    return bHit;
}

public void setBHit(Integer bHit) {
    this.bHit = bHit;
}

public Integer getBGood() {
    return bGood;
}

public void setBGood(Integer bGood) {
    this.bGood = bGood;
}

public String getBContent() {
    return bContent;
}

public void setBContent(String bContent) {
    this.bContent = bContent;
}

public String getBFile() {
    return bFile;
}

public void setBFile(String bFile) {
    this.bFile = bFile;
}

public String getBState() {
    return bState;
}

public void setBState(String bState) {
    this.bState = bState;
}

public String getMIp() {
    return mIp;
}

public void setMIp(String mIp) {
    this.mIp = mIp;
}

public String getMTel() {
    return mTel;
}

public void setMTel(String mTel) {
    this.mTel = mTel;
}

public Integer getBPrice() {
    return bPrice;
}

public void setBPrice(Integer bPrice) {
    this.bPrice = bPrice;
}

// Board 모델 복사
public void CopyData(Board param)
{
    this.bNum = param.getBNum();
    this.bName = param.getBName();
    this.pTitle = param.getPTitle();
    this.pCategory = param.getPCategory();
    this.mId = param.getMId();
    this.bDate = param.getBDate();
    this.bHit = param.getBHit();
    this.bGood = param.getBGood();
    this.bContent = param.getBContent();
    this.bFile = param.getBFile();
    this.bState = param.getBState();
    this.mIp = param.getMIp();
    this.mTel = param.getMTel();
    this.bPrice = param.getBPrice();
}
}