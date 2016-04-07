package com.unknown.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unknown.mapper.EmpMapper;
import com.unknown.model.Emp;
import com.unknown.model.Mgr;

@Service
public class EmpService {
	
	//필드주입
	@Autowired
	EmpMapper empMapper;
	
	@Transactional
	public List<Emp> getList() {
		
		List<Emp> Emps = empMapper.selectAll();
		
		return Emps;
	}
	
	@Transactional
	public int getCount() {
		
		return empMapper.selectCount();
	}
	
	@Transactional
	public List<Emp> getPage(int pageNo) {
		Map<String, Integer> paging = new HashMap<>();
		int itemPerPage = 5;
		int firstItem = pageNo * itemPerPage - (itemPerPage - 1);
		int lastItem = firstItem + (itemPerPage - 1);
		paging.put("firstItem", firstItem);
		paging.put("lastItem", lastItem);
		List<Emp> Emps = empMapper.selectPage(paging);
		
		return Emps;
	}
	
	@Transactional
	public List<Mgr> getMgrs() {
		
		List<Mgr> Emps = empMapper.selectMgrs();
		
		return Emps;
	}
	
	@Transactional
	public Emp getEmp(Integer Empno) {
		return empMapper.selectByEmpno(Empno);
	}
	
	@Transactional
	public void insert(Emp Emp) {
		empMapper.insert(Emp);
	}
	
	@Transactional
	public void updateByEmpno(Emp Emp) {
		empMapper.updateByEmpno(Emp);
	}
	
	@Transactional
	public Emp delete(Integer Empno) {
		
		Emp Emp = empMapper.selectByEmpno(Empno);
		if(Emp == null)
			//throw new EmptyEmpException();
		empMapper.deleteByEmpno(Empno);
		return Emp;
	}
	
	
	
	
	
}
