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

import com.unknown.model.Board;
import com.unknown.service.BoardService;


@Controller
public class BoardController {
	static Log log = LogFactory.getLog(BoardController.class);
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board/list")
	@ResponseBody
	public List<Board> getList() {
		return boardService.getList();
	}
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	@ResponseBody
	public List<Board> getBoard(String bName){
		System.out.println("getBoard:"+bName);
		return boardService.getBoard(bName);
	}
	
	@RequestMapping(value="/boardnum", method=RequestMethod.GET)
	@ResponseBody
	public Board getBoardnum(Integer bNum){
		log.info("getBoardnum"+bNum);
		return boardService.getBoardnum(bNum);
	}
	
	@RequestMapping(value="/board", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> putBoard(@RequestBody Board board){
		
		
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "글 수정 성공.");
		
		try {
			boardService.update(board);
		} catch (RuntimeException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		return response;
	}
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postBoard(@RequestBody Board board){
	
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "글 추가 성공.");
		
		try {
			boardService.insert(board);
		} catch (DuplicateKeyException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "중복입니다. 다시 입력하세요.");
		}	
		
		return response;
	}
	
	@RequestMapping(value="/board", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteBoard(Integer bNum){		
		log.info("bNum="+bNum);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "글이 삭제되었습니다.");
		
		try{
			boardService.delete(bNum);
		}catch (RuntimeException ex){
			log.info(ex.getMessage());
			response.put("success", false);
			response.put("message", "글 삭제 에러입니다. 다시 확인하세요.");
		}
		return response;
		
	}
}
