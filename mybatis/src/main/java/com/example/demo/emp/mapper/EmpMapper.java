package com.example.demo.emp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.emp.service.EmpVO;

@Mapper
public interface EmpMapper {
	public EmpVO getEmp(EmpVO empVO); 
	public List<EmpVO> getEmpList(EmpVO empVO);
	public void empInsert(EmpVO empVO);

}
