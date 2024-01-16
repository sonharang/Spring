package com.yedam.app.emp.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.EmpVO;

@Controller
public class EmpController {
	@Autowired
	EmpService empService;
	
//	@Autowired
//	DeptService deptService;
	
	//GET : 조회, 빈페이지 호출(회원가입 폼)
	
	//POST : 데이터 조작(등록, 수정, 삭제)
	
	//전체조회
	@GetMapping("empList")
	public String getEmpList(Model model) {
		List<EmpVO> list = empService.getEmpAll();
		model.addAttribute("empList", list);
		return "emp/empList";
	}
	//사원조회
	@GetMapping("empInfo")
	public String getEmpInfo(EmpVO empVO, Model model) {
		EmpVO findVO = empService.getEmpInfo(empVO);
		model.addAttribute("empInfo", findVO);
		return "emp/empInfo";
	}
	//사원등록 - Form -> 빈페이지 필요
	@GetMapping("empInsert")
	public String insertEmpInfoForm() {
		return "emp/empInsert";
	}
	//사원등록 - PROCESS
	@PostMapping("empInsert")
	public String insertEmpInfoProcess(EmpVO empVO) {
		int empId = empService.insertEmpInfo(empVO);
		String path = null;
		if(empId > -1) {
			path = "redirect:empInfo?employeeId="+empId;
		}else {
			path = "redirect:empList";
		}
		return path;
	}
	//사원수정 - PROCESS : Ajax -> 무조건 @ResponseBody 사용
	//1) queryString 방식 -> 커맨드 객체
	@PostMapping("empUpdate")
	@ResponseBody
	public Map<String, Object> empUpdateProcess(EmpVO empVO){
		return empService.updateEmpInfo(empVO);
	}	
	//2) Json 방식 -> @RequestBody
	@PostMapping("empUpdateAjax")
	@ResponseBody
	public Map<String, Object> empUpdateAjaxProcess(@RequestBody EmpVO empVO){
		return empService.updateEmpInfo(empVO);
	}	
	
	//사원삭제 - PROCESS
	
}
