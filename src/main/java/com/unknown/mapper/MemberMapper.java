package com.unknown.mapper;


import java.util.List;
import java.util.Map;

import com.unknown.model.Member;

public interface MemberMapper {
	List<Member> selectAll();
	Integer idcheck(String memid);
	Integer nickcheck(String memnick);
	Member selectBymid(String mId);
	Map<String,String> selectBymid2(String mId);
	int insert(Member member);
	int modify(Member member);
	int delete(Member member);
		
	

}
