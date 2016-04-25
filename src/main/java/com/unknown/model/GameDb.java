package com.unknown.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

//게임DB
public class GameDb {

//  게임번호
private Integer gnum;

//  게임이름
private String gname;

//  서비스일자
private Date gstartdate;

//  개발사
private String gmaker;

//  유통사
private String gpublisher;

//  서비스형태
private String gservicetype;

//  플랫폼
private String gplatform;

//  장르
private String ggenre;

//  홈페이지
private String ghomepage;

//  평점
private Integer grating;

//  게임소개
private String gintroduce;



public Integer getGnum() {
	return gnum;
}



public void setGnum(Integer gnum) {
	this.gnum = gnum;
}



public String getGname() {
	return gname;
}



public void setGname(String gname) {
	this.gname = gname;
}



public Date getGstartdate() {
	return gstartdate;
}



public void setGstartdate(Date gstartdate) {
	this.gstartdate = gstartdate;
}



public String getGmaker() {
	return gmaker;
}



public void setGmaker(String gmaker) {
	this.gmaker = gmaker;
}



public String getGpublisher() {
	return gpublisher;
}



public void setGpublisher(String gpublisher) {
	this.gpublisher = gpublisher;
}



public String getGservicetype() {
	return gservicetype;
}



public void setGservicetype(String gservicetype) {
	this.gservicetype = gservicetype;
}



public String getGplatform() {
	return gplatform;
}



public void setGplatform(String gplatform) {
	this.gplatform = gplatform;
}



public String getGgenre() {
	return ggenre;
}



public void setGgenre(String ggenre) {
	this.ggenre = ggenre;
}



public String getGhomepage() {
	return ghomepage;
}



public void setGhomepage(String ghomepage) {
	this.ghomepage = ghomepage;
}



public Integer getGrating() {
	return grating;
}



public void setGrating(Integer grating) {
	this.grating = grating;
}



public String getGintroduce() {
	return gintroduce;
}



public void setGintroduce(String gintroduce) {
	this.gintroduce = gintroduce;
}




}
