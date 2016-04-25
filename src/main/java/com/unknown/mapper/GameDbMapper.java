package com.unknown.mapper;


import java.util.List;
import java.util.Map;

import com.unknown.model.GameDb;

public interface GameDbMapper {
	List<GameDb> selectAll();
	GameDb selectBygNum(int gnum);
	int insert(GameDb gameDb);
	int updateBygNum(GameDb gameDb);
	int deleteBygNum(int gnum);
	int selectCount();
	List<GameDb> selectPage(Map<String, Integer> paging);
}
