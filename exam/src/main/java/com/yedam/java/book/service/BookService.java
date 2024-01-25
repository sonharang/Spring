package com.yedam.java.book.service;

import java.util.List;

public interface BookService {
	int insertBook(BookVO bookVO);
	public List<BookVO> getBookList();
	public List<BookVO> getRentList();
}

