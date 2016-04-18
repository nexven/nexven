package com.unknown.model;

import java.util.Date;

//게임DB
public class GameDb {

//  게임번호
private Integer gNum;

//  게임이름
private String gName;

//  서비스일자
private Date gStartDate;

//  개발사
private String gMaker;

//  유통사
private String gPublisher;

//  서비스형태
private String gServiceType;

//  플랫폼
private String gPlatform;

//  장르
private String gGenre;

//  홈페이지
private String gHomepage;

//  평점
private Integer gRating;

//  게임소개
private String gIntroduce;

public Integer getGNum() {
    return gNum;
}

public void setGNum(Integer gNum) {
    this.gNum = gNum;
}

public String getGName() {
    return gName;
}

public void setGName(String gName) {
    this.gName = gName;
}

public Date getGStartDate() {
    return gStartDate;
}

public void setGStartDate(Date gStartDate) {
    this.gStartDate = gStartDate;
}

public String getGMaker() {
    return gMaker;
}

public void setGMaker(String gMaker) {
    this.gMaker = gMaker;
}

public String getGPublisher() {
    return gPublisher;
}

public void setGPublisher(String gPublisher) {
    this.gPublisher = gPublisher;
}

public String getGServiceType() {
    return gServiceType;
}

public void setGServiceType(String gServiceType) {
    this.gServiceType = gServiceType;
}

public String getGPlatform() {
    return gPlatform;
}

public void setGPlatform(String gPlatform) {
    this.gPlatform = gPlatform;
}

public String getGGenre() {
    return gGenre;
}

public void setGGenre(String gGenre) {
    this.gGenre = gGenre;
}

public String getGHomepage() {
    return gHomepage;
}

public void setGHomepage(String gHomepage) {
    this.gHomepage = gHomepage;
}

public Integer getGRating() {
    return gRating;
}

public void setGRating(Integer gRating) {
    this.gRating = gRating;
}

public String getGIntroduce() {
    return gIntroduce;
}

public void setGIntroduce(String gIntroduce) {
    this.gIntroduce = gIntroduce;
}

// GameDb 모델 복사
public void CopyData(GameDb param)
{
    this.gNum = param.getGNum();
    this.gName = param.getGName();
    this.gStartDate = param.getGStartDate();
    this.gMaker = param.getGMaker();
    this.gPublisher = param.getGPublisher();
    this.gServiceType = param.getGServiceType();
    this.gPlatform = param.getGPlatform();
    this.gGenre = param.getGGenre();
    this.gHomepage = param.getGHomepage();
    this.gRating = param.getGRating();
    this.gIntroduce = param.getGIntroduce();
}
}
