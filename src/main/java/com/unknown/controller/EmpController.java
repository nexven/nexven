package com.unknown.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.unknown.model.Emp;
import com.unknown.model.Mgr;
import com.unknown.service.EmpService;

@Controller
public class EmpController {
	
	static Log log = LogFactory.getLog(EmpController.class);
	
	@Autowired
	EmpService empService;

	
	
	@RequestMapping(value="/emp/list")
	@ResponseBody
	public Map<String, Object> getList() {
		Map<String, Object> result = new HashMap<>();
		
		result.put("success", true);
		result.put("message", "조회성공");
		
		result.put("data", empService.getList());
		
		return result;		
	}
	
	@RequestMapping(value="/emp/page")
	@ResponseBody
	public Map<String, Object> getPage(Integer pageNo) {
		Map<String, Object> response = new HashMap<>();
		int count = empService.getCount();
		List<Emp> emps = empService.getPage(pageNo);
		
		response.put("pageNo", pageNo);
		response.put("totalCount", count);
		response.put("emps", emps);
		return response;
	}
	
	@RequestMapping(value="/emp/mgrs")
	@ResponseBody
	public List<Mgr> getMgrs() {
		List<Mgr> mgrs = empService.getMgrs();
		
		return mgrs;		
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.GET)
	@ResponseBody
	public Emp getEmp(Integer empno) {
		log.info("getEmp() empno=" + empno);
		
		return empService.getEmp(empno);
	}
	
	
	@RequestMapping(value="/emp", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> postDept(@RequestBody Emp emp){
		log.info("loc = " + emp.getEmpno());
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서 추가 성공.");
		
		try {
			empService.insert(emp);
		} catch (DuplicateKeyException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "코드 중복입니다. 다시 입력하세요.");
		}	
		
		
		return response;
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.PUT)
	@ResponseBody
	public Map<String, Object> putDept(@RequestBody Emp emp){
		log.info("loc = " + emp.getEmpno());
		Map<String, Object> response = new HashMap<>();
		
		response.put("success", true);
		response.put("message", "부서 수정 성공.");
		
		try {
			empService.updateByEmpno(emp);
		} catch (RuntimeException e) {
			log.info(e.getMessage());
			response.put("success", false);
			response.put("message", "수정 에러입니다. 다시 입력하세요.");
		}	
		
		
		return response;
	}
	
	@RequestMapping(value="/emp", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> deleteEmp(Integer empno) {
		Map<String, Object> response = new HashMap<>();
		response.put("success", true);
		response.put("message", "직원 삭제 성공");
		try {
			empService.delete(empno);
		} catch (RuntimeException e) {
			response.put("success", false);
			response.put("message", "직원 삭제 실패");
		} 
		return response;
	}
	
	

}
