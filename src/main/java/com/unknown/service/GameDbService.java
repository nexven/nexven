package com.unknown.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.GameDbMapper;
import com.unknown.model.GameDb;

@Service
public class GameDbService {
	Log log = LogFactory.getLog(GameDbService.class);
	
	//필드주입
	@Autowired
	GameDbMapper gameDbMapper;
	
	@Transactional
	public List<GameDb> getList(){
		
		List<GameDb> games = gameDbMapper.selectAll();
		return games;
	}
	
	
	
	@Transactional
	public GameDb getGameDb(Integer gnum){
		return gameDbMapper.selectBygNum(gnum);
	}
	
	@Transactional
	public int getCount() {
		return gameDbMapper.selectCount();
	}
	
	@Transactional
	public List<GameDb> getPage(int pageNo) {
		Map<String, Integer> paging = new HashMap<>();
		int itemPerPage = 10;
		int firstItem = pageNo * itemPerPage - (itemPerPage - 1);
		int lastItem = firstItem + (itemPerPage - 1);
		paging.put("firstItem", firstItem);
		paging.put("lastItem", lastItem);
		List<GameDb> games = gameDbMapper.selectPage(paging);
		
		return games;
	}
	
	@Transactional
	public void insert(GameDb gameDb){
		gameDbMapper.insert(gameDb);
	}
	
	@Transactional
	public void update(GameDb gameDb){
		gameDbMapper.updateBygNum(gameDb);
	}
	
	@Transactional
	public GameDb delete(Integer gnum){
		GameDb gameDb = gameDbMapper.selectBygNum(gnum);
		gameDbMapper.deleteBygNum(gnum);
		return gameDb;		
	}
	
	
}
