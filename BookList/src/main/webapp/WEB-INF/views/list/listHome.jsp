<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	//add로 가기 
	$("input[name=ToGo_Add]").click(function(){
		$(location).attr("href","<c:url value='/add/addList.do'/>")
	});
	
	// list로 가기
	$("input[name=ToGo_Trash]").click(function(){
		$(location).attr("href","<c:url value='/homeListTrash.do'/>")
	});
});

//페이지 처리 함수
function pageFunc(curPage){
$("input[name=currentPage]").val(curPage);
$("form[name=homeList]").attr("action","<c:url value='/homeList.do'/>");
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
                      <h3>HomeList All</h3>

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
                      		<c:if test="${empty listHome}">
                         		<tr>
                         			<td colspan="7" rowspan="3"> 카테고리의 가지고 계신 목록이 없습니다......!@#$%^&*()</td>
                         		</tr>
                         		<tr></tr>
                         		<tr></tr>
                         	</c:if>
                         	<c:if test="${!empty listHome }">
		                         <c:forEach items="${listHome}" var="listDTO">
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
	                         </c:if>
                      		</tbody>
                      	</table>
                     	</div>
                      	<form name="homeList" method="post">
                      	<!-- 페이징 처리를 위한 히든값 -->
                      	<input type="hidden" name="currentPage" />
                      	<!-- cateNo를 저장하기 위한 히든 값 -->
                      	<input type="hidden" name="cateNo" value="${param.cateNo}"/>
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
				<input class="btn--primary noMargin noPadding addListButton" type="button" name="CK_DEL" value="CK_DEL">
				<input class="btn--primary noMargin noPadding addListButton" type="button" name="ToGo_Trash" value="ToGo_Trash">
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