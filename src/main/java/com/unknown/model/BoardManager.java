package com.unknown.model;

//게시판설정
public class BoardManager {

//  게시판이름
private String bName;

//  게시판제목
private String bSubject;

//  읽기권한레벨
private Integer bReadLevel;

//  쓰기권한레벨
private Integer bWriteLevel;

//  업로드가능레벨
private Integer bUploadLevel;

//  다운로드가능레벨
private Integer bDownloadLevel;

//  카테고리사용여부
private Integer bUseCategory;

//  카테고리목록
private String bCategoryList;

//  첨부파일여부
private Integer bUseFile;

//  rss가용가능여부
private Integer bUseRss;

//  추천기능사용여부
private Integer bUseGood;

//  아이피표시여부
private Integer bUseIp;

//  거래상태표시여부
private Integer bUseState;

//  연락처표시여부
private Integer bUseTel;

//  금액표시여부
private Integer bUsePrice;

//  페이지당 행개수
private Integer bRowPerPage;

//  새글표시여부
private Integer bUseNew;

//  hot표시여부
private Integer bUseHot;

//  글갯수
private Integer bNumberOfPosts;

//  덧글갯수
private Integer bNumberOfReply;

//  업로드 파일 경로
private String bFilepath;

public String getBName() {
    return bName;
}

public void setBName(String bName) {
    this.bName = bName;
}

public String getBSubject() {
    return bSubject;
}

public void setBSubject(String bSubject) {
    this.bSubject = bSubject;
}

public Integer getBReadLevel() {
    return bReadLevel;
}

public void setBReadLevel(Integer bReadLevel) {
    this.bReadLevel = bReadLevel;
}

public Integer getBWriteLevel() {
    return bWriteLevel;
}

public void setBWriteLevel(Integer bWriteLevel) {
    this.bWriteLevel = bWriteLevel;
}

public Integer getBUploadLevel() {
    return bUploadLevel;
}

public void setBUploadLevel(Integer bUploadLevel) {
    this.bUploadLevel = bUploadLevel;
}

public Integer getBDownloadLevel() {
    return bDownloadLevel;
}

public void setBDownloadLevel(Integer bDownloadLevel) {
    this.bDownloadLevel = bDownloadLevel;
}

public Integer getBUseCategory() {
    return bUseCategory;
}

public void setBUseCategory(Integer bUseCategory) {
    this.bUseCategory = bUseCategory;
}

public String getBCategoryList() {
    return bCategoryList;
}

public void setBCategoryList(String bCategoryList) {
    this.bCategoryList = bCategoryList;
}

public Integer getBUseFile() {
    return bUseFile;
}

public void setBUseFile(Integer bUseFile) {
    this.bUseFile = bUseFile;
}

public Integer getBUseRss() {
    return bUseRss;
}

public void setBUseRss(Integer bUseRss) {
    this.bUseRss = bUseRss;
}

public Integer getBUseGood() {
    return bUseGood;
}

public void setBUseGood(Integer bUseGood) {
    this.bUseGood = bUseGood;
}

public Integer getBUseIp() {
    return bUseIp;
}

public void setBUseIp(Integer bUseIp) {
    this.bUseIp = bUseIp;
}

public Integer getBUseState() {
    return bUseState;
}

public void setBUseState(Integer bUseState) {
    this.bUseState = bUseState;
}

public Integer getBUseTel() {
    return bUseTel;
}

public void setBUseTel(Integer bUseTel) {
    this.bUseTel = bUseTel;
}

public Integer getBUsePrice() {
    return bUsePrice;
}

public void setBUsePrice(Integer bUsePrice) {
    this.bUsePrice = bUsePrice;
}

public Integer getBRowPerPage() {
    return bRowPerPage;
}

public void setBRowPerPage(Integer bRowPerPage) {
    this.bRowPerPage = bRowPerPage;
}

public Integer getBUseNew() {
    return bUseNew;
}

public void setBUseNew(Integer bUseNew) {
    this.bUseNew = bUseNew;
}

public Integer getBUseHot() {
    return bUseHot;
}

public void setBUseHot(Integer bUseHot) {
    this.bUseHot = bUseHot;
}

public Integer getBNumberOfPosts() {
    return bNumberOfPosts;
}

public void setBNumberOfPosts(Integer bNumberOfPosts) {
    this.bNumberOfPosts = bNumberOfPosts;
}

public Integer getBNumberOfReply() {
    return bNumberOfReply;
}

public void setBNumberOfReply(Integer bNumberOfReply) {
    this.bNumberOfReply = bNumberOfReply;
}

public String getBFilepath() {
    return bFilepath;
}

public void setBFilepath(String bFilepath) {
    this.bFilepath = bFilepath;
}

// BoardManager 모델 복사
public void CopyData(BoardManager param)
{
    this.bName = param.getBName();
    this.bSubject = param.getBSubject();
    this.bReadLevel = param.getBReadLevel();
    this.bWriteLevel = param.getBWriteLevel();
    this.bUploadLevel = param.getBUploadLevel();
    this.bDownloadLevel = param.getBDownloadLevel();
    this.bUseCategory = param.getBUseCategory();
    this.bCategoryList = param.getBCategoryList();
    this.bUseFile = param.getBUseFile();
    this.bUseRss = param.getBUseRss();
    this.bUseGood = param.getBUseGood();
    this.bUseIp = param.getBUseIp();
    this.bUseState = param.getBUseState();
    this.bUseTel = param.getBUseTel();
    this.bUsePrice = param.getBUsePrice();
    this.bRowPerPage = param.getBRowPerPage();
    this.bUseNew = param.getBUseNew();
    this.bUseHot = param.getBUseHot();
    this.bNumberOfPosts = param.getBNumberOfPosts();
    this.bNumberOfReply = param.getBNumberOfReply();
    this.bFilepath = param.getBFilepath();
}
}