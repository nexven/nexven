package com.unknown.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.BoardMapper;
import com.unknown.model.Board;

@Service
public class BoardService {
	//필드주입
	@Autowired
	BoardMapper boardMapper;
	
	@Transactional
	public List<Board> getList(){
		
		List<Board> boards = boardMapper.selectAll();
		
		return boards;
	}
	
	@Transactional
	public Board getBoard(String bNum){
		return boardMapper.selectBybNum(bNum);
	}
	
	@Transactional
	public void insert(Board board){
		boardMapper.insert(board);
	}
	
	@Transactional
	public void update(Board board){
		boardMapper.updateBybNum(board);
	}
	
	@Transactional
	public Board delete(Integer bNum,String bName){
		Board board = boardMapper.selectBybNum(bName);
		boardMapper.deleteBybNum(bNum);
		return board;		
	}
	
	
}
