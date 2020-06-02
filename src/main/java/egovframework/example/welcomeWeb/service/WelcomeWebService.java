package egovframework.example.welcomeWeb.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface WelcomeWebService {

	
	List<EgovMap> selectPieChartServiceList() throws Exception;

	List<EgovMap> selectWelcomeWebServiceList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectBarChartServiceList() throws Exception;

	

}
