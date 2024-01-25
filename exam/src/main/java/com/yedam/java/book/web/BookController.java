package com.yedam.java.book.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.java.book.service.BookService;
import com.yedam.java.book.service.BookVO;

@Controller
public class BookController {

	@Autowired
	BookService bookService;
	
	//도서목록 조회
	@GetMapping("bookList")
	public String getBookList(Model model) {
		List<BookVO> list = bookService.getBookList();
		model.addAttribute("bookList", list);
		return "book/bookList";
	}
	
	//등록
	@GetMapping("insertBook")
	public String insertBookForm() {
		return "book/insertBook";
	}
	
	@PostMapping("insertBook")
	public String insertBookProcess(BookVO bookVO) {
		bookService.insertBook(bookVO);
		return "redirect:insertBook";
	}
	
	//대여목록 조회
		@GetMapping("rentList")
		public String getRentList(Model model) {
			List<BookVO> list = bookService.getRentList();
			model.addAttribute("rentList", list);
			return "book/rentList";
		}
}
