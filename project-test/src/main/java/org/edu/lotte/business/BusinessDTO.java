package org.edu.lotte.business;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BusinessDTO {
	private SqlSessionTemplate template;
	public Object getChartData() {
		return template.selectOne("");
		
	}


	
	
	
	
}
