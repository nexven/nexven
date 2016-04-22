<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix= "fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	if(session.getAttribute("mNick") == null){
%>
	<script>
		alert('로그인이 필요합니다.');
		location.href = "./";
	</script>
<%
	}else{
%>


<style type="text/css">
	#join_wrap{
	width:600px; height:500px;
	margin-top:50px; margin-left:auto; margin-right:auto;margin-bottom:50px;
	border:1px solid gray;
	border-radius:10px;
}

#join_t{margin:20px 0 0 30px;}

#join_t th{}
#join_t td{padding:3px 20px 0;}
#join_menu{margin:30px 0 0;text-align:center;}
</style>

 <div id="join_wrap">
 <c:set var="map" value="${map}" />
  <form id="nexven_member_form" name="f" style="width:600px">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table id="join_t">
    <tr>
     <th>회원아이디</th>
     <td>
      <input name="mId" id="mId" size="14" class="input_box" value="${map.MID }" />
      <input type="button" value="아이디 중복체크" class="input_button"
      onclick="id_check()" />
      <div id="idcheck"></div>
     </td>
    </tr>
    
    <tr>
     <th>회원비번</th>
     <td>
      <input type="password" name="mPass" id="mPass" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원비번확인</th>
     <td>
      <input type="password" name="mPass2" id="mPass2" size="14"
      class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>회원이름</th>
     <td>
      <input name="mName" id="mName" size="14" class="input_box" value="${map.MNAME }"/>
     </td>
    </tr>
    
    <tr>
     <th>닉네임</th>
     <td>
      <input name="mNick" id="mNick" size="14" class="input_box" value="${map.MNICK}"/>
      <input type="button" value="닉네임 중복체크" class="input_button"
      onclick="nick_check()" />
      <div id="nickcheck"></div>
     </td>
    </tr>
    
    <tr>
     <th>성별</th>
     <td>     
      <input name="mGender" id="mGender" type="radio" value="남" checked="checked"/>남
      <input name="mGender" id="mGender" type="radio" value="여" />여
     </td>
    </tr>
    
    <tr>
     <th>생년월일</th>
     <td>
     <c:set var="birth" value="${map.MBIRTH}" />
     <c:set var="check_birth" value="${fn:split(birth,' ')}"/>
      <input name="mBirth" id="mBirth" type="text" size="14" class="input_box" value="${check_birth[0] }"/>
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="mZipcode" id="mZipcode" size="3" class="input_box" value="${map.MZIPCODE }"
      readonly onclick="openDaumPostcode()" />
      <input type="button" value="도로명 주소" class="input_button"
      onclick="openDaumPostcode()">
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="mAddr1" id="mAddr1" size="48" class="input_box" value="${map.MADDR1 }"
      readonly onclick="openDaumPostcode()" />
     </td>
    </tr>
    
    <tr>
     <th>나머지 주소</th>
     <td>
      <input name="mAddr2" id="mAddr2" size="37" class="input_box" value="${map.MADDR2 }"/>
     </td>
    </tr>
    
    <tr>
     <th>휴대전화번호</th>
     <td>
     <input name="mTel" id="mTel" size="15" maxlength="15" class="input_box" value="${map.MTEL }"/>
     </td>
    </tr>
    
    <tr>
     <th>전자우편</th>
     <td>
     <c:set var="posting_date" value="${map.MEMAIL}" />
     <c:set var="check_email" value="${fn:split(posting_date,'@')}"/>
      <input name="mEmail" id="mEmail" size="10" value="${check_email[0] }"
      class="input_box" />@<input name="join_maildomain" 
      id="join_maildomain" size="20" class="input_box" value="${check_email[1] }" readonly />
      <!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 //-->
      <select name="mail_list" onchange="domain_list()">
      <option value="">=이메일선택=</option>
      <option value="daum.net">daum.net</option>
      <option value="nate.com">nate.com</option>
      <option value="naver.com">naver.com</option>
      <option value="hotmail.com">hotmail.com</option>
      <option value="gmail.com">gmail.com</option>
      <option value="0">직접입력</option>
     </select> 
     </td>
    </tr>
    
    <tr>
     <th>ip</th>
     <td>
     	${map.MIP }
     </td>
    </tr>
    
   </table>

   
   <input type="hidden" id="mIp" name="mIp" value="<%= request.getRemoteAddr() %>">
   
   
   <div id="join_menu">
    <button type="button" class="input_button" onclick="javascript:edit_check();">회원수정</button>
    <button type="reset" class="input_button" onclick="$('#mId').focus();" >가입취소</button>
    <button type="button" class="input_button" onclick="javascript:delete_member();" >회원탈퇴</button>
   </div>
  </form>


	<script src="./js/member.js"></script>

	<script>
		function openDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
					document.getElementById('mZipcode').value = data.zonecode;//신주소
					document.getElementById('mAddr1').value = data.address;
					
				}
			}).open();
		}
	</script>
</div>

<%
	}
%>