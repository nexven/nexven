package com.unknown.mapper;


import java.util.List;
import java.util.Map;

import com.unknown.model.Emp;
import com.unknown.model.Mgr;

public interface EmpMapper {

	List<Emp> selectAll();
	List<Emp> selectPage(Map<String, Integer> paging);
	List<Mgr> selectMgrs();
	Emp selectByEmpno(int empno);
	
	int selectCount();
	int insert(Emp emp);
	int updateByEmpno(Emp emp);
	int deleteByEmpno(int empno);
}
