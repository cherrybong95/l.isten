package org.edu.lotte.business;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.edu.lotte.model.KeyandVal;
import org.springframework.stereotype.Service;

@Service
public class LServiceImple implements LService {
	@Resource
	private BusinessDAO dao;
	@Override
	public int alnalyze(Map<String, String> omap) {
		int result=0;
		String beforeToken= omap.get("content").trim();
		String item=beforeToken.substring(0,beforeToken.indexOf("의")).trim();
		String flavor= beforeToken.substring(beforeToken.indexOf("맛은")+2, beforeToken.indexOf("가격은"));
		String price=beforeToken.substring(beforeToken.indexOf("가격은")+3, beforeToken.indexOf("디자인은"));
		String design=beforeToken.substring(beforeToken.indexOf("디자인은")+4);
		System.out.println("토큰전달받음 "+flavor+"   "+design+"   "+price);
		Map<String,String> map= new HashMap<String,String>();
		map.put("item", item);
		System.out.println("서비스 아이템 전달받음 :"+map.get("item"));
		map.put("flavor", flavor.trim());
		map.put("design", design.trim());
		map.put("price", price.trim());
		map.put("orgWord", beforeToken);
		map.put("name", omap.get("name"));
		map.put("phoneNum", omap.get("phoneNum"));
		try{
		result=dao.insertEvaluation(map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	};
	@Override
	public List<String> getItemList() {
		List<String> list= dao.getItemList();
		return list;
		
	}
	@Override
	public Map<String, String> showGraph(String item) {
		Map<String,String> map = dao.showGraph(item);
		return map;
	}
	@Override
	public Map<String,List<KeyandVal>> getDetail(String item, String type) {
		 ;
		return dao.getDetail(item,type);
	}

}
