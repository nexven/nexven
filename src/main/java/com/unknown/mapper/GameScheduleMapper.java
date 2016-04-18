package com.unknown.mapper;


import java.util.List;

import com.unknown.model.GameSchedule;

public interface GameScheduleMapper {
	List<GameSchedule> selectAll();
	GameSchedule selectBysNum(int sNum);
	int insert(GameSchedule gameSchedule);
	int updateBysNum(GameSchedule gameSchedule);
	int deleteBysNum(int dbReplyNum);
}
