package com.unknown.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.GameScheduleMapper;
import com.unknown.model.DbReply;
import com.unknown.model.GameDb;
import com.unknown.model.GameSchedule;

@Service
public class GameScheduleService {
	//필드주입
	@Autowired
	GameScheduleMapper gameScheduleMapper;
	
	@Transactional
	public List<GameSchedule> getList(){
		
		List<GameSchedule> games = gameScheduleMapper.selectAll();
		
		return games;
	}
	
	@Transactional
	public GameSchedule getGameSchedule(Integer sNum){
		return gameScheduleMapper.selectBysNum(sNum);
	}
	
	@Transactional
	public void insert(GameSchedule gameSchedule){
		gameScheduleMapper.insert(gameSchedule);
	}
	
	@Transactional
	public void update(GameSchedule gameSchedule){
		gameScheduleMapper.updateBysNum(gameSchedule);
	}
	
	@Transactional
	public GameSchedule delete(Integer sNum){
		GameSchedule gameSchedule = gameScheduleMapper.selectBysNum(sNum);
		gameScheduleMapper.deleteBysNum(sNum);
		return gameSchedule;		
	}
	
	
}
