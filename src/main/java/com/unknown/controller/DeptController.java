package com.unknown.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.unknown.model.Dept;
import com.unknown.service.DeptService;


@Controller
public class DeptController {
	static Log log = LogFactory.getLog(DeptController.class);
	
	@Autowired
	DeptService deptService;
	
	@RequestMapping(value="/dept/list")
	@ResponseBody
	public List<Dept> getList() {
		return deptService.getlist();
	}
	@RequestMapping(value="/dept", method=RequestMethod.GET)
	@ResponseBody
	public Dept getDept(Integer deptno){
		log.info("getdept"+deptno);
		return deptService.getDept(deptno);
	}
	
	@RequestMapping(value="/dept", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> putDept(@RequestBody Dept dept){
		log.info("deptno = " + dept.getDeptno());
		log.info("dname = " + dept.getDname());
		log.info("loc = " + dept.getLoc());
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서 추가 성공.");
		
		try {
			deptService.update(dept);
		} catch (RuntimeException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "코드 중복입니다. 다시 입력하세요.");
		}	
		
		
		return response;
	}
	
	@RequestMapping(value="/dept", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postDept(@RequestBody Dept dept){
		log.info("deptno = " + dept.getDeptno());
		log.info("dname = " + dept.getDname());
		log.info("loc = " + dept.getLoc());
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서 추가 성공.");
		
		try {
			deptService.insert(dept);
		} catch (DuplicateKeyException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "코드 중복입니다. 다시 입력하세요.");
		}	
		
		
		return response;
	}
	
	@RequestMapping(value="/dept", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteDept(Integer deptno){		
		log.info("deptno="+deptno);
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서가 삭제되었습니다.");
		
		try{
			deptService.delete(deptno);
		}catch(DataIntegrityViolationException ex){
			log.info("Error : "+ex);
			response.put("success", false);
			response.put("message", "직원이 포함된 부서는 삭제할 수 없습니다.");
		}catch (RuntimeException ex2){
			log.info(ex2.getMessage());
			response.put("success", false);
			response.put("message", "부서삭제 에러입니다. 다시 확인하세요.");
		}
		return response;
		
	}
	
	
}
