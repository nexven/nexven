package com.unknown.nexven;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.unknown.model.Member;
import com.unknown.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/*회원 가입 저장 */
	@RequestMapping(value="/member_join_ok", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String member_join_ok(HttpServletRequest request,
			HttpServletResponse response){
		
		try {
			Member m = new Member();
			
			m.setMNum(1);
			
			String mId = request.getParameter("mId");
			m.setMId(mId);
			System.out.println(mId);
		    //  패스워드
		    String mPass = request.getParameter("mPass");
		    System.out.println(mPass);
		    m.setMPass(mPass);
		    //  이름
		    String mName = request.getParameter("mName");
		    System.out.println(mName);
		    m.setMName(mName);
		    //  닉네임
		    String mNick = request.getParameter("mNick");
		    System.out.println(mNick);
		    m.setMNick(mNick);
		    //  이메일
		    String mEmail = request.getParameter("mEmail");
		    System.out.println(mEmail);
		    m.setMEmail(mEmail);
		    //  회원권한레벨
		    Integer mAuthLevel;

		    //  성별
		    String mGender = request.getParameter("mGender");
		    System.out.println(mGender);
		    m.setMGender(mGender);
		    
		    //  생년월일
		    Date mBirth = new Date();
		    String birth = request.getParameter("mBirth");

		    System.out.println(birth + " " + mBirth);
		    SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		    m.setMBirth(sm.parse(birth));
		    
		    System.out.println("as"+sm.parse(birth));
		    
		    
		    //  연락처
		    String mTel = request.getParameter("mTel0") + "-" + request.getParameter("mTel") + "-" + request.getParameter("mTel2") ;
		    System.out.println(mTel);
		    m.setMTel(mTel);
		    //  우편번호(신)
		    String mZipcode = request.getParameter("mZipcode");
		    System.out.println(mZipcode);
		    m.setMZipcode(mZipcode);
		    //  도로명주소
		    String mAddr1 = request.getParameter("mAddr1");
		    System.out.println(mAddr1);
		    m.setMAddr1(mAddr1);
		    //  나머지주소
		    String mAddr2 = request.getParameter("mAddr2");
		    System.out.println(mAddr2);
		    m.setMAddr2(mAddr2);
		    //  회원레벨
		    Integer mLevel;
		    m.setMLevel(1);

		    //  회원EXP
		    Integer mExp;
		    m.setMExp(0);

		    //  최종접속시간
		    Date mRecentLoginDate = new Date();
		    m.setMRecentLoginDate(mRecentLoginDate);

		    //  아이피
		    String mIp = request.getParameter("mIp");
		    System.out.println(mIp);
		    m.setMIp(mIp);
		    //  탈퇴일시
		    Date mOut;

		    //  탈퇴여부
		    Integer mIsOut;
		    m.setMIsOut(0);

		    //  회원가입일
		    Date mJoinDate = new Date();
		    System.out.println(mJoinDate);
		    
		    memberService.insert(m);
		    
		    return "success";
		} catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}
	    
		
	}
	
	@RequestMapping(value="/member_idcheck", method=RequestMethod.POST)
	@ResponseBody
	public int member_idcheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		int ch = 0;
		
		System.out.println("as");
		System.out.println(request.getParameter("memid"));
		System.out.println("as"+ memberService.idcheck(request.getParameter("memid")));
		
		if(memberService.idcheck(request.getParameter("memid")) != null)
			ch = 1;
	    System.out.println(ch);
		
		return ch;
	}
	
	@RequestMapping(value="/member_nickcheck", method=RequestMethod.POST)
	@ResponseBody
	public int member_nickcheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		int ch = 0;
		
		System.out.println("as");
		System.out.println(request.getParameter("memnick"));
		System.out.println("as"+ memberService.nickcheck(request.getParameter("memnick")));
		
		if(memberService.nickcheck(request.getParameter("memnick")) != null)
			ch = 1;
	    System.out.println(ch);
		
		return ch;
	}
	
	/*로그인 인증  */
	@RequestMapping(value="/member_login_ok",method=RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public String member_login_ok(HttpServletRequest request,
			HttpServletResponse response,HttpSession session, Model model)
					throws Exception{
		
		System.out.println("로그인");
		//HttpSession 클래스는 세션객체를 생성해서 로그인 인증 처리를 하기 위해서 이다.
		//PrintWriter out=response.getWriter();//출력스트림 객체 생성
		
		//response.setContentType("application/json;charset=UTF-8");
		
		session=request.getSession();//세션 객체 생성
		
		String id=request.getParameter("id").trim();
		String pwd=request.getParameter("pwd").trim();
		
		System.out.println("id = "+id);
		System.err.println("pwd = " + pwd);
		
		Member m = memberService.selectBymid(id);
		Map<String,String> map = memberService.selectBymid2(id);
		
		System.out.println("member"+m);
		System.out.println((m==null));
		
		System.out.println(map);
		
		
		if(map==null){//등록되지 않은 회원일때
//			out.println("<script>");
//			out.println("alert('등록되지 않은 회원입니다!')");
//			out.println("history.back()");
//			out.println("</script>");
			return "fail1";
		}else{//등록된 회원일때
			if(map.get("MPASS").equals(pwd)){//비번이 같을때
				session.setAttribute("id",id);
				
				String mName=map.get("MNAME");
				String mNick=map.get("MNICK");
				
				session.setAttribute("mName",mName);
				session.setAttribute("mNick",mNick);
				
				
				//jsp폴더의 index.jsp로 이동
				
				return "success";

			}else{//비번이 다를때
//				out.println("<script>");
//				out.println("alert('비번이 다릅니다!')");
//				out.println("history.go(-1)");
//				out.println("</script>");\
				return "fail2";
			}
		}
		
	}

	
}
