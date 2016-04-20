<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="/springboard/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
#writeForm>div{
	background-color: maroon;
}
.field {
	width: 100%;
}
</style>
<meta charset="UTF-8">
<title>게시판 입력폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<fieldset class="field">
		<div id="bbs">
			<form id="writeForm" action="/springboard/board_write_ok.nhn" method="post"
				enctype="multipart/form-data">
				<hr>
				<div id="write-form" style="width: 100%;">
					<div  class="title">
						<div id="p_category"><select>
								<option>잡담</option>
								<option>잡담</option>
								<option>잡담</option>
								<option>잡담</option>
								<option>잡담</option>
						</select> &nbsp;&nbsp;&nbsp;제목 : &nbsp;&nbsp;&nbsp; <input type="text"
							id="p_title" name="title" style="width: 50%;" /> <i style="float: right;">id
								받는곳</i> <img src="/springboard/images/log-in.jpg"
							style="height: 100%; float: right;" /></div>
					</div>
<!-- 					<tr> -->
<!-- 						<td colspan="3">첨부 파일</td> -->
<!-- 						<td><input type="file" name="attachFile" /></td> -->
<!-- 					</tr> -->
				</div>
					<textarea name="content" id="content" rows="22"
							style="width: 100%; float: none;" ></textarea>
						<script type="text/javascript">

					 var oEditors = [];

					 nhn.husky.EZCreator.createInIFrame({

					 oAppRef: oEditors,

					 elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다.

					 sSkinURI: "/springboard/SmartEditor2Skin.html",

					 fCreator: "createSEditor2"

					 });

				</script>
				<hr>
				<div id="bbswrite_menu" style="float: right;">
					<input type="submit" value="작성완료" class="input_button"
						style="float: left;" /> <input type="reset" value="목록"
						class="input_button" />
				</div>
			</form>
		</div>
	</fieldset>
</body>
</html>