<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/inc/top.jsp"%>
<style type="text/css" >
.alert-box.alert-box--notice.hideit {float: left; width: 9vw; MARGIN: 5PX; height: 9vw;}
h3#h3_AEC {margin-bottom: 0;}
a.showList, a.showIcon{ font-size: 12px; color: #a2a2a2; padding-left: 5px;}
th.tb1 { padding: 0;}
td.tb1 { padding: 0; color: #6b6b6b; font-size: 13px;}
th.tb2 { padding: 0;}
td.tb2 { padding: 0; color: #6b6b6b; font-size: 13px;}
th.tb3 { padding: 0;}
td.tb3 { padding: 0; color: #6b6b6b; font-size: 13px;}
th.tb4 { padding: 0;}
td.tb4 { padding: 0; color: #6b6b6b; font-size: 13px;}
span.spanInfo { font-size: 10px;}
span.impossible{color:red;}
span.possible{color: #026e28;}
input#CateName { margin: 0; padding-bottom: 0;}

</style>
<c:set var="showCk" value="icon"></c:set>
<script type="text/javascript">
	$(document).ready(function (){
		$("#categorieShow_icon").hide();
		$(".showIcon").click(function(){
			$("#categorieShow_icon").show();
			$("#categorieShow_List").hide();
		})
		$(".showList").click(function(){
			$("#categorieShow_icon").hide();
			$("#categorieShow_List").show();
		})
		
		//체크 카테고리 이름이 중복인지 체크 
		$(".impossible").hide();
		$(".possible").hide();
		$("#CateName").keyup(function(){
			var cateName=$(this).val();
				
			$.ajax({
				url:"<c:url value='/add/nameCheck.do'/>",
				type:"post",
				data:{cateName:cateName},
				success:function(re){
					if(re > 0){
						$(".impossible").show();
						$(".possible").hide();
					}else{
						$(".possible").show();
						$(".impossible").hide();
					}
				},
				error(xhr, status, error){
					alert(status+" : "+error);
				}
			})//ajax
		})//keyup
		
		//Use 덥블클릭 이벤트로 사용중 미사용중 update처리
		$(".cateUseCk").each(function(){
			$(this).dblclick(function(){
				var cateNo=$(this).prev().prev().prev().text();
				var useCk=$(this).next().val();
				//alert("cateNo="+cateNo+" cateCk="+cateCk);
				$.ajax({
					url:"<c:url value='/add/cateUserChange.do'/>",
					type:"post",
					data:{"cateNo":cateNo,"useCk":useCk},
					success:function(){
						if(useCk=="n"){
							//사용중으로 변경	
							$("#UseCk"+cateNo).text("사용중");
							$("input[name=hiddenUseCk"+cateNo+"]").val("y");
						}else if(useCk=="y"){
							//미사용으로 변경
							$("#UseCk"+cateNo).text("미사용");
							$("input[name=hiddenUseCk"+cateNo+"]").val("n");
						}
					},error:function(xhr, status, error){
						alert(status+" : "+error);
					}
				}); //ajax
			})
		});  //each
	})
</script>

  <!-- site content
        ================================================== -->
        <div class="s-content content">
            <main class="row s-styles">
 				<section id="styles" class="column large-full">
 				 <div class="row">
                        <div class="column large-6 tab-full">

                            <h3>ADD KATEGORIE</h3>
                            <form action="<c:url value='/add/addCategoreInsert.do'/>" method="post" name="cateInsert">
                                <div>
                                    <label for="addName">Kategorie Name</label>
                                    <input class="full-width" type="text" placeholder="Name" id="CateName" name="cateName">
                                    <span class="spanInfo possible">사용가능합니다.</span>
                                    <span class="spanInfo impossible">이미 이름이 있습니다. 다른 이름을 입력해 주세요.</span>
                                </div>
                               <!--  <div>
                                    <label for="addMaker">Maker</label>
                                    <div class="ss-custom-select">
                                    	 <input class="full-width" type="text" placeholder="Maker" id="addMaker">
                                         <select class="full-width" id="sampleRecipientInput">
                                            <option value="Option 1">Questions</option>
                                            <option value="Option 2">Report</option>
                                            <option value="Option 3">Others</option>
                                        </select> 
                                    </div>
                                </div> -->
                                
                                <label for="addPrice">Kategorie Info</label>
                                <!-- <input class="full-width" type="text" placeholder="Name" id="CateInfo"> -->
                                <textarea class="full-width" placeholder="Info" id="CateInfo" name="cateInfo"></textarea> 

                                <label class="add-bottom">
                                    <input type="checkbox" name="useCk" for="useCk" value="y">
                                    <span class="label-text" id="useCk">Do you want to use it right away?</span><br>
                                    <span class="label-text" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(The default is no.)</span>
                                </label>
                            
                                <input class="btn--primary full-width" type="submit" value="Add Kategorie">
                            </form>

                        </div>

                        <div class="column large-6 tab-full" id="categorieShow_icon">

                            <h3 id="h3_AEC">Already Exists Kategories</h3>
                            	<a href="#" class="showList">The Show List</a>
                            <br>
                            
	                            <c:forEach items="${cateList}" var="dto" >
	                            	<div class="alert-box alert-box--notice hideit" 
	                            		<c:if test='${dto.useCk =="n"}'>
		                            		style="background-color: #ffd1d2;color: #dd4043;"
	                            		</c:if>
	                            		<c:if test='${dto.useCk =="y"}'>
		                            		style="background-color: #d5ebfb;color: #387fb2;"
	                            		</c:if>
	                            	>
	                                <span>${dto.cateName}</span>
	                           <%-- <span>${dto.cateInfo}</span> --%>
	                                <i class="fa fa-times alert-box__close" id= aria-hidden="true"></i>
	                            </div>
	                            </c:forEach>
                            </div>
                             <div class="column large-6 tab-full" id="categorieShow_List">
	                              <h3 id="h3_AEC">Already Exists Kategories</h3>
	                            	<a href="#" class="showIcon">The Show Icon</a>
                         	  	 <br>
                            	<table>
                            		<tr>
                            			<th class="tb1">.No</th>
                            			<th class="tb2">Name</th>
                            			<th class="tb3">Infomation</th>
                            			<th class="tb4">Use</th>
                            		</tr>
		                        	 <c:forEach items="${cateList}" var="dto" >
		                            	<tr>
		                            		<td class="tb1">${dto.cateNo }</td>
		                            		<td class="tb2">${dto.cateName }</td>
		                            		<td class="tb3">${dto.cateInfo }</td>
		                            		<td class="tb4 cateUseCk" id="UseCk${dto.cateNo }" ><c:if test="${dto.useCk =='y' }">사용중</c:if><c:if test="${dto.useCk =='n' }">미사용</c:if></td>
		                            		<input type="hidden" name="hiddenUseCk${dto.cateNo }" value="${dto.useCk }"/>
		                            	</tr>	
                            </c:forEach>
                            	</table>
                            </div>
                    </div> <!-- end row -->
 		</section>
  </main>

   </div> <!-- end s-content -->

<%@include file="/WEB-INF/views/inc/bottom.jsp"%>