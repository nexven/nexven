package com.unknown.nexven;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jsoup.Jsoup;
import org.jsoup.Connection.Response;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/rss", method = RequestMethod.GET)
	public String rss_parser(@RequestParam(value="keyword", required =false, defaultValue="") String keyword, Locale locale, Model model) {
	
        String htitle = "";
     	String hcontent = "";

     	List<HashMap<String,Object>> xlist = new LinkedList<HashMap<String,Object>>();
     	HashMap<String,Object> hlist;

     	System.out.println(keyword);
		
	    try {
	        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
	        Document xml = null;
	        //XML DOCUMENT 획득
	        if(keyword.equals("")){
	        	xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query=inven.co.kr");
	        }else{
	        	xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query="+keyword);	        	
	        }
	        //Root엘리먼트 획득
	        Element element = xml.getDocumentElement();

	        //Root엘리먼트의 channel 자식태그는 1개이므로 item(0)으로  획득
	        Node channelNode = element.getElementsByTagName("channel").item(0);
	        //channel태그내에 존재하는 자식태그 획득
	        NodeList list = channelNode.getChildNodes();
	        for(int i=0; i<list.getLength(); i++) {
	         //image,link,title.. 여러개 태그 중 item 태그만 획득
	         if(list.item(i).getNodeName().equals("item")) {
	             //item 태그의 자식노드 획득

	        	 hlist = new HashMap<String,Object>();
	          	
	             NodeList list2 = list.item(i).getChildNodes();

	             for(int j=0;j<list2.getLength();j++) {
	                 //자식태그가 title/description일경우에만 태그명 + 값을 출력
	                    htitle = list2.item(j).getNodeName();
	                 	hcontent = list2.item(j).getTextContent();
	                 	
	                 	
	                    if(htitle.equals("media:thumbnail")){
	                    	hcontent = list2.item(j).getAttributes().getNamedItem("url").getTextContent();
	                    }
	                    /* inven 
	                    if(htitle.equals("enclosure")){
	                    	hcontent = list2.item(j).getAttributes().getNamedItem("url").getTextContent();
		                }
		                
		                if(htitle.equals("description")){
	                    	hcontent = list2.item(j).getTextContent().replaceAll("<img [^<>]*>","");
		                }
		                
	                    */
	                    
	                 	
	                    
	                 	hlist.put(htitle, hcontent);
	                 	
	                 	//System.out.println("title="+htitle+" / content="+hcontent);

	                 
	                 if(htitle.equals("link")){
	                	 
	                	 Response response= Jsoup.connect(list2.item(j).getTextContent())
	                			   .referrer("http://static.inven.co.kr") 
	                	           .ignoreContentType(true)
	                	           .userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0")	                	             
	                	           .followRedirects(true)
	                	           .execute();

	                	 org.jsoup.nodes.Document doc = response.parse();
	                	 
	                	 Elements news_title = doc.select("#webzineNewsView > .newsPart > .title > h1");
	                	 Elements news_content = doc.select("#webzineNewsView > .newsPart > .Content > .contentBody");
	                	 Elements news_content_pic = doc.select("#webzineNewsView > .newsPart > .Content figure img");
	                	 String all_content = doc.html();
	                	 
	                	 
	                	 //System.out.println("제목 : "+news_title.text()+"\n내용 : "+news_content.text()+"\n이미지 : "+news_content_pic.attr("src"));  	 
	                	 
	                	 
	                	 hlist.put("news_title", news_title.text());
	                	 hlist.put("news_content", news_content.html().replaceAll("<img [^<>]*>",""));
	                	 hlist.put("news_content_pic",news_content_pic.attr("src"));
	                 }
	                 
	             

	             }
	             xlist.add(hlist);
	         }
	         
	        }
	 } catch (Exception e) {
	     e.getMessage();
	 }
		

		model.addAttribute("inven", xlist );
		
		return "rss";
	}
	
}
