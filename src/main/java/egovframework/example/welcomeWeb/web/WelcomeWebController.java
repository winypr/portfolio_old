package egovframework.example.welcomeWeb.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.welcomeWeb.service.WelcomeWebService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class WelcomeWebController {
	
	@Resource 
	private WelcomeWebService welcomeWebService;
	
	@RequestMapping(value = "/main.do")
	public String initMain() throws Exception {
		
		return "main/main.tiles";
	}
	
	@RequestMapping(value = "/dataTable.do")
	public String dataTableInit(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		
		try {
			List<EgovMap> welcomeWebList 	= welcomeWebService.selectWelcomeWebServiceList(paramMap);
			List<EgovMap> pieChartList 		= welcomeWebService.selectPieChartServiceList();
			List<EgovMap> barChartList 		= welcomeWebService.selectBarChartServiceList();
			
			model.addAttribute("welcomeWeb", 	welcomeWebList);
			model.addAttribute("pieChart", 		pieChartList);
			model.addAttribute("barChart", 		barChartList);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "dataTable/dataTable.tiles";
	}
	
	@RequestMapping(value = "/pieChart.do")
	public String pieChartInit(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		System.out.println(paramMap);
		
		try {
			List<EgovMap> pieChartList 		= welcomeWebService.selectPieChartServiceList();
			List<EgovMap> barChartList 		= welcomeWebService.selectBarChartServiceList();
			
			model.addAttribute("pieChart", 		pieChartList);
			model.addAttribute("barChart", 		barChartList);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "pieChart/pieChart.tiles";
	}
	
	@RequestMapping("/tableList.do")
	public String tableListInit(ModelMap model) throws Exception {
		
		
		return "tableList/tableList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchTableList.do", produces = "application/json; charset=utf8")
	public String searchTableListInit(@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		List<EgovMap> tableList = new ArrayList<>();
		System.out.println(paramMap);
		try {
			
			tableList = welcomeWebService.selectWelcomeWebServiceList(paramMap);
			//
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return JsonUtil.ListToJson(tableList);
	}
	

	@RequestMapping("/forum.do")
	public String initForum(@RequestParam Map<String, Object>paramMap, ModelMap model) throws Exception {
		
		List<EgovMap> listMap = new ArrayList<>();
		
		try {
			listMap = welcomeWebService.selectForumServiceList(paramMap);
			model.addAttribute("forumList" , listMap);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return  "forum/forum.tiles";

	}
	

	@RequestMapping("/forumWrite.do")
	public String initForumWrite() throws Exception {
		
		
		return "forumWrite/forumWrite.tiles";
	}
	
	@ResponseBody
	@RequestMapping("/searchforumVeiw.do")
	public String searchforumVeiw(@RequestParam Map<String, Object>paramMap) throws Exception {
		
		List<EgovMap> listMap = new ArrayList<>();
				
		try {
			listMap = welcomeWebService.selectForumServiceList(paramMap);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println(listMap);
		return JsonUtil.ListToJson(listMap);
	}

	@RequestMapping("/forumView.do")
	public String initForumView() throws Exception {
		
		return "forumView/forumView.tiles";
	}
	
	@ResponseBody
	@RequestMapping("/saveForum.do")
	public String saveForum(@RequestParam Map<String, Object> paramMap) throws Exception {
	
		return welcomeWebService.saveForumServiceList(paramMap);
	}
	
	@RequestMapping("/{step}.do")
	public String initPage(@PathVariable Map <String, String> pathMap) throws Exception {
	
		String page[] 	= pathMap.get("step").toString().split("_");
		
		return  page[0] + "/" + page[1] ;

	}
	
	@RequestMapping("/tabMenu.do")
	public String initTabMenu() throws Exception {
		
		return  "main/tabMenu.tabtiles";

	}
	
}
