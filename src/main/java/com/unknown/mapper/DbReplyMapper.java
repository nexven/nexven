package com.unknown.mapper;


import java.util.List;

import com.unknown.model.DbReply;

public interface DbReplyMapper {
	List<DbReply> selectAll();
	List<DbReply> selectBygName(String gName);
	DbReply selectBydbReplyNum(int dbReplyNum);
	int insert(DbReply dbReply);
	int updateBydbReplyNum(DbReply dbReply);
	int deleteBydbReplyNum(int dbReplyNum);
}
