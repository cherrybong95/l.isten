package org.edu.lotte.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.edu.lotte.business.LService;
import org.edu.lotte.model.KeyandVal;
import org.edu.lotte.model.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Resource
	private LService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(method=RequestMethod.POST,value="login.do")
	public String bicycleList(HttpServletRequest request,MemberVO mvo){
		String id="lotte";
		String pwd="1234";
		String userId= mvo.getUserId();
		String passWord= mvo.getPassWord();
		System.out.println(userId);
		System.out.println(passWord);
		if(id.equals(userId) && pwd.equals(passWord)) {
			HttpSession session=request.getSession();
			session.setAttribute("user", userId);
			
			List<String> list=service.getItemList();
			request.setAttribute("productList", list);
			
			return "main";
		}
		return "login_fail";
	}
	@RequestMapping("graph.do")
	public String showGraph(HttpServletRequest request,String item) {
		System.out.println("그래프페이지 호출");
		Map<String,String> map=service.showGraph(item);
		request.setAttribute("graph", map);
		request.setAttribute("item", item);
		return "graph_test";
	}
	@RequestMapping("main.do")
	public String goMain(HttpServletRequest request) {
		List<String> list=service.getItemList();
		request.setAttribute("productList", list);
		return "main";
	}
	
	@RequestMapping("oracle.do")
	public String oracle(HttpServletRequest request) {
		
		return "oracle";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "main";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="vision.do")
	@ResponseBody
	public String viseionTest(HttpServletRequest request) throws UnsupportedEncodingException {
		   request.setCharacterEncoding("utf-8");
		   String content = request.getParameter("content");
		   String name= request.getParameter("name");
		   String phoneNum= request.getParameter("phoneNum");
		   System.out.println(content+" "+name+" "+phoneNum);
		   Map<String,String>map= new HashMap<String,String>();
		   map.put("content", content);
		   map.put("name", name);
		   map.put("phoneNum", phoneNum);
		   if(content==null){
			   return "false";
		   }else{
			  int result=0;
			   result=service.alnalyze(map);
			   
			 if(result!=0){  
			   try {
				   String authKey="Y2xhc3M6c2VjcmV0MTIhQA==";
				sendMesageAPI("http://210.93.181.229:9090/v1/send/kakao-friend",
						authKey,
						   phoneNum,
						   "d6b73318d4927aa80df1022e07fecf06c55b44bf",
						   "설문조사에 참여해주셔서 진심으로 감사드립니다.\\n"
						   + "엔젤리너스 1+1 쿠폰이 도착하였습니다."
						   );
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   return "complete"; 
			 }			   
			   
			 return "fail"; 
		   }
	
	}
	
	
	

		@RequestMapping("detail.do")
	public String detail(HttpServletRequest request,String item,String type) {
		System.out.println("item="+item+" type="+type);
		Map<String,List<KeyandVal>> map=service.getDetail(item,type);
		request.setAttribute("map", map);
		return "detail";
	}
	
	public int sendMesageAPI(String meesagePlatformUrl, String authKey,String send_phone, String sender_key,
				String message) throws Exception {

			CloseableHttpClient httpclient = HttpClients.createDefault();
			try {
				HttpPost httpPost = new HttpPost(meesagePlatformUrl);
				 //httpPost.setHeader("Authorization", "Basic Y2xhc3M6bm90X29wZW5fYXBp==");
				
				
				 httpPost.setHeader("Authorization", "Basic " + authKey);
				httpPost.setHeader("Content-Type", "application/json; charset=EUC-KR");
				String body2 = "{ \"msg_id\" : \"iot\", \"dest_phone\" : \"" + send_phone + "\", \"send_phone\" : \""
						+ send_phone + "\", \"sender_key\" : \"" + sender_key + "\", \"msg_body\" : \"" + message
						+ "\", \"ad_flag\" : \"N\","
						+ " \"image\":{ \"img_url\":\"http://mud-kage.kakao.com/dn/ihFWM/btqgIZSprL7/wvKQlhVKgcGh4Mw8ThNW81/img_l.jpg\", \"img_link\":\"http://www.angelinus.com\" } }";
				ByteArrayEntity entity = new ByteArrayEntity(body2.getBytes("UTF-8"));

				System.out.println("TO Kakao BODY Message : " + body2);
				httpPost.setEntity(entity);

				CloseableHttpResponse res = httpclient.execute(httpPost);

				try {
					if (res.getStatusLine().getStatusCode() == 200) {
						org.apache.http.HttpEntity entity2 = (org.apache.http.HttpEntity) res.getEntity();
						System.out.println(EntityUtils.toString(entity2));
					} else {
						System.out.println("eerr"+res.getStatusLine().getStatusCode());
					}
				} finally {
					res.close();
				}
			} finally {
				httpclient.close();
			}
			return 0;

		}
	
	
	
}
