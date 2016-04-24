
 function check(){
	 if($.trim($("#mId").val())==""){
		 alert("회원아이디를 입력하세요!");
		 $("#mId").val("").focus();
		 return false;
	 }
	 if($.trim($("#mPass").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#mPass").val("").focus();
		 return false;
	 }
	 if($.trim($("#mPass2").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#mPass2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mPass").val()) != $.trim($("#mPass2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#mPass").val("");
		 $("#mPass2").val("");
		 $("#mPass").focus();
		 return false;
	 }
	 if($.trim($("#mName").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#mName").val("").focus();
		 return false;
	 }
	 if($.trim($("#mNick").val())==""){
		 alert("닉네임을 입력하세요!");
		 $("#mNick").val("").focus();
		 return false;
	 }
	 if($.trim($("#mBirth").val())==""){
		 alert("생년월일을 입력하세요!");
		 $("#mBirth").val("").focus();
		 return false;
	 }
	 if($.trim($("#mZipcode").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#mZipcode").val("").click();
		 return false;
	 }
	 if($.trim($("#mAddr1").val())==""){
		 alert("주소를 입력하세요!");
		 $("#mAddr1").val("").click();
		 return false;
	 }
	 if($.trim($("#mAddr2").val())==""){
		 alert("나머지 주소를 입력하세요!");
		 $("#mAddr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mTel").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#mTel").val("").focus();
		 return false;
	 }
	 if($.trim($("#mEmail").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#mEmail").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_maildomain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#mail_list").focus();
		 return false;
	 }
	 
	 return true;
 }
 
function post_search(){
	alert("우편번호 검색 버튼을 클릭하세요!");
}

/*function post_check(){
	window.open("zipcode_find.nhn","우편번호검색",
			"width=420,height=200,scrollbars=yes");
	//폭이 420이고 높이가 200,스크롤바가 생성되는 새로운 공지창을 만듬
}*/

/* 아이디 중복 체크*/
function id_check(){
	$("#idcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memid=$("#mId").val();
	//1.입력글자 길이 체크
	/*if($.trim($("#mId").val()).length < 4){
		var newtext='<font color="red">아이디는 4자 이상이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#mId").val("").focus();
		return false;
	};
	if($.trim($("#mId").val()).length >12){
		var newtext='<font color="red">아이디는 12자 이하이어야 합니다.</font>';
		$("#idcheck").text('');
		$("#idcheck").show();
		$("#idcheck").append(newtext);//span 아이디 영역에 경고문자 추가
		$("#mId").val("").focus();
		return false;
	};*/
	//입력아이디 유효성 검사
	if(!(validate_userid(memid))){
		var newtext='<font color="red">아이디는 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#idcheck").text('');//문자 초기화
		$("#idcheck").show();//span 아이디 영역을 보이게 한다.
		$("#idcheck").append(newtext);
		$("#mId").val("").focus();
		return false;
	};
	//아이디 중복확인
    $.ajax({
        type:"POST",
        url:"member_idcheck",    
        data: {"memid":memid},  
        datatype:"post",
        success: function (data) {        	
      	  if(data==1){//중복 아이디가 있으면
      		var newtext='<font color="red">중복 아이디입니다.</font>';
      			$("#idcheck").text('');
        		$("#idcheck").show();
        		$("#idcheck").append(newtext);
          		$("#mId").val('').focus();
          		return false;
	     
      	  }else{//중복아이디가 없으면
      		var newtext='<font color="blue">사용가능한 아이디입니다.</font>';
      		$("#idcheck").text('');
      		$("#idcheck").show();
      		$("#idcheck").append(newtext);
      		$("#mem_pwd").focus();
      	  }  	    	  
        }
        ,
    	  error:function(){
    		  alert("data error");
    	  }
      });//$.ajax	
};
/*아이디 중복 체크 끝*/

/* 닉네임 중복 체크*/
function nick_check(){
	$("#nickcheck").hide();//idcheck span 아이디 영역을 숨긴다.
	var memnick=$("#mNick").val();
	
	//닉네임 유효성 검사
	if(!(validate_usernick(memnick))){
		var newtext='<font color="red">닉네임은 영문소문자,숫자,_ 조합만 가능합니다.</font>';
		$("#nickcheck").text('');//문자 초기화
		$("#nickcheck").show();//span 아이디 영역을 보이게 한다.
		$("#nickcheck").append(newtext);
		$("#mNick").val("").focus();
		return false;
	};
	//닉네임 중복확인
    $.ajax({
        type:"POST",
        url:"member_nickcheck",    
        data: {"memnick":memnick},  
        datatype:"post",
        success: function (data) {        	
      	  if(data==1){//중복닉네임이 있으면
      		var newtext='<font color="red">중복 닉네임입니다.</font>';
      			$("#nickcheck").text('');
        		$("#nickcheck").show();
        		$("#nickcheck").append(newtext);
          		$("#mNick").val('').focus();
          		return false;
	     
      	  }else{//중복닉네임이 없으면
      		var newtext='<font color="blue">사용가능한 닉네임입니다.</font>';
      		$("#nickcheck").text('');
      		$("#nickcheck").show();
      		$("#nickcheck").append(newtext);
      		$("#mbirth").focus();
      	  }  	    	  
        }
        ,
    	  error:function(){
    		  alert("data error");
    	  }
      });//$.ajax	
};
/*닉네임 중복 체크 끝*/

function validate_userid(memid)
{
  var pattern= new RegExp(/^[a-z0-9_]{4,20}$/);
  //영문 소문자,숫자 ,_가능,정규표현식
  return pattern.test(memid);
};

function validate_usernick(memnick)
{
  var pattern= new RegExp(/^[a-z0-9_]{4,20}$/);
  //영문 소문자,숫자 ,_가능,정규표현식
  return pattern.test(memnick);
};
 
function domain_list() {
	 var num=f.mail_list.selectedIndex;
	/*selectedIndex속성은 select객체하위의 속성으로서 해당리스트 목록번호를 반환
	*/
	if ( num == -1 ) {
	//num==-1은 해당 리스트목록이 없다
	return true;
	 }
	 if(f.mail_list.value=="0") // 직접입력
	 {
	/*리스트에서 직접입력을 선택했을때*/
	 f.join_maildomain.value="";
	//@뒤의 도메인입력란을 빈공간시켜라.
	 f.join_maildomain.readOnly=false;
	//@뒤의 도메인입력란을 쓰기 가능
	f.join_maildomain.focus();
	//도메인입력란으로 입력대기상태
	}
	 
	 else {
	//리스트목록을 선택했을때
	 
	f.join_maildomain.value=f.mail_list.options[num].value;
	/*num변수에는 해당리스트 목록번호가 저장되어있다.해당리스트 번호의 option value값이 도메인입력란에 선택된다.options속성은 select객체의 속성으로서 해당리스트번호의 value값을 가져온다
	*/
	f.join_maildomain.readOnly=true;
	 }
 }

function delete_member() {
	if(confirm("정말 탈퇴하시겠습니까?")){
		alert("회원탈퇴 성공");
		var formData = $("#nexven_member_form").serialize();
		 
		 $.ajax({
				type : "POST",
			    async : true,
			    cache : false,
			    encoding: "UTF-8",
				data : formData,
			    url : "member_delete_ok",
				success: function(nchk) {
					var nchk = JSON.parse(JSON.stringify(nchk));
					
					if(nchk.success=="성공"){
						$("#nexven_view").modal('hide');
						location.href = "./";						
					}else{
						alert("회원 탈퇴에 실패하였습니다. 오류이유("+nchk.success+")");
						nload("member_join.jsp");
					}

				},
			    error: function(nchk2){
			    	alert("회원 정보 불러오기 실패");
			    }

			});
		
	}
}
 
 /* 회원정보 수정 경고창 */
function edit_check(){
	if($.trim($("#mPass").val())==""){
		 alert("회원비번을 입력하세요!");
		 $("#mPass").val("").focus();
		 return false;
	 }
	 if($.trim($("#mPass2").val())==""){
		 alert("회원비번확인을 입력하세요!");
		 $("#mPass2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mPass").val()) != $.trim($("#mPass2").val())){
		 //!=같지않다 연산. 비번이 다를 경우
		 alert("비번이 다릅니다!");
		 $("#mPass").val("");
		 $("#mPass2").val("");
		 $("#mPass").focus();
		 return false;
	 }
	 if($.trim($("#mName").val())==""){
		 alert("회원이름을 입력하세요!");
		 $("#mName").val("").focus();
		 return false;
	 }
	 if($.trim($("#mNick").val())==""){
		 alert("닉네임을 입력하세요!");
		 $("#mNick").val("").focus();
		 return false;
	 }
	 if($.trim($("#mBirth").val())==""){
		 alert("생년월일을 입력하세요!");
		 $("#mBirth").val("").focus();
		 return false;
	 }
	 if($.trim($("#mZipcode").val())==""){
		 alert("우편번호를 입력하세요!");
		 $("#mZipcode").val("").focus();
		 return false;
	 }
	 if($.trim($("#mAddr1").val())==""){
		 alert("주소를 입력하세요!");
		 $("#mAddr1").val("").focus();
		 return false;
	 }
	 if($.trim($("#mAddr2").val())==""){
		 alert("나머지 주소를 입력하세요!");
		 $("#mAddr2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mTel").val())==""){
		 alert("휴대전화번호를 입력하세요!");
		 $("#join_phone2").val("").focus();
		 return false;
	 }
	 if($.trim($("#mEmail").val())==""){
		 alert("메일 아이디를 입력하세요!");
		 $("#join_mailid").val("").focus();
		 return false;
	 }
	 if($.trim($("#join_maildomain").val())==""){
		 alert("메일 주소를 입력하세요!");
		 $("#join_maildomain").val("").focus();
		 return false;
	 }	
	 
	 var formData = $("#nexven_member_form").serialize();
	 
	 $.ajax({
			type : "POST",
		    async : true,
		    cache : false,
		    encoding: "UTF-8",
			data : formData,
		    url : "member_modify_ok",
			success: function(nchk) {
				var nchk = JSON.parse(JSON.stringify(nchk));
				
				if(nchk.success=="성공"){
					$("#nexven_view").modal('hide');
					alert("회원 정보 수정 성공.");
					location.href = "./";
				}else{
					alert("회원 정보 수정에 실패하였습니다. 오류이유("+nchk.success+")");
					nload("member_join.jsp");
				}

			},
		    error: function(nchk2){
		    	alert("회원 정보 불러오기 실패");
		    }

		});
	 
}
 
 












 
 
 
 