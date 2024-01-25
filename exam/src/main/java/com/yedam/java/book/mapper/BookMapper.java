package com.yedam.java.book.mapper;

import java.util.List;

import com.yedam.java.book.service.BookVO;


public interface BookMapper {
	int insertBook(BookVO bookVO);
	public List<BookVO> getBookList();
	public List<BookVO> getRentList();
}
