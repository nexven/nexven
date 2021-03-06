<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.net.InetAddress"%>

<%
	if (session.getAttribute("mNick") != null) {
%>
<script>
	alert('이미 로그인이 되어있습니다.');
	location.href = "./";
</script>
<%
	} else {
%>

<style type="text/css">
#join_wrap {
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
	padding:0 10px 0 0;
}

#join_menu {
	margin: 30px 0 0;
	text-align: center;
}

.lab {
	display: inline-block;
	text-align: left;
	padding: 5px;
	width: 90px;
}

.inp {
	width: 180px;
}

.inp2 {
	width: 255px;
}

.inp3 {
	width: 100px;
}
.tl {
	display:inline-block;
	text-align:left !important;
}
</style>

<div id="join_wrap">
	<form id="nexven_member_form" name="f" action="javascript:;" onsubmit="javascript:member_chk();">

		<div class="tl">
			<p>
				<label class="lab kr">아이디</label> <input id="mId" name="mId"
					type="text" class="inp" /> <input type="button" value="아이디 중복체크"
					class="btn-sm" onclick="javascript:id_check()" />
					<div id="idcheck"></div>

			</p>

			<p>
				<label class="lab kr">비밀번호</label> <input id="mPass" name="mPass"
					type="password" class="inp" />
			</p>
			<p>
				<label class="lab kr">비밀번호 확인</label> <input id="mPass2"
					name="mPass2" type="password" class="inp" />
			</p>
			<p>
				<label class="lab kr">이름</label> <input id="mName" name="mName"
					type="text" class="inp" />
			</p>
			<p>
				<label class="lab kr">닉네임</label> <input id="mNick" name="mNick"
					type="text" class="inp" /> <input type="button" value="닉네임 중복체크"
					class="btn-sm" onclick="nick_check()" />
			<div id="nickcheck"></div>
			</p>

			<p>
				<label class="lab kr">성별</label> <input name="mGender" id="mGender"
					type="radio" value="남" checked="checked" />남 <input name="mGender"
					id="mGender" type="radio" value="여" />여
			</p>
			<p>
				<label class="lab kr">생년월일</label> <input id="mBirth" name="mBirth"
					type="text" class="inp" readonly="readonly" />
			</p>
			<p>
				<label class="lab kr">우편번호</label> <input name="mZipcode"
					id="mZipcode" size="3" class="inp" readonly="readonly"
					onclick="openDaumPostcode();" /> <input type="button"
					value="도로명 주소" class="btn-sm" onclick="openDaumPostcode();">
			</p>
			<p>
				<label class="lab kr">주소</label> <input name="mAddr1" id="mAddr1"
					class="inp2" readonly="readonly" onclick="openDaumPostcode();" />
			</p>
			<p>
				<label class="lab kr">나머지주소</label> <input id="mAddr2" name="mAddr2"
					type="text" class="inp2" />
			</p>
			<p>
				<label class="lab kr">휴대전화번호</label> <input id="mTel" name="mTel"
					type="text" class="inp" />
			</p>
			<p>
				<label class="lab kr">이메일</label>
				<span style="display:inline-block;"><input name="mEmail" id="mEmail"
					size="10" class="inp3" />@<input name="join_maildomain"
					id="join_maildomain" size="10" class="inp3" readonly /></span>
				<!--readonly는 단지 쓰기,수정이 불가능하고 읽기만 가능하다 //-->
				<select id="mail_list" name="mail_list" onchange="domain_list();">
					<option value="">=이메일선택=</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="naver.com">naver.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="0">직접입력</option>
				</select>
			</p>


			<%
				InetAddress inet = InetAddress.getLocalHost();
					String serverAddr = inet.getHostAddress();
					String addr = request.getRemoteAddr();
			%>

		</div>


		<input type="hidden" id="mIp" name="mIp" value="<%=serverAddr%>">


		<div id="join_menu">
			<input type="submit" class="btn btn-primary"
				value="회원가입" />
			<input type="reset" class="btn btn-primary"
				onclick="$('#mId').focus();" value="가입취소" />
		</div>
	</form>

	<script src="./js/member.js"></script>
	<script>	
		function member_chk(){
			if(check()){		
				var formData = $("#nexven_member_form").serialize();
				//alert(formData);
				$.ajax({
					type : "POST",
				    async : true,
				    cache : false,
				    encoding: "UTF-8",
					data : formData,
				    url : "member_join_ok",
					success: function(nchk) {
						var nchk = JSON.parse(JSON.stringify(nchk));
						
						if(nchk.success=="성공"){
							$("#nexven_view").modal('hide');
							alert("회원가입을 축하합니다.");
							location.href = "./";
						}else{
							alert("회원가입에 실패하였습니다. 오류이유("+nchk.success+")");
							nload("member_join.jsp");
						}
				
					},
				    error: function(nchk2){
				    	alert("회원가입 정보 불러오기 실패");
				    }
				});		
			}else{
				return false;
			}
		}
	</script>
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
		
		 $.datepicker.regional['ko'] = {
				  closeText: '닫기',
				  prevText: '이전',
				  nextText: '다음',
				  currentText: '오늘',
				  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				  monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
				  dayNames: ['일','월','화','수','목','금','토'],
				  dayNamesShort: ['일','월','화','수','목','금','토'],
				  dayNamesMin: ['일','월','화','수','목','금','토'],
				  weekHeader: 'Wk',
				  dateFormat: 'yy-mm-dd',
				  firstDay: 0,
				  isRTL: false,
				  showMonthAfterYear: true,
				  yearSuffix: ''};
				 $.datepicker.setDefaults($.datepicker.regional['ko']);

				 $('#mBirth').datepicker();
	</script>
</div>

<%
	}
%>