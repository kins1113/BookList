<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		/* 체크 된 것 완전삭제 ... 
			삭제전에 한번더 물어보기
		*/
		$("input[name=Trash_Del]").click(function(){
			var check=false;
			var count=0;
			var ckArr=new Array();
			
			$("input[name=check_del]").each(function(){
				if($(this).is(":checked")==true){
					check=true;
					ckArr[count]=$(this).next().val();
					count=count+1;
				}							
			});//each
			
			if(!check){
				alert("하나라도 체크하셔야 합니다.");
				event.preventDefault();
				return;
			}else{
				if(confirm("완전히 삭제됩니다. 그래도 삭제하시겠습니까?")){
					//ajax를 이용해서 배열을 보내고 삭제..
					$.ajax({
						url:"<c:url value='/deleteHome.do'/>",
						type:"post",
						traditional:true,
						data:{"ckArr":ckArr},
						success:function(re){
								alert(re+"개가 삭제 되었습니다.");
								$(location).attr('href','<c:url value="/homeListTrash.do"/>');
						},
						error(xhr, status, error){
							alert(status+" : "+error);
						}
					});//ajax
				}
			}
		});
		
		//전체 선택 기능...
		$("input[name=checkAll]").click(function(){
			var check=$(this).is(":checked");
			if(check==true){
				//전체 체크 하기
				$("input[name=check_del]").each(function(){
					$(this).attr("checked", true);
				})
			}else{
				//전체 체크 풀기
				$("input[name=check_del]").each(function(){
					$(this).attr("checked", false);
				})
			}
		});
		
		// add로 가기 
		$("input[name=ToGo_Add]").click(function(){
			$(location).attr("href","<c:url value='/add/addList.do'/>")
		});
		
		// list로 가기
		$("input[name=ToGo_List]").click(function(){
			$(location).attr("href","<c:url value='/homeList.do'/>")
		});
	});
	
	//페이지 처리 함수
	function pageFunc(curPage){
		$("input[name=currentPage]").val(curPage);
		$("form[name=homeList]").attr("action","<c:url value='/homeListTrash.do'/>");
		$("form[name=homeList]").submit();
	}
</script>
<style type="text/css" >
#addListTbody td {padding: 2px 0 0 0;font-size: 13px;}
#addListThead th {padding: 0;}
.noMargin{margin:0}
.noPadding{padding:0}
input.checkbox {margin-top: 5px; margin-bottom: 5px;}
input.btn--primary.noMargin.noPadding.addListButton {height: 3rem; line-height: 1.6rem;  padding: 0 5px 0 5px; float:right; font-size: 8px;}
#addListDiv {min-height: 418.4px;margin-bottom: 32px;}
#addListThead th, #addListTbody td {text-align: center;}
#addListThead th:nth-of-type(1){width: 2%;}
#addListThead th:nth-of-type(2){width: 2%;}
#addListThead th:nth-of-type(3){width: 30%;text-align: left; padding-left: 10px;}
#addListThead th:nth-of-type(4){width: 11%;}
#addListThead th:nth-of-type(5){width: 15%;}
#addListThead th:nth-of-type(6){width: 15%;}
#addListThead th:nth-of-type(7){width: 7%;}
#addListTbody td:nth-of-type(1){width: 2%;}
#addListTbody td:nth-of-type(2){width: 2%;}
#addListTbody td:nth-of-type(3){width: 30%;text-align: left; padding-left: 10px;}
#addListTbody td:nth-of-type(4){width: 11%;}
#addListTbody td:nth-of-type(5){width: 15%;}
#addListTbody td:nth-of-type(6){width: 15%;}
#addListTbody td:nth-of-type(7){width: 7%;}
</style>
<div class="s-content content">
	<main class="row s-styles">
	<section id="styles" class="column large-full">
		<div class="row">
			 <div class="column large-12 tab-full">
                      <h3>HomeList Trash</h3>

                      <br>
                      <div id="addListDiv">
                      	<table>
                      		<thead id="addListThead">
                      			<tr>
                      				<th><input type="checkbox" class="checkbox" name="checkAll"/></th>
                      				<th>.No</th>
                      				<th>.Name</th>
                      				<th>.Price</th>
                      				<th>.maker</th>
                      				<th>.GDate</th>
                      				<th>.Kg</th>
                      			</tr>	
                      		</thead>
                      		<tbody id="addListTbody"> 
                         <c:forEach items="${homeListTrash}" var="listDTO">
                        		<tr>
                        			<td>
                        				<input type="checkbox" class="checkbox" name="check_del" />
										<input type="hidden" value="${listDTO['H_NO'] }" />		                            			
                        			</td>
                        			<td>${listDTO['H_NO']}</td>
                        			<td>${listDTO['H_NAME']}</td>
                        			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${listDTO['H_PRICE']}"/></td>
                        			<td>${listDTO['MAKER']}</td>
                        			<td><fmt:formatDate value="${listDTO['H_GETDATE']}" pattern="YY.MM.dd"/></td>
                        			<td>${listDTO['CATE_NAME'] }</td>
                        		</tr>
                         </c:forEach>
                      		</tbody>
                      	</table>
                     	</div>
                      	<form name="homeList" method="post">
                      	<!-- 페이징 처리를 위한 히든값 -->
                      	<input type="hidden" name="currentPage" />
                       	<!-- 15개 까지만 나오고 패이징 처리 -->
                       	<div class="divPage" align="center">
				<!-- 이전블럭으로 이동하기 -->
				<c:if test="${pagingInfo.firstPage>1 }">
					<a href="#" onclick="pageFunc('${pagingInfo.firstPage-1}')"> <img
						src="<c:url value='/resources/images/first.JPG'/>"
						alt="이전블럭으로 이동">
					</a>
				</c:if>
				<!-- 페이지 번호 추가 -->
				<!-- [1][2][3][4][5][6][7][8][9][10] -->
				<c:forEach var="i" begin="${pagingInfo.firstPage }"
					end="${pagingInfo.lastPage }">
					<c:if test="${i==pagingInfo.currentPage }">
						<span style="color: blue; font-size: 1em">${i }</span>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<a href="#" onclick="pageFunc('${i}')">[${i}]</a>
					</c:if>
				</c:forEach>
				<!--  페이지 번호 끝 -->

				<!-- 다음 블럭으로 이동하기 -->
				<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
					<a href="#" onclick="pageFunc('${pagingInfo.lastPage+1}')"> <img
						src="<c:url value='/resources/images/last.JPG'/>"
						alt="다음블럭으로 이동">
					</a>
				</c:if>
				<input class="btn--primary noMargin noPadding addListButton" type="button" name="Trash_Del" value="Trash_Del">
				<input class="btn--primary noMargin noPadding addListButton" type="button" name="ToGo_List" value="ToGo_List">
				<input class="btn--primary noMargin noPadding addListButton" type="button" name="ToGo_Add" value="ToGo_Add">
			</div>
                      	</form>
                      </div>

		</div>
		<!-- end row -->
	</section>
	</main>

</div>
<!-- end s-content -->

<%@include file="/WEB-INF/views/inc/bottom.jsp"%>