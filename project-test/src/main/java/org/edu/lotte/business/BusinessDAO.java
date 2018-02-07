package org.edu.lotte.business;

import java.util.List;
import java.util.Map;

import org.edu.lotte.model.KeyandVal;

public interface BusinessDAO {
	public void alnalyze(String vision);

	public int insertEvaluation(Map<String,String> map);

	public List<String> getItemList();

	public Map<String, String> showGraph(String item);

	public Map<String,List<KeyandVal>> getDetail(String item, String type);
	
	
}
