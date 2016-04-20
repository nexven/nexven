<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html> -->
<!-- <head> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
<!-- <link rel="stylesheet" type="text/css" href="./css/admin.css" /> -->
<!-- <link rel="stylesheet" type="text/css" href="./css/member.css" /> -->
<!-- <script src="./js/jquery.js"></script> -->
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
<!-- </head> -->
<body>
 <div id="join_wrap">
  <h2 class="join_title">회원가입</h2>
  <form name="f" method="post" action="member_join_ok.nhn"
  onsubmit="return check()">
   <!-- 이진파일을 업로드 할려면 enctype 속성을 지정 -->
   <table id="join_t">
    <tr>
     <th>회원아이디</th>
     <td>
      <input name="mId" id="mId" size="14" class="input_box" />
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
      <input name="mName" id="mName" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>닉네임</th>
     <td>
      <input name="mNick" id="mNick" size="14" class="input_box" />
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
      <input name="mBirth" id="mBirth" type="text" size="14" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>우편번호</th>
     <td>
      <input name="mZipcode" id="mZipcode" size="3" class="input_box"
      readonly onclick="post_search()" />
      <input type="button" value="도로명 주소" class="input_button"
      onclick="openDaumPostcode()">
     </td>
    </tr>
    
    <tr>
     <th>주소</th>
     <td>
      <input name="mAddr1" id="mAddr1" size="50" class="input_box"
      readonly onclick="post_search()" />
     </td>
    </tr>
    
    <tr>
     <th>나머지 주소</th>
     <td>
      <input name="mAddr2" id="mAddr2" size="37" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>휴대전화번호</th>
     <td>
     <%@ include file="../../include/phone_number.jsp" %>
     <select name="mTel0">
      <c:forEach var="p" items="${phone}" begin="0" end="5">
       <option value="${p}">${p}</option>
      </c:forEach>
     </select>-<input name="mTel" id="mTel" size="4"
     maxlength="4" class="input_box" />-<input name="mTel2"
     id="mTel2" size="4" maxlength="4" class="input_box" />
     </td>
    </tr>
    
    <tr>
     <th>전자우편</th>
     <td>
      <input name="mEmail" id="mEmail" size="10" 
      class="input_box" />@<input name="join_maildomain" 
      id="join_maildomain" size="20" class="input_box" readonly />
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
     	<%= request.getRemoteAddr() %>
     	<%= request.getRemoteHost() %>
     	<%= request.getRemoteUser() %>
      	<%! String mIp = "as"; %>
      	<%=mIp %>
     </td>
    </tr>
    
   </table>

   
   <input type="hidden" id="mIp" name="mIp" value="<%= request.getRemoteAddr() %>">
   
   
   <div id="join_menu">
    <input type="submit" value="회원가입" class="input_button" />
    <input type="reset" value="가입취소" class="input_button" 
    onclick="$('#mId').focus();" />
   </div>
  </form>
 </div>
<!-- </body> -->
<!-- </html> -->
