package com.unknown.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.unknown.model.GameSchedule;
import com.unknown.service.GameScheduleService;


@Controller
public class GameScheduleController {
	static Log log = LogFactory.getLog(GameScheduleController.class);
	
	@Autowired
	GameScheduleService gameScheduleService;
	
	@RequestMapping(value="/gameschedule/list")
	@ResponseBody
	public List<GameSchedule> getList() {
		return gameScheduleService.getList();
	}
	
	@RequestMapping(value="/gameschedule", method=RequestMethod.GET)
	@ResponseBody
	public GameSchedule getGameSchedule(Integer sNum){
		log.info("getGameSchedule"+sNum);
		return gameScheduleService.getGameSchedule(sNum);
	}
	
	@RequestMapping(value="/gameschedule", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> putGameSchedule(@RequestBody GameSchedule gameSchedule){
		log.info("sNum = " + gameSchedule.getSNum());
		log.info("SName = " + gameSchedule.getSName());
		log.info("SStart = " + gameSchedule.getSStart());
		log.info("SEnd = " + gameSchedule.getSEnd());
		log.info("SType = " + gameSchedule.getSType());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "게임스케쥴 수정 성공.");
		
		try {
			gameScheduleService.update(gameSchedule);
		} catch (RuntimeException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		return response;
	}
	
	@RequestMapping(value="/gameschedule", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postGameSchedule(@RequestBody GameSchedule gameSchedule){
		log.info("sNum = " + gameSchedule.getSNum());
		log.info("SName = " + gameSchedule.getSName());
		log.info("SStart = " + gameSchedule.getSStart());
		log.info("SEnd = " + gameSchedule.getSEnd());
		log.info("SType = " + gameSchedule.getSType());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "게임스케쥴 추가 성공.");
		
		try {
			gameScheduleService.insert(gameSchedule);
		} catch (DuplicateKeyException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		return response;
	}
	
	@RequestMapping(value="/gameschedule", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteGameSchedule(Integer sNum){		
		log.info("sNum="+sNum);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "스케쥴이 삭제되었습니다.");
		
		try{
			gameScheduleService.delete(sNum);
		}catch (RuntimeException ex){
			log.info(ex.getMessage());
			response.put("success", false);
			response.put("message", "스케쥴 삭제 에러입니다. 다시 확인하세요.");
		}
		return response;
		
	}
}
