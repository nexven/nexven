package com.unknown.mapper;


import java.util.List;

import com.unknown.model.Board;

public interface BoardMapper {
	List<Board> selectAll();
	List<Board> selectBybName(String bName);
	Board selectBybNum(Integer bNum);
	int insert(Board board);
	int updateBybNum(Board board);
	int deleteBybNum(int bNum);
}
