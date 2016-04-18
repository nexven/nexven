package com.unknown.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.DbReplyMapper;
import com.unknown.model.DbReply;
import com.unknown.model.GameDb;

@Service
public class DbReplyService {
	//필드주입
	@Autowired
	DbReplyMapper dbReplyMapper;
	
	@Transactional
	public List<DbReply> getList(){
		
		List<DbReply> replys = dbReplyMapper.selectAll();
		
		return replys;
	}
	
	@Transactional
	public List<DbReply> getList(String gName){
		
		List<DbReply> replys = dbReplyMapper.selectBygName(gName);
		
		return replys;
	}
	
	
	@Transactional
	public DbReply getDbReply(int dbReplyNum){
		return dbReplyMapper.selectBydbReplyNum(dbReplyNum);
	}
	
	@Transactional
	public void insert(DbReply dbReply){
		dbReplyMapper.insert(dbReply);
	}
	
	@Transactional
	public void update(DbReply dbReply){
		dbReplyMapper.updateBydbReplyNum(dbReply);
	}
	
	@Transactional
	public DbReply delete(Integer dbReplyNum){
		DbReply dbReply = dbReplyMapper.selectBydbReplyNum(dbReplyNum);
		dbReplyMapper.deleteBydbReplyNum(dbReplyNum);
		return dbReply;		
	}
	
	
}
