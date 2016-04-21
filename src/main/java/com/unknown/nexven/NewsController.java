package com.unknown.nexven;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


@Controller
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	/** 네이버 뉴스 API
	 * http://developer.naver.com/wiki/pages/News
	 */
	
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(@RequestParam(value="sel", required =false, defaultValue="t") String sel, @RequestParam(value="sw", required =false, defaultValue="") String sw, Locale locale, Model model, HttpServletResponse res) throws IOException {
	
		logger.info("검색 선택 : " + sel);
		logger.info("검색 키워드 : " + sw);
		
     	List<HashMap<String,Object>> nlist = new LinkedList<HashMap<String,Object>>();
     	HashMap<String,Object> mlist;
        String mtitle = "";
     	String mcontent = "";
    	boolean addsw=true;
	    try {
	        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
	        Document xml = null;
	        
        	xml = documentBuilder.parse("http://feeds.feedburner.com/inven");
        	
//	        if(keyword.equals("")&&page.equals("")){
//	        	xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query=inven.co.kr");
//	        }else if(page.equals("")){
//	        	xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query=inven.co.kr+"+keyword);	        	
//	        }else if(keyword.equals("")){
//	        	xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query=inven.co.kr"+"&field="+page);
//	        }else{
//	        	xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query=inven.co.kr+"+keyword+"&field="+page);
//	        }
	        
	        Element element = xml.getDocumentElement();
	        Node channelNode = element.getElementsByTagName("channel").item(0);
	        NodeList list = channelNode.getChildNodes();
	        for(int i=0; i<list.getLength(); i++) {
	         if(list.item(i).getNodeName().equals("item")) {
	        	 mlist = new HashMap<String,Object>();	          	
	             NodeList list2 = list.item(i).getChildNodes();
	             for(int j=0;j<list2.getLength();j++) {
	            	 	mtitle = list2.item(j).getNodeName();
	                 	mcontent = list2.item(j).getTextContent();
	                    if(mtitle.equals("link")){
	                    	mcontent = mcontent.replace("http://www.inven.co.kr/webzine/news/?news=", "news_content?link=");
	                    }	                 	
	                    if(mtitle.equals("enclosure")){
	                    	mcontent = list2.item(j).getAttributes().getNamedItem("url").getTextContent().replaceAll("http://static.inven.co.kr","news_img?src=http://static.inven.co.kr");
	                    }	                    
		                if(mtitle.equals("description")){
	                    	mcontent = list2.item(j).getTextContent().replaceAll("<img [^<>]*>","");
		                }		                
		                if(mtitle.equals("pubDate")){
	                    	mcontent = list2.item(j).getTextContent();
	                    	//SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd a HH:mm:ss");
	                    	SimpleDateFormat sf = new SimpleDateFormat("YY/MM/dd");
	                    	@SuppressWarnings("deprecation")
							Date wDate = new Date(mcontent);
	                    	Long wdate = wDate.getTime();
	                    	//System.out.println(sf.format(wdate));
	                    	mcontent=sf.format(wdate);
		                }
		                
		                if(!sw.equals("")){
			                switch (sel) {
							case "t":
				                if(mtitle.equals("title")){
				                	System.out.println("타이틀:"+mcontent.contains(sw));
				                	System.out.println(mcontent);
				                	if(mcontent.contains(sw)){
				                		addsw=true;
				                	}else{
				                		addsw=false;
				                	}
				                }
							break;
							case "c":
					                if(mtitle.equals("category")){
					                	System.out.println("카테고리:"+mcontent.contains(sw));
					                	if(mcontent.contains(sw)){
					                		addsw=true;
					                	}else{
					                		addsw=false;
					                	}
					                }
								break;
							default:
								break;
							}
		                }
		                
		                if(addsw&&!mtitle.equals("#text")){
		                	mlist.put(mtitle, mcontent);
		                }
	                 	
	                 	/* 네이버
							if(mtitle.equals("media:thumbnail")){
	                    		mcontent = list2.item(j).getAttributes().getNamedItem("url").getTextContent();
	                    	}                    
	                 			mlist.put(mtitle, mcontent);
	                 	*/
	                 	
	                    /* inven 
	                    if(htitle.equals("enclosure")){
	                    	hcontent = list2.item(j).getAttributes().getNamedItem("url").getTextContent();
		                }
		                
		                if(htitle.equals("description")){
	                    	hcontent = list2.item(j).getTextContent().replaceAll("<img [^<>]*>","");
		                }
		                
	                    */
	                 	
	                 	//System.out.println("title="+htitle+" / content="+hcontent);
		                 
//	                 	if(mtitle.equals("link")){	                	 
//		                	 Response response= Jsoup.connect(list2.item(j).getTextContent())
//		                			   .referrer("http://static.inven.co.kr") 
//		                	           .ignoreContentType(true)
//		                	           .userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0")	                	             
//		                	           .followRedirects(true)
//		                	           .execute();
//
//		                	 org.jsoup.nodes.Document doc = response.parse();
//		                	 Elements news_content_pic = doc.select("#webzineNewsView > .newsPart > .Content > .contentBody > figure > img"); 	 
//		                	 mlist.put("news_content_pic",news_content_pic.attr("src"));
//		                 }
		                 
	             }
	                if(addsw){
	                	nlist.add(mlist);
	                }

	         }
	      }
	 } catch (Exception e) {
	     e.getMessage();
	 }
		model.addAttribute("nexven_news", nlist );		
		return "news";
	}
	
	
	@RequestMapping(value = "/news_content", method = RequestMethod.GET)
	public String news_content(@RequestParam(value="link",required=false, defaultValue="") String link, Model model) throws IOException{		
		HashMap<String,Object> clist = new HashMap<String,Object>();		
		if(link.equals("")){        
		}else{
      	Response response= Jsoup.connect("http://www.inven.co.kr/webzine/news/?news="+link)
       			   .referrer("http://static.inven.co.kr") 
       	           .ignoreContentType(true)
       	           .userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0")	                	             
       	           .followRedirects(true)
       	           .execute();
       	 org.jsoup.nodes.Document doc = response.parse();
       	 Elements news_title = doc.select("#webzineNewsView > .newsPart > .title > h1");
       	 Elements news_content = doc.select("#webzineNewsView > .newsPart > .Content > .contentBody");
       	 Elements news_content_pic = doc.select("#webzineNewsView > .newsPart > .Content > .contentBody > figure > img");
       	 //String all_content = doc.html();
       	 //System.out.println("제목 : "+news_title.text()+"\n내용 : "+news_content.text()+"\n이미지 : "+news_content_pic.attr("src"));     	 
       	 clist.put("news_title", news_title.text());
       	 // <img /> 제거 정규식 "<img [^<>]*>"
       	 // <img /> 모든 속성 <img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>
       	 clist.put("news_content", news_content.html().replaceAll("http://static.inven.co.kr","news_img?src=http://static.inven.co.kr"));
       	 clist.put("news_content_pic",news_content_pic.attr("src"));     	 
        }		
		model.addAttribute("nexven_news_content", clist );		
		return "news_content";
	}
	
	@RequestMapping(value = "/news_main", method = RequestMethod.GET)
	@ResponseBody
	public List<HashMap<String,Object>> news_main(Model model) throws IOException{
     	List<HashMap<String,Object>> nlist = new LinkedList<HashMap<String,Object>>();
     	HashMap<String,Object> mlist;
        String mtitle = "";
     	String mcontent = "";		
	    try {
	        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
	        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
	        Document xml = null;
	        xml = documentBuilder.parse("http://feeds.feedburner.com/inven");
	        //xml = documentBuilder.parse("http://newssearch.naver.com/search.naver?where=rss&query=inven.co.kr");
	        Element element = xml.getDocumentElement();
	        Node channelNode = element.getElementsByTagName("channel").item(0);
	        NodeList list = channelNode.getChildNodes();
	        for(int i=0; i<22; i++) {
	         if(list.item(i).getNodeName().equals("item")) {
	        	 mlist = new HashMap<String,Object>();	        	 
	             NodeList list2 = list.item(i).getChildNodes();
	             for(int j=0;j<list2.getLength();j++) {
	                    mtitle = list2.item(j).getNodeName();
	                 	mcontent = list2.item(j).getTextContent();              	
	                    if(mtitle.equals("link")){
	                    	mlist.put(mtitle, mcontent.replace("http://www.inven.co.kr/webzine/news/?news=", "news_content?link="));
	                    }
	                    if(mtitle.equals("enclosure")){
	                    	mcontent = list2.item(j).getAttributes().getNamedItem("url").getTextContent().replaceAll("http://static.inven.co.kr","news_img?src=http://static.inven.co.kr");
	                    	mlist.put(mtitle, mcontent);
	                    }
	                 	if(mtitle.equals("title")){
	                    	mlist.put(mtitle, mcontent);
	                    }
	                    if(mtitle.equals("description")){
	                    	mcontent = list2.item(j).getTextContent().replaceAll("<img [^<>]*>","");
	                    	mlist.put(mtitle, mcontent);
	                    }
	                    if(mtitle.equals("image")){
	                    	mlist.put(mtitle, mcontent);
	                    	System.out.println(mcontent+"테스트");
	                    }
	                    
	                    /* 큰 이미지                   
	                 	if(mtitle.equals("link")){	                	 
		                	 Response response= Jsoup.connect(list2.item(j).getTextContent())
		                			   .referrer("http://static.inven.co.kr") 
		                	           .ignoreContentType(true)
		                	           .userAgent("Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0")	                	             
		                	           .followRedirects(true)
		                	           .execute();
		                	 org.jsoup.nodes.Document doc = response.parse();
		                	 Elements news_content_pic = doc.select("#webzineNewsView > .newsPart > .Content > .contentBody > figure > img"); 	 
		                	 mlist.put("news_content_pic",news_content_pic.attr("src"));
		                }
	                    */

	             }
	             nlist.add(mlist);
	         }
	     }
	 } catch (Exception e) {
	     e.getMessage();
	 }
		//model.addAttribute("nexven_news_main", nlist );		
		return nlist;
	}

	
	@RequestMapping(value = "/news_img", method = RequestMethod.GET)
	public void news_img(@RequestParam(value="src", required =false, defaultValue="") String src, HttpServletResponse response ) throws IOException{
		if(!src.equals("")){
			//String src = request.getParameter("src");			
			response.setContentType("text/html;chaset=UTF-8");			
			response.setContentType("image/jpg");
			response.setHeader("Referer", "http://www.inven.co.kr/webzine/news/");	
			URL url = new URL(src);
			URLConnection connection = url.openConnection();
			connection.setRequestProperty("Referer", "http://www.inven.co.kr/webzine/news/");			
			InputStream stream = connection.getInputStream();
			BufferedInputStream in = new BufferedInputStream(stream);
			BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
			int length = 0;
			byte[] data = new byte[4096];			
		    while((length=in.read(data))!=-1 ) {bos.write(data,0,length);}bos.flush();
		    in.close();
		}

	}	

	
}
