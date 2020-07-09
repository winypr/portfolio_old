package egovframework.example.welcomeWeb.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper
public interface WelcomeWebMapper {


	List<EgovMap> selectPieChartServiceList() throws Exception;
	
	List<EgovMap> selectBarChartServiceList()throws Exception;

	List<EgovMap> selectWelcomeWebServiceList(Map<String, Object> paramMap) throws Exception;

	String saveForumServiceList(Map<String, Object> paramMap) throws Exception;

	void insertForumServiceList(Map<String, Object> paramMap) throws Exception;

	List<EgovMap> selectForumServiceList(Map<String, Object> paramMap) throws Exception;

	

}
