package com.unknown.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.GameDbMapper;
import com.unknown.model.Dept;
import com.unknown.model.GameDb;

@Service
public class GameDbService {
	//필드주입
	@Autowired
	GameDbMapper gameDbMapper;
	
	@Transactional
	public List<GameDb> getList(){
		
		List<GameDb> games = gameDbMapper.selectAll();
		
		return games;
	}
	
	
	
	@Transactional
	public GameDb getGameDb(Integer gNum){
		return gameDbMapper.selectBygNum(gNum);
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
	public GameDb delete(Integer gNum){
		GameDb gameDb = gameDbMapper.selectBygNum(gNum);
		gameDbMapper.deleteBygNum(gNum);
		return gameDb;		
	}
	
	
}
