package com.unknown.model;

import java.sql.Timestamp;
import java.util.Date;

//회원
public class Member {

//  회원번호
private Integer mNum;

//  아이디
private String mId;

//  패스워드
private String mPass;

//  이름
private String mName;

//  닉네임
private String mNick;

//  이메일
private String mEmail;

//  회원권한레벨
private Integer mAuthLevel;

//  성별
private String mGender;

//  생년월일
private Date mBirth;

//  연락처
private String mTel;

//  우편번호(신)
private String mZipcode;

//  도로명주소
private String mAddr1;

//  나머지주소
private String mAddr2;

//  회원레벨
private Integer mLevel;

//  회원EXP
private Integer mExp;

//  최종접속시간
private Timestamp mRecentLoginDate;

//  아이피
private String mIp;

//  탈퇴일시
private Timestamp mOut;

//  탈퇴여부
private Integer mIsOut;

//  회원가입일
private Date mJoinDate;

public Integer getMNum() {
    return mNum;
}

public void setMNum(Integer mNum) {
    this.mNum = mNum;
}

public String getMId() {
    return mId;
}

public void setMId(String mId) {
    this.mId = mId;
}

public String getMPass() {
    return mPass;
}

public void setMPass(String mPass) {
    this.mPass = mPass;
}

public String getMName() {
    return mName;
}

public void setMName(String mName) {
    this.mName = mName;
}

public String getMNick() {
    return mNick;
}

public void setMNick(String mNick) {
    this.mNick = mNick;
}

public String getMEmail() {
    return mEmail;
}

public void setMEmail(String mEmail) {
    this.mEmail = mEmail;
}

public Integer getMAuthLevel() {
    return mAuthLevel;
}

public void setMAuthLevel(Integer mAuthLevel) {
    this.mAuthLevel = mAuthLevel;
}

public String getMGender() {
    return mGender;
}

public void setMGender(String mGender) {
    this.mGender = mGender;
}

public Date getMBirth() {
    return mBirth;
}

public void setMBirth(Date mBirth) {
    this.mBirth = mBirth;
}

public String getMTel() {
    return mTel;
}

public void setMTel(String mTel) {
    this.mTel = mTel;
}

public String getMZipcode() {
    return mZipcode;
}

public void setMZipcode(String mZipcode) {
    this.mZipcode = mZipcode;
}

public String getMAddr1() {
    return mAddr1;
}

public void setMAddr1(String mAddr1) {
    this.mAddr1 = mAddr1;
}

public String getMAddr2() {
    return mAddr2;
}

public void setMAddr2(String mAddr2) {
    this.mAddr2 = mAddr2;
}

public Integer getMLevel() {
    return mLevel;
}

public void setMLevel(Integer mLevel) {
    this.mLevel = mLevel;
}

public Integer getMExp() {
    return mExp;
}

public void setMExp(Integer mExp) {
    this.mExp = mExp;
}

public Timestamp getMRecentLoginDate() {
    return mRecentLoginDate;
}

public void setMRecentLoginDate(Timestamp mRecentLoginDate) {
    this.mRecentLoginDate = mRecentLoginDate;
}

public String getMIp() {
    return mIp;
}

public void setMIp(String mIp) {
    this.mIp = mIp;
}

public Timestamp getMOut() {
    return mOut;
}

public void setMOut(Timestamp mOut) {
    this.mOut = mOut;
}

public Integer getMIsOut() {
    return mIsOut;
}

public void setMIsOut(Integer mIsOut) {
    this.mIsOut = mIsOut;
}

public Date getMJoinDate() {
    return mJoinDate;
}

public void setMJoinDate(Date mJoinDate) {
    this.mJoinDate = mJoinDate;
}

// Member 모델 복사
public void CopyData(Member param)
{
    this.mNum = param.getMNum();
    this.mId = param.getMId();
    this.mPass = param.getMPass();
    this.mName = param.getMName();
    this.mNick = param.getMNick();
    this.mEmail = param.getMEmail();
    this.mAuthLevel = param.getMAuthLevel();
    this.mGender = param.getMGender();
    this.mBirth = param.getMBirth();
    this.mTel = param.getMTel();
    this.mZipcode = param.getMZipcode();
    this.mAddr1 = param.getMAddr1();
    this.mAddr2 = param.getMAddr2();
    this.mLevel = param.getMLevel();
    this.mExp = param.getMExp();
    this.mRecentLoginDate = param.getMRecentLoginDate();
    this.mIp = param.getMIp();
    this.mOut = param.getMOut();
    this.mIsOut = param.getMIsOut();
    this.mJoinDate = param.getMJoinDate();
}
}
