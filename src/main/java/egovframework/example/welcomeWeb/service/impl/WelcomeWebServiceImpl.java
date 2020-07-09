package egovframework.example.welcomeWeb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.welcomeWeb.service.WelcomeWebService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.example.cmmn.JsonUtil;

@Service
public class WelcomeWebServiceImpl implements WelcomeWebService{
	
	@Resource
	private WelcomeWebMapper welcomeWebMapper;

	
	@Override
	public List<EgovMap> selectPieChartServiceList() throws Exception {
		// TODO Auto-generated method stub
		return welcomeWebMapper.selectPieChartServiceList();
	}
	
	@Override
	public List<EgovMap> selectBarChartServiceList() throws Exception {
		// TODO Auto-generated method stub
		return welcomeWebMapper.selectBarChartServiceList();
	}

	@Override
	public List<EgovMap> selectWelcomeWebServiceList(Map<String, Object> paramMap) throws Exception{
		
		
		return welcomeWebMapper.selectWelcomeWebServiceList(paramMap);
		
	}

	@Override
	public String saveForumServiceList(Map<String, Object> paramMap) throws Exception {
		
		EgovMap resultMap = new EgovMap();
		
		welcomeWebMapper.insertForumServiceList(paramMap);

		resultMap.put("result", "SUCCESS");
		
		System.out.println(resultMap);		
		return JsonUtil.EgovMapToJson(resultMap);
	}

	@Override
	public List<EgovMap> selectForumServiceList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return welcomeWebMapper.selectForumServiceList(paramMap);
	}

	

	
}
