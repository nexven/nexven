<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">

	    var bName = "${param.bName}";
	    
/* 	    $.ajax({
		    type: "GET",
		    async : true,
		    cache : false,
		    encoding: "UTF-8",
		    url: "boardnum?bNum="+bNum,
		    contentType: "application/json",
			success: function(result) {			
		        var json = JSON.stringify(result);
		        var arr = JSON.parse(json);
		        
		        $("#bname").html(arr.bname);		        
		        //var sdate = dateFormat(arr.bdate, "yyyy/dd/mm");
		        $("#bdate").html(arr.bdate);		        
		        $("#btitle").html(arr.btitle);
		        $("#bcategory").html(arr.bcategory);
		        $("#mid").html(arr.mid);
		        $("#bhit").html(arr.bhit);
		        $("#bgood").html(arr.bgood);
		        $("#bfile").html(arr.bfile);
		        $("#mip").html(arr.mip);
		        $("#bcontent").html(arr.bcontent);		        
		        $("#bfile").html(arr.bfile);
		        $("#bstate").html(arr.bstate);
		        $("#mip").html(arr.mip);
		        $("#mtel").html(arr.mtel);
		        $("#bprice").html(arr.bprice);
		        $("#bcontent").html(arr.bcontent);
		        
		        bName=arr.bname;
		       	    	
		    },
		    error: function(){
		        alert('게시글 불러오기 실패');
		    }
		});
	     */
	     
		function list(){
			nload("board/list.jsp?bName="+bName,bName+" 커뮤니티","");
			return false;
		}
	

</script>


	<div style="padding-bottom:20px;margin-bottom:10px;border-bottom:1px solid #ccc;">
		<button onclick='javascript:list();' class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
	</div>

	<div class="table-responsive">
		 <table class="table table-bordered table-hover" style="margin:0;">
			<tbody>
				<tr>
			 		<th>작성자</th>
			 		<td id="mid"></td>
	
			 		<th>카테고리</th>
			 		<td id="bcategory"></td>
			 	</tr>
				<tr>
			 		<th>작성시간</th>
			 		<td id="bdate"></td>
	
			 		<th>조회수</th>
			 		<td id="bhit"></td>
			 	</tr>
			 	<tr>
			 		<th>추천</th>
			 		<td id="bgood"></td>
	
			 		<th>첨부파일</th>
			 		<td id="bfile"></td>
		 		</tr>
		 		<tr>
			 		<th>아이피</th>
			 		<td id="mip"></td>
			 		
			 		<th>연락처</th>
			 		<td id="mtel"></td>
		 		</tr>
	
				<tr>
				 	<th>거래상태</th>
			 		<td id="bstate"></td>
			 		
			 		<th>물품금액</th>
			 		<td id="bprice"></td>
			 	</tr>
				<tr>
	
			 	</tr>
		 	</tbody>
		 </table>
	</div>

	<div id="bcontent" style="margin:20px 0;padding:20px;">

	</div>

	
<%--	
<div style="margin:20px 0;padding:20px;">
	<form id="bappend" method="post">
		
		<div class="form-group">
			<label for="ename">Ename</label>
			<input id="ename" name="ename" class="form-control" minlength="2" maxlength="10" pattern="/^[가-힣a-zA-Z]+$/" required="required" />
		</div>

		<div class="form-group">
			<label for="empno">Empno</label>
			<input id="empno" type="number" name="empno" class="form-control" min="1000" max="9999" required="required" />
		</div>

		<div class="form-group">
			<label for="job">Job</label>
			<input id="job" name="job" class="form-control" maxlength="9" />
		</div>
		
		<div class="form-group">
			<label for="mgr">Mgr</label>
			<div>
				<select id="mgr" name="mgr" data-ng-model="emp.mgr">
					<option>--선택하세요--</option>
					<option data-ng-repeat="mgr in mgrs" value="{{mgr.empno}}">{{mgr.empno}} / {{mgr.ename}}</option>				
				</select>
			</div>
		</div>
		
		<div class="input-group">
			<input type="text" name="date" class="form-control" />
			<span class="input-group-btn">
				<button type="button" class="btn btn-default" onclick="open()"><i class="glyphicon glyphicon-calendar" style="color:lightblue;"></i></button>
				<button type="button" class="btn btn-default" onclick="clear()"><i class="glyphicon glyphicon-remove" style="color:lightblue;"></i></button>
			</span>
		</div>
		
		<div class="form-group">
			<label for="sal">Sal</label>
			<input id="sal" type="number" name="sal" class="form-control" data-ng-model="emp.sal" data-ng-min="0" data-ng-max="9999999" />
		</div>
		

		<div class="form-group">
			<label for="comm">Comm</label>
			<input id="comm" type="number" name="comm" class="form-control" data-ng-model="emp.comm" data-ng-min="0" data-ng-max="9999999" />
		</div>
		

		<div class="form-group">
			<label for="deptno">Deptno</label>
			<select id="deptno" name="deptno" data-ng-model="emp.deptno">
				<option value="">--선택하세요--</option>
				<option data-ng-repeat="dept in deptnos" value="{{dept.deptno}}">{{dept.deptno}} / {{dept.dname}} / {{dept.loc}}</option>				
			</select>
		</div>
			<input type="submit" class="btn btn-primary" data-ng-disabled="empForm.$invalid" value="직원추가" />&nbsp;&nbsp;<input type="reset" class="btn btn-primary" value ="초기화" />

	</form>
</div>
--%>

	
	
	
	
	
	

	<div style="padding-top:20px;border-top:1px solid #ccc;">
		<button onclick='javascript:list();' class="btn btn-default"><i class="glyphicon glyphicon-list"> 목록으로</i></button>
	</div>
