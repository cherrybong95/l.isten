package org.edu.lotte.business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.edu.lotte.model.KeyandVal;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BusinessDAOImple implements BusinessDAO{
	@Resource
	private SqlSessionTemplate template;

	public void alnalyze(String vision) {
		template.selectOne("",vision);
		
	}

	@Override
	public int insertEvaluation(Map<String,String> map) {
		System.out.println(map.get("flavor"));
		System.out.println(map.get("price"));
		System.out.println(map.get("design"));
		int result=0;
		String item=template.selectOne("data.findItem",map.get("item"));
		if(item!=null){
			String flv=template.selectOne("data.findKeyWord",map.get("flavor"));
			String dsg=template.selectOne("data.findKeyWord",map.get("design"));
			String prc=template.selectOne("data.findKeyWord",map.get("price"));
			System.out.println(flv+" "+dsg+" "+prc);
			if(dsg!=null&&flv!=null&&prc!=null){
				System.out.println("삽입실행");
			 result=template.insert("data.insertEvaluation",map);
			}
		}
		
		
		System.out.println("평가내용 ="+result+" "+map.toString());
		return result;
		
	};

	@Override
	public List<String> getItemList() {
		List<String> list=template.selectList("data.getItemList");
		System.out.println("아이템 리스트 불러와"+list.toString());
		return list;
		
	}

	@Override
	public Map<String, String> showGraph(String item) {
		String flavor="";
		String price="";
		String design="";
		
		String flavorP =template.selectOne("data.showGraphFlavorPositive", item);
		String flavorN =template.selectOne("data.showGraphFlavorNegative", item);
		if(flavorN==null){
			flavor=String.valueOf(100);
		}else if(flavorP==null){
			flavor = String.valueOf(0);
		}else{
	 flavor = String.valueOf(
	100*Integer.parseInt(flavorP)/(Integer.parseInt(flavorP)+Integer.parseInt(flavorN)));
		}
		String priceP =template.selectOne("data.showGraphPircePositive", item);
		String priceN =template.selectOne("data.showGraphPirceNegative", item);
		
		if(priceN==null){
			price=String.valueOf(100);
		}else if(priceP==null){
			price = String.valueOf(0);
		}else{
			price = String.valueOf(
					100*Integer.parseInt(priceP)/(Integer.parseInt(priceP)+Integer.parseInt(priceN)));
		}
		 
		 String DesignP =template.selectOne("data.showGraphDesignPositive", item);
		 String DesignN =template.selectOne("data.showGraphDesignNegative", item);
		
			if(DesignN==null){
				design=String.valueOf(100);
			}else if(DesignP==null){
				design = String.valueOf(0);
			}else{
				design = String.valueOf(
						100*Integer.parseInt(DesignP)/(Integer.parseInt(DesignP)+Integer.parseInt(DesignN)));
			}
		
		
			Map<String,String> map=new HashMap<String,String>();
				map.put("flavor",flavor);
				map.put("price",price);
				map.put("design",design);
		System.out.println(map.toString());
		return map;
	}

	@Override
	public Map<String,List<KeyandVal>> getDetail(String item, String type) {
		Map<String,List<KeyandVal>> map = new HashMap<String,List<KeyandVal>>();
			List<KeyandVal> listP= new ArrayList<KeyandVal>();
			List<KeyandVal> listN= new ArrayList<KeyandVal>();
			if(type.equals("flavor")){
				listP=template.selectList("data.getDetailFP", item);
				listN=template.selectList("data.getDetailFN", item);
				System.out.println("맛긍정은= "+listP.toString());
				System.out.println("맛부정은= "+listN.toString());
			}else if(type.equals("price")){
				listP=template.selectList("data.getDetailPP", item);
				listN=template.selectList("data.getDetailPN", item);
				System.out.println("가격긍정은= "+listP.toString());
				System.out.println("가격부정은= "+listN.toString());
			}else if(type.equals("design")){
				listP=template.selectList("data.getDetailDP", item);
				listN=template.selectList("data.getDetailDN", item);
				System.out.println("디자인긍정은= "+listP.toString());
				System.out.println("디자인부정은= "+listN.toString());
			}
			System.out.println("디테일 최종검색결과 긍정"+listP.toString());
			System.out.println("디테일 최종검색결과 부정"+listN.toString());
			map.put("pList", listP);
			map.put("nList", listN);
		return map;
	}

	
	
		
	


	
	
	
	
}
