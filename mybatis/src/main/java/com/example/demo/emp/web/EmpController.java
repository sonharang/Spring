package com.example.demo.emp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.emp.mapper.EmpMapper;

@Controller
public class EmpController {
	@Autowired
	EmpMapper empMapper;
	@GetMapping("/admin/empList")
	public String list(Model model){ 
		model.addAttribute("list", empMapper.getEmpList(null));
		return "empList"; 
	}
}
