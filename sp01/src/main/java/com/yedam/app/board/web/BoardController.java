package com.yedam.app.board.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.service.BoardService;
import com.yedam.app.board.service.BoardVO;


@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
//	@Autowired
//	DeptService deptService;
	
	//GET : 조회, 빈페이지 호출(회원가입 폼)
	
	//POST : 데이터 조작(등록, 수정, 삭제)
	
	//전체조회 uri - boardList / return -board/boardlist
	@GetMapping("boardList")
	public String getBoardList(Model model) {
		List<BoardVO> list = boardService.getBoardAll();
		model.addAttribute("boardList", list);
		return "board/boardList";
	}
	//단건조회 uri - boardInfo / return -board/boardInfo / parameter - BoardVO
	@GetMapping("boardInfo")
	public String getBoardInfo(BoardVO boardVO, Model model) {
		BoardVO findVO = boardService.getBoardInfo(boardVO);
		model.addAttribute("boardInfo", findVO);
		return "board/boardInfo";
	}
	//board등록 - Form -> 빈페이지 필요			 페이지 	uri - boardInsert/ return - board/boardInsert
	@GetMapping("boardInsert")
	public String insertBoardInfoForm() {
		return "board/boardInsert";
	}
	//board등록 - PROCESS						처리		uri - boardInsert/ return - 결과 상관 없이 전체조회 다시 호출 / parameter - BoardVO
	@PostMapping("boardInsert")
	public String insertBoardInfoProcess(BoardVO boardVO) {
//		int bno = boardService.insertBoardInfo(boardVO);
//		String path = null;
//		if(bno > -1) {
//			path = "redirect:boardInfo?bno="+bno;
//		}else {
//			path = "redirect:boardList";
//		}
//		return path;
		boardService.insertBoardInfo(boardVO);
		return "redirect:boardList";
	}

	/*
	 * //board수정 - PROCESS : Ajax -> 무조건 @ResponseBody 사용 페이지 uri - boardUpdate/ return - board/boardUpdate / parameter - BoardVO 
	 * //1) queryString 방식 -> 커맨드객체
	 * 
	 * @PostMapping("boardUpdate")
	 * 
	 * @ResponseBody public Map<String, Object> boardUpdateProcess(BoardVO boardVO){
	 * return boardService.updateBoardInfo(boardVO); }
	 * 
	 *  //2) Json 방식 -> @RequestBody 처리 uri - boardUpdate/ return - 수정결과 데이터(Map) / parameter - BoardVO
	 * 
	 * @PostMapping("boardUpdateAjax")
	 * 
	 * @ResponseBody public Map<String, Object> boardUpdateAjaxProcess(@RequestBody
	 * BoardVO boardVO){ return boardService.updateBoardInfo(boardVO); }
	 */
	
	//수정 - 페이지 단건조회 사용해서 작업
		@GetMapping("boardUpdate")
		public String boardUpdate(BoardVO boardVO, Model model) {
			BoardVO findVO = boardService.getBoardInfo(boardVO);
			model.addAttribute("boardInfo", findVO);
			return "board/boardUpdate2";
		}
	//수정 -처리 Ajax
		@PostMapping("boardUpdate")
		@ResponseBody
		public Map boardUpdateAjaxProcess(BoardVO boardVO, Model model) {
			return boardService.updateBoardInfo(boardVO);
		}
		
		
		
	//board삭제 - PROCESS
	//get 방식
	@GetMapping("boardDelete")
	public String boardDelete(@RequestParam Integer bno) {
		boardService.deleteBoardInfo(bno);
		return "redirect:boardList";
	}
	
	//post 방식
	
	
	
	
	
	
	
	
	
	
}
