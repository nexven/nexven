package com.unknown.nexven;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
	public Map<String, String> member_join_ok(HttpServletRequest request,
			HttpServletResponse response){
		
		Map<String,String> join_chk = new HashMap<String,String>();
		
		try {
			Member m = new Member();
			
			//m.setMNum(1);
			
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
		    String mEmail = request.getParameter("mEmail") + "@" + request.getParameter("join_maildomain");
		    System.out.println(mEmail);
		    m.setMEmail(mEmail);
		    //  회원권한레벨
		    Integer mAuthLevel=1;
		    m.setMAuthLevel(mAuthLevel);
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
		    String mTel = request.getParameter("mTel");
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
		    
		    join_chk.put("success","성공");
		    
		    return join_chk;
		} catch(NullPointerException ne){
			join_chk.put("success","빈문자열");
			return join_chk;
		} catch (ParseException pe){
			join_chk.put("success","분석오류");
			return join_chk;
		} catch (Exception e) {
			join_chk.put("success","오류발생");
			return join_chk;
		}
	    
		
	}
	/*회원 수정 */
	@RequestMapping(value="/member_modify_ok", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, String> member_modify_ok(HttpServletRequest request,
			HttpServletResponse response, HttpSession session){
		
		Map<String,String> modify_chk = new HashMap<String,String>();
		
		System.out.println("modify");
		
		try {
			Member m = new Member();
			
			//m.setMNum(1);
			
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
		    String mEmail = request.getParameter("mEmail") + "@" + request.getParameter("join_maildomain");
		    System.out.println(mEmail);
		    m.setMEmail(mEmail);
		    //  회원권한레벨
		    //Integer mAuthLevel=1;

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
		    String mTel = request.getParameter("mTel");
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
		    
		    memberService.modify(m);
		    
		    Map<String,String> map = memberService.selectBymid2(mId);
		    
		    session.setAttribute("map", map);
		    
		    modify_chk.put("success","성공");
		    
		    return modify_chk;
		} catch(NullPointerException ne){
			modify_chk.put("success","빈문자열");
			return modify_chk;
		} catch (ParseException pe){
			modify_chk.put("success","분석오류");
			return modify_chk;
		} catch (Exception e) {
			modify_chk.put("success","오류발생");
			return modify_chk;
		}	    
		
	}
	
	/*회원 삭제 */
	@RequestMapping(value="/member_delete_ok", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public Map<String, String> member_delete_ok(HttpServletRequest request,
			HttpServletResponse response, HttpSession session){

		Map<String,String> delete_chk = new HashMap<String,String>();
		
		System.out.println("modify");
		
		try {
			Member m = new Member();
			
			//m.setMNum(1);
			
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
		    String mEmail = request.getParameter("mEmail") + "@" + request.getParameter("join_maildomain");
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
		    String mTel = request.getParameter("mTel");
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
		    Date mOut = new Date();
		    m.setMOut(mOut);

		    //  탈퇴여부
		    Integer mIsOut;
		    m.setMIsOut(1);

		    //  회원가입일
		    Date mJoinDate = new Date();
		    System.out.println(mJoinDate);
		    
		    memberService.modify(m);
		    
		    Map<String,String> map = memberService.selectBymid2(mId);
		    
		    session.invalidate();
		    
		    delete_chk.put("success","성공");
		    
		    return delete_chk;
		} catch(NullPointerException ne){
			delete_chk.put("success","빈문자열");
			return delete_chk;
		} catch (ParseException pe){
			delete_chk.put("success","분석오류");
			return delete_chk;
		} catch (Exception e) {
			delete_chk.put("success","오류발생");
			return delete_chk;
		}    
		
	}
	
	@RequestMapping(value="/member_idcheck", method=RequestMethod.POST)
	@ResponseBody
	public int member_idcheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		int ch = 0;
		

		System.out.println(request.getParameter("memid"));
		System.out.println(memberService.idcheck(request.getParameter("memid")));
		
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
		
		System.out.println(request.getParameter("memnick"));
		System.out.println(memberService.nickcheck(request.getParameter("memnick")));
		
		if(memberService.nickcheck(request.getParameter("memnick")) != null)
			ch = 1;
	    System.out.println(ch);
		
		return ch;
	}
	
	/*로그인 인증  */
	@RequestMapping(value="/member_login_ok",method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, String> member_login_ok(HttpServletRequest request,
			HttpServletResponse response,HttpSession session, Model model)
					throws Exception{
		
		System.out.println("로그인");
		
		Map<String,String> login_chk = new HashMap<String,String>();
		
		//HttpSession 클래스는 세션객체를 생성해서 로그인 인증 처리를 하기 위해서 이다.
		//PrintWriter out=response.getWriter();//출력스트림 객체 생성
		
		//response.setContentType("text/html;charset=UTF-8");
		
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

			login_chk.put("success","실패");
			return login_chk;
		}else if(String.valueOf(map.get("MISOUT")).equals("1")){
			login_chk.put("success","탈퇴");
			return login_chk;
		}
		else{//등록된 회원일때
			if(map.get("MPASS").equals(pwd)){//비번이 같을때
				session.setAttribute("id",id);
				
				String mName=map.get("MNAME");
				String mNick=map.get("MNICK");
				String mIsOut= String.valueOf(map.get("MISOUT"));

				System.out.println(mIsOut);
				
				session.setAttribute("mName",mName);
				session.setAttribute("mNick",mNick);
				session.setAttribute("mIsOut",mIsOut);
				
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
				Date ndate = new Date();				
				session.setAttribute("mRecentLoginDate", sf.format(ndate));
				
				
				map.remove("MPASS");
				
				session.setAttribute("map", map);
				
				
				login_chk.put("success","성공");
				
				//jsp폴더의 index.jsp로 이동
				
				return login_chk;

			}else{//비번이 다를때

				login_chk.put("success","실패");
				return login_chk;
			}
		}
		
	}

	
}
