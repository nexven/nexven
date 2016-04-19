package com.unknown.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.EmpMapper;
import com.unknown.mapper.MemberMapper;
import com.unknown.model.Emp;
import com.unknown.model.Member;
import com.unknown.model.Mgr;

@Service
public class MemberService {
	
	//필드주입
	@Autowired
	MemberMapper memberMapper;
	
	@Transactional
	public void insert(Member member) {
		memberMapper.insert(member);
	}
	
	@Transactional
	public Integer idcheck(String mId) {
		return memberMapper.idcheck(mId);
	}
	
	@Transactional
	public Integer nickcheck(String mId) {
		return memberMapper.nickcheck(mId);
	}
	
	@Transactional
	public Member selectBymid(String mId) {
		return memberMapper.selectBymid(mId);
	}
	
	@Transactional
	public Map<String,String> selectBymid2(String mId) {
		Map<String,String> map = memberMapper.selectBymid2(mId); 
		return map;
	}
	
	

	
	
	
	
	
}
