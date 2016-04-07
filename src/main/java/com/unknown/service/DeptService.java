package com.unknown.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.DeptMapper;
import com.unknown.model.Dept;

@Service
public class DeptService {
	//필드주입
	@Autowired
	DeptMapper deptMapper;
	
	@Transactional
	public List<Dept> getlist(){
		
		List<Dept> depts = deptMapper.selectAll();
		
		return depts;
	}
	@Transactional
	public Dept getDept(Integer deptno){
		return deptMapper.selectByDeptno(deptno);
	}
	
	@Transactional
	public void insert(Dept dept){
		deptMapper.insert(dept);
	}
	
	@Transactional
	public void update(Dept dept){
		deptMapper.updateByDeptno(dept);
	}
	
	@Transactional
	public Dept delete(Integer deptno){
		Dept dept = deptMapper.selectByDeptno(deptno);
		deptMapper.deleteByDeptno(deptno);
		return dept;		
	}
	
	
}
