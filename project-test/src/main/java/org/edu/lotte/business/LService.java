package org.edu.lotte.business;

import java.util.List;
import java.util.Map;

import org.edu.lotte.model.KeyandVal;

public interface LService {

	int alnalyze(Map<String, String> map);

	List<String> getItemList();

	Map<String, String> showGraph(String item);

	Map<String,List<KeyandVal>> getDetail(String item, String type);
	
}
