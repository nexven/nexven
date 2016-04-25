package com.unknown.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.unknown.model.Emp;
import com.unknown.model.GameDb;
import com.unknown.service.GameDbService;


@Controller
public class GameDbController {
	static Log log = LogFactory.getLog(GameDbController.class);
	
	@Autowired
	GameDbService gameDbService;
	
	@RequestMapping(value="/gamedb/list")
	@ResponseBody
	public List<GameDb> getList() {
		System.out.println(gameDbService.getList());
		return gameDbService.getList();
	}
	
	@RequestMapping(value="/gamedb", method=RequestMethod.GET)
	@ResponseBody
	public GameDb getGameDb(Integer gNum){
		log.info("getGameDb"+gNum);
		return gameDbService.getGameDb(gNum);
	}
	
	@RequestMapping(value="/gamedb/page")
	@ResponseBody
	public Map<String, Object> getPage(Integer pageNo) {
		Map<String, Object> response = new HashMap<>();
		int count = gameDbService.getCount();
		List<GameDb> games = gameDbService.getPage(pageNo);
		
		response.put("pageNo", pageNo);
		response.put("totalCount", count);
		response.put("games", games);
		return response;
	}
	
	@RequestMapping(value="/gamedb/count")
	@ResponseBody
	public Integer getCount() {
		return gameDbService.getCount();
	}
	
	
	@RequestMapping(value="/gamedb", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> putGameDb(@RequestBody GameDb gameDb){
		log.info("gNum = " + gameDb.getGNum());
		log.info("gName = " + gameDb.getGName());
		log.info("gPublisher = " + gameDb.getGPublisher());
		log.info("gGenre = " + gameDb.getGGenre());
		log.info("gMaker = " + gameDb.getGMaker());
		log.info("gPlatform = " + gameDb.getGPlatform());
		log.info("gStartDate = " + gameDb.getGStartDate());
		log.info("gServiceType = " + gameDb.getGServiceType());
		log.info("gRating = " + gameDb.getGRating());
		log.info("gHomepage = " + gameDb.getGHomepage());
		log.info("gIntroduce = " + gameDb.getGIntroduce());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "게임DB 추가 성공.");
		
		try {
			gameDbService.update(gameDb);
		} catch (RuntimeException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		return response;
	}
	
	@RequestMapping(value="/gamedb", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postGameDb(@RequestBody GameDb gameDb){
		log.info("gName = " + gameDb.getGName());
		log.info("gPublisher = " + gameDb.getGPublisher());
		log.info("gGenre = " + gameDb.getGGenre());
		log.info("gMaker = " + gameDb.getGMaker());
		log.info("gPlatform = " + gameDb.getGPlatform());
		log.info("gStartDate = " + gameDb.getGStartDate());
		log.info("gServiceType = " + gameDb.getGServiceType());
		log.info("gRating = " + gameDb.getGRating());
		log.info("gHomepage = " + gameDb.getGHomepage());
		log.info("gIntroduce = " + gameDb.getGIntroduce());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "게임DB 추가 성공.");
		
		try {
			gameDbService.insert(gameDb);
		} catch (DuplicateKeyException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		
		return response;
	}
	
	@RequestMapping(value="/gamedb", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteGameDb(Integer gNum){		
		log.info("gNum="+gNum);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "게임이 삭제되었습니다.");
		
		try{
			gameDbService.delete(gNum);
		}catch(DataIntegrityViolationException ex){
			log.info("Error : "+ex);
			response.put("success", false);
			response.put("message", "댓글이 포함된 게임은 삭제할 수 없습니다.");
		}catch (RuntimeException ex2){
			log.info(ex2.getMessage());
			response.put("success", false);
			response.put("message", "게임삭제 에러입니다. 다시 확인하세요.");
		}
		return response;
		
	}
	
	
}
