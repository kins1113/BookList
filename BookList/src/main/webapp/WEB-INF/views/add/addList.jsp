<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	$(document).ready(function(){
		
		//카테고리를 선택하면 우측에 리스트 뿌여주기
		/* $("#sampleRecipientInput").change(function(){
			var seVar = $("#sampleRecipientInput option:selected").val();
			alert("카테고리 선택 seVar = "+seVar);
			
		}) */
		
		// 리스트 보이는 곳으로 이동
		$("input[name=ToGo_List]").click(function(){
			$(location).attr('href','<c:url value="/homeList.do"/>');
		});
		
		// 휴지통 보이기
		$("input[name=ToGo_Trash]").click(function(){
			$(location).attr('href','<c:url value="/homeListTrash.do"/>');
		});
		
		// 체크된것 삭제 
		$("input[name=Ck_Del]").click(function(){
			var check=false;
			var ckArr=new Array();
			var count=0
			
			//값이 있다면 배열에 담는다.
			$("input[name=check_del]").each(function(){
				if($(this).is(":checked")==true){
					//alert($(this).next().val()+"     count = "+count);
					check=true;
					ckArr[count]=$(this).next().val();
					count=count+1;
				}
			})
			//체크 된것 확인
			if(!check){
				alert("하나라도 체크 해야합니다...");
				event.preventDefault();
				return;
			}else{
				//값이 있다면.~!
				$.ajax({
					url:"<c:url value='/homeListDelete.do'/>",
					type:"post",
					traditional:true,
					data:{ckArr:ckArr},
					success:function(re){
						if(re > 0){
							$(location).attr('href','<c:url value="/add/addList.do"/>');
						}
					},
					error(xhr, status, error){
						alert(status+" : "+error);
					}
				});
			}
		});
		
		//달력
	})
	
	//페이지 처리 함수
	function pageFunc(curPage){
			$("input[name=currentPage]").val(curPage);
			$("form[name=homeList]").attr("action","<c:url value='/add/addList.do'/>");
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
input#datepicker { margin: 0; min-width: 100%;   padding: 0;}
label {  margin: 0;}
input.btn--primary.full-width.noMargin.noPadding { margin: 0; padding: 0; height: 33px; text-align: center; border: 0;line-height: 1.6rem;}
</style>
  <!-- site content
        ================================================== -->
        <div class="s-content content">
            <main class="row s-styles">
 				<section id="styles" class="column large-full">
 				 <div class="row">
                        <div class="column large-4 tab-full">

                            <h3>ADD LIST</h3>
                            <form name="addHomeList" action="<c:url value='/add/addHomeList.do' />">
                                <label for="addMaker">Categorie</label>
                                <div class="ss-custom-select noMargin noPadding">
                                    	<select class="full-width noMargin noPadding" id="sampleRecipientInput" name="kateNo">
                                         	<option value="0">Choice Categorie</option>
                                         <c:forEach items="${cateList }" var="cateDto">
                                          	<option value="${cateDto.cateNo}">${cateDto.cateName }</option>
                                         </c:forEach>
                                 	   </select>
                                </div>
                                <div>
                                    <label for="addMaker">Name</label>
                                   	 <input class="full-width noMargin noPadding" type="text" placeholder="Name" id="addName" name="hName">
                                </div>
                                <div>
                                    <label for="addName">Maker</label>
                                    <input class="full-width noMargin noPadding" type="text" placeholder="Maker" id="addMaker" name="maker">
                                </div>
                                <div>
	                                <label for="addPrice">Get Price</label>
	                                <input class="full-width noMargin noPadding" type="text" placeholder="Price" id="addPrice" name="hPrice">
	                                <!-- <textarea class="full-width" placeholder="Price" id="addPrice"></textarea> -->
								</div>
								<div>
	                                <label for="addGetDate" for="datepicker">Get Date</label>
	                                <input type="text" id="datepicker" placeholder="GetDate" name="hGetDate">
	                                <script>
								        $("#datepicker").datepicker();
								    </script>
								</div>
                                <label class="add-bottom">
                                    <input type="checkbox">
                                    <span class="label-text noMargin noPadding">이건 뭘로 써야할까...?</span>
                                </label>
                            
                                <input class="btn--primary full-width noMargin noPadding" type="submit" value="Add of List">
                            </form>

                        </div>

                        <div class="column large-8 tab-full">

                            <h3>최근 추가항목</h3>

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
			                            <c:forEach items="${homeList}" var="listDTO">
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
											<a href="#" class="pgn__prev" onclick="pageFunc('${pagingInfo.firstPage-1}')"> <img
												src="<c:url value='/resources/images/first.JPG'/>"
												alt="이전블럭으로 이동">
											</a>
										</c:if>
										<!-- 페이지 번호 추가 -->
										<!-- [1][2][3][4][5][6][7][8][9][10] -->
										<c:forEach var="i" begin="${pagingInfo.firstPage }"
											end="${pagingInfo.lastPage }">
											<c:if test="${i==pagingInfo.currentPage }">
												<span class="pgn__num" style="color: #000000; font-size: 1em">${i }</span>
											</c:if>
											<c:if test="${i!=pagingInfo.currentPage }">
												<a class="pgn__num" href="#" onclick="pageFunc('${i}')">[${i}]</a>
											</c:if>
										</c:forEach>
										<!--  페이지 번호 끝 -->
					
										<!-- 다음 블럭으로 이동하기 -->
										<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
											<a href="#" class="pgn__next" onclick="pageFunc('${pagingInfo.lastPage+1}')"> <img
												src="<c:url value='/resources/images/last.JPG'/>"
												alt="다음블럭으로 이동">
											</a>
										</c:if>
										<input class="btn--primary noMargin noPadding addListButton" type="button" name="ToGo_List" value="ToGo_List">
										<input class="btn--primary noMargin noPadding addListButton" type="button" name="Ck_Del" value="Ck_Del">
										<input class="btn--primary noMargin noPadding addListButton" type="button" name="ToGo_Trash" value="ToGo_Trash">
									</div>
                            	</form>
                            </div>
                    </div> <!-- end row -->
 		</section>
  </main>

   </div> <!-- end s-content -->

<%@include file="/WEB-INF/views/inc/bottom.jsp"%>