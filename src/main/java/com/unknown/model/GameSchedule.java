package com.unknown.model;

import java.util.Date;

//게임일정게시판
public class GameSchedule {

//  게임일정번호
private Integer sNum;

//  게임이름
private String sName;

//  시작일자
private Date sStart;

//  종료일자
private Date sEnd;

//  구분
private String sType;

//  게임번호
private Integer gNum;

public Integer getSNum() {
    return sNum;
}

public void setSNum(Integer sNum) {
    this.sNum = sNum;
}

public String getSName() {
    return sName;
}

public void setSName(String sName) {
    this.sName = sName;
}

public Date getSStart() {
    return sStart;
}

public void setSStart(Date sStart) {
    this.sStart = sStart;
}

public Date getSEnd() {
    return sEnd;
}

public void setSEnd(Date sEnd) {
    this.sEnd = sEnd;
}

public String getSType() {
    return sType;
}

public void setSType(String sType) {
    this.sType = sType;
}

public Integer getGNum() {
    return gNum;
}

public void setGNum(Integer gNum) {
    this.gNum = gNum;
}

// GameSchedule 모델 복사
public void CopyData(GameSchedule param)
{
    this.sNum = param.getSNum();
    this.sName = param.getSName();
    this.sStart = param.getSStart();
    this.sEnd = param.getSEnd();
    this.sType = param.getSType();
    this.gNum = param.getGNum();
}
}

