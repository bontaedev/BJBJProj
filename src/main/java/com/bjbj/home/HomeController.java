package com.bjbj.home;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bjbj.books.BookService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HomeController {
	
	@Autowired
	private BookService service;
	
	// 메인 페이지 작업
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		String newBooksList = service.getBookList("ItemNewAll", "");
		
		String allList = service.getBookList("Bestseller", ""); // 종합 카테고리
		
		// ObjectMapper를 통해 가져온 String을 Map형식으로 데이터 변환 (databind)
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> newBooksMap = mapper.readValue(newBooksList, Map.class);
		model.addAttribute("newBooks", newBooksMap.get("item"));
		
		Map<String, Object> bestBooksMap = mapper.readValue(allList, Map.class);
		model.addAttribute("bestBooks", bestBooksMap.get("item"));
		
		return "main";
	}
	
	// Error
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	
}
