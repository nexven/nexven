package com.unknown.mapper;


import java.util.List;

import com.unknown.model.GameDb;

public interface GameDbMapper {
	List<GameDb> selectAll();
	GameDb selectBygNum(int gNum);
	int insert(GameDb gameDb);
	int updateBygNum(GameDb gameDb);
	int deleteBygNum(int gNum);
}
