package com.unknown.mapper;


import java.util.List;

import com.unknown.model.Board;

public interface BoardMapper {
	List<Board> selectAll();
	Board selectBybNum(String bName);
	int insert(Board board);
	int updateBybNum(Board board);
	int deleteBybNum(int bNum);
}
