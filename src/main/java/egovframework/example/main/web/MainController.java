package egovframework.example.main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = "/main.do")
	public String initMain() throws Exception {

		return "main/main.tiles";
	}
	@RequestMapping(value = "/main/main.do")
	public String initMain2() throws Exception {

		return "main/main.tiles";
	}
}