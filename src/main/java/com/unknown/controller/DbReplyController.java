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

import com.unknown.model.DbReply;
import com.unknown.model.GameDb;
import com.unknown.service.DbReplyService;


@Controller
public class DbReplyController {
	static Log log = LogFactory.getLog(DbReplyController.class);
	
	@Autowired
	DbReplyService dbReplyService;
	
	@RequestMapping(value="/dbreply", method=RequestMethod.GET)
	@ResponseBody
	public List<DbReply> getList(String gName){
		log.info("getgName"+gName);
		return dbReplyService.getList(gName);
	}
	
	@RequestMapping(value="/dbreply", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> putDbReply(@RequestBody DbReply dbReply){
		log.info("DbReplyNum = " + dbReply.getDbReplyNum());
		log.info("MId = " + dbReply.getMId());
		log.info("DbReplyDate = " + dbReply.getDbReplyDate());
		log.info("MIp = " + dbReply.getMIp());
		log.info("DbReplyContent = " + dbReply.getDbReplyContent());
		log.info("DbRate = " + dbReply.getDbRate());
		log.info("GName = " + dbReply.getGName());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "DB 덧글 수정 성공.");
		
		try {
			dbReplyService.update(dbReply);
		} catch (RuntimeException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		return response;
	}
	
	@RequestMapping(value="/dbReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postDbReply(@RequestBody DbReply dbReply){
		log.info("DbReplyNum = " + dbReply.getDbReplyNum());
		log.info("MId = " + dbReply.getMId());
		log.info("DbReplyDate = " + dbReply.getDbReplyDate());
		log.info("MIp = " + dbReply.getMIp());
		log.info("DbReplyContent = " + dbReply.getDbReplyContent());
		log.info("DbRate = " + dbReply.getDbRate());
		log.info("GName = " + dbReply.getGName());
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "게임DB 추가 성공.");
		
		try {
			dbReplyService.insert(dbReply);
		} catch (DuplicateKeyException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		return response;
	}
	
	@RequestMapping(value="/dbreply", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteDbReply(Integer dbReplyNum){		
		log.info("dbReplyNum="+dbReplyNum);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "댓글이 삭제되었습니다.");
		
		try{
			dbReplyService.delete(dbReplyNum);
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
