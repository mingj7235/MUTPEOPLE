<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Reflex by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
        <meta name="keywords" content="" />
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		
		<style>
		a {
			border-bottom: none;
		
		}
		
		.big-width {
			display : block;
		}
		
		.small-width {
			display : none;
		}
		
		.table-wrapper {
			overflow-x: hidden !important;
		}
		
		.searchbox {
			display : flex;
			justify-content: center;
		}
		
		select {
			width : 25%;
		}
		
		input[name='keyword'] {
			width : 54%;
		}
		
		.search {
			width : 20%;
		}
		
		#selectNum {
			background : #565656;
			color : white;
		}
		
		
		
		@media(max-width : 918px) {
			.writer {
				display : none;
			}
			.regDate {
				display : none;
			}
			.updateDate {
				display : none;
			}
			.big-width {
				display : none;
			}
			.small-width {
				display : block;
			}
			
			.searchbox {
				display : block;
			}
			
			select {
				width : 100%;
			}
			
			input[name='keyword'] {
				width : 100%;
			}
			
			.search {
				width : 100%;
			}
				
			
			
		
		}
		
		
		
		
		</style>
		
		
	</head>
	<body class="is-preload">

		<div>
			<c:import url="../header/header.jsp"/>
		
		</div>
			<c:import url="../sidebar/sidebar.jsp"/> 

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper featured style1">
						<div class="inner">
							<span class="image"><img src="/resources/images/pic01.jpg" alt="" /></span>
							<div class="content">
								<header>
									<h1>Reflex</h1>
									<p>Lorem ipsum dolor sit magna consectetur<br />
									adipiscing elit. Duis dapibus rutrum facilisis.<br />
									Class aptent taciti sociosqu torquent.</p>
								</header>
								<footer>
									<ul class="actions">
										<li><a href="#" class="button big">Get Started</a></li>
									</ul>
								</footer>
							</div>
						</div>
					</section>

				<!-- One -->
					<section class="wrapper style2 special">
						<div class="inner">

                  <!-- Elements -->
                     <header class="major">
                        <h1>Board</h1>
                        <p>????????? ??????</p>
                     </header>
                              <h3><a href="/board/register${pageMaker.cri.getListLink()}" class="button small">??? ??????</a></h3>
                              <div class="table-wrapper">
                                 <table>
                                    <thead>
                                       <tr class="tHead">
                                          <th class="bno">??????</th>
                                          <th class="title">??????</th>
                                          <th class="writer">?????????</th>
                                          <th class="regDate">?????????</th>
                                          <th class="updateDate">?????????</th>
                                       </tr>
                                    </thead>
                                    <tbody>
         								<c:forEach var="board" items="${list}">
         									<tr class="tBody">
	                                          <td class="bno">${board.bno}</td> 
	                                          <td class="title">
	                                          	<a href="/board/get${pageMaker.cri.getListLink()}&bno=${board.bno}">${board.title}
	                                          		<span style = "font-size: 0.5rem">
	                                          			&nbsp;[${board.replyCnt}]
	                                          		</span>		
	                                          	</a>
	                                          </td>
	                                          <td class="writer">${board.writer}</td>
	                                          <td class="regDate">${board.regDate}</td>
	                                          <td class="updateDate">${board.updateDate}</td>
         									</tr>
         								</c:forEach>
                                    </tbody>
                                    <tfoot>
                                    </tfoot>
                                 </table>
                                 
                                  <div class="big-width" style ="text-align: center;">
	                                 	<c:if test="${pageMaker.prev}">
	                                 		<a class="changePage" href="${1}"><code>&lt;&lt;</code></a>
	                                 		<a class="changePage" href="${pageMaker.startPage -1}"><code>&lt;</code></a>
	                                 	</c:if>
	                                 
										<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
											<c:choose>
												<c:when test="${num eq pageMaker.cri.pageNum}">
													<code id="selectNum">${num}</code>
												</c:when>
												<c:otherwise>
													<a class="changePage" href="${num}"><code>${num}</code></a>
												</c:otherwise>
											</c:choose>	
										</c:forEach>
	                                 	<c:if test="${pageMaker.next}">
	                                 		<a class="changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
	                                 		<a class="changePage" href="${pageMaker.realEnd}"><code>&gt;&gt;</code></a>
	                                 	</c:if>
	                                 </div>
	                                 
	                                 <div class="small-width" style ="text-align: center;">
	                                 	<c:if test="${pageMaker.cri.pageNum > 1}">
	                                 		<a class="changePage" href="${1}"><code>&lt;&lt;</code></a>
	                                 		<a class="changePage" href="${pageMaker.cri.pageNum - 1}"><code>&lt;</code></a>
	                                 	</c:if>
										<code>${pageMaker.cri.pageNum}</code>
	                                 	<c:if test="${pageMaker.cri.pageNum <pageMaker.realEnd}">
	                                 		<a class="changePage" href="${pageMaker.cri.pageNum + 1}"><code>&gt;</code></a>
	                                 		<a class="changePage" href="${pageMaker.realEnd}"><code>&gt;&gt;</code></a>
	                                 	</c:if>
	                                 </div>
	                                 
	                                 <!-- ???????????? ???????????? ???????????? pageNum??? amount??? ?????? ?????????????????? form????????? ???????????? ?????????. ?????? js?????? ????????????.  -->
	                                 <form id="changeForm" action="/board/list">
	                                 	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	                                 	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	                                 	<input type="hidden" name="type" value="${pageMaker.cri.type}">
	                                 	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	                                 </form>
	                                 
	                                 <form action="/board/list" id="searchForm">
	                                 	<div class="fields">
	                                 		<div class="field">
	                                 			<div class="searchbox">
		                                 			<!-- criteria??? ????????? type??? ?????????????????? -->
		                                 			<select name="type">
		                                 				<!-- ????????? ?????? selected ??? ????????????????????????! ????????????????????? ???????????????????????? -->
		                                 				<option value ="" ${pageMaker.cri.type==null ? 'selected' : ''}>?????? ??????</option>
		                                 				<option value ="T" ${pageMaker.cri.type=='T' ? 'selected' : ''}>??????</option>
		                                 				<option value ="C" ${pageMaker.cri.type=='C' ? 'selected' : ''}>??????</option>
		                                 				<option value ="W" ${pageMaker.cri.type=='W' ? 'selected' : ''}>?????????</option>
		                                 				<option value ="TC" ${pageMaker.cri.type=='TC' ? 'selected' : ''}>?????? ?????? ??????</option>
		                                 				<option value ="TW" ${pageMaker.cri.type=='TW' ? 'selected' : ''}>?????? ?????? ?????????</option>
		                                 				<option value ="TCW" ${pageMaker.cri.type=='TCW' ? 'selected' : ''}>??????</option>
		                                 			</select>
		                                 			<!-- criteria??? ????????? keyword??? ?????? -->
		                                 			<input id="keyword" type="text" name="keyword" value="${pageMaker.cri.keyword}">
		                                 			<a class="search button primary icon solid fa-search" href="javascript:void(0)">??????</a>
		                                 			
		                                 		</div>
	                                 		</div>
	                                 	</div>
	                                 </form>
                                 
                              </div>
                        </div>
					</section>

				

				<!-- Footer -->
					<section id="footer" class="wrapper split style2">
						<div class="inner">
							<section>
								<header>
									<h3>Magna lorem ipsum</h3>
								</header>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dapibus rutrum facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos magna fames ac turpis egestas amet non lorem amet.</p>
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
									<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
								</ul>
							</section>
							<section>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half"><input type="text" name="name" id="name" placeholder="Name" /></div>
										<div class="field half"><input type="email" name="email" id="email" placeholder="Email" /></div>
										<div class="field"><textarea name="message" id="message" placeholder="Message" rows="4"></textarea></div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="Send Message" /></li>
									</ul>
								</form>
							</section>
						</div>
						<div class="copyright">
							<p>&copy; Untitled. All rights reserved. Lorem ipsum dolor sit amet nullam.</p>
						</div>
					</section>

			</div>

		<!-- Scripts -->
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="/resources/assets/js/browser.min.js"></script>
			<script src="/resources/assets/js/breakpoints.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<script src="/resources/assets/js/main.js"></script>

	</body>
	<script>
	
	
	$("a.search").on("click", function(e){
		e.preventDefault();
		var searchForm = $("#searchForm");
		
		if(!searchForm.find("option:seleced").val()) {
			alert("?????? ?????? ??????????????????");
			return false;
		}
	
		if(!searchForm.find("input[name='keyword']").val()) {
			alert("???????????? ??????????????????");
			return false;
		}	
		searchForm.submit();
		
	})
	
	/* ?????? ??? ????????? ??? ????????????. ????????? ????????? ????????????, href?????? ????????????, ????????? ???????????? input??? ?????? ??? */
	$(".changePage").on("click", function (e){
		e.preventDefault();
		var changeForm = $("#changeForm");
		var pageNum = $(this).attr("href");
		changeForm.find("input[name='pageNum']").val(pageNum);
		changeForm.submit();
	})
	
//	alert("${result}");
	
	/* var result = "${result}" /* list??? ????????? result ??? */	
	
	/* $(document).ready (function () {
		if(result=='' || isNaN(result)) {
			return;
		}
		alert(result);
	}) */
 	
	
	</script>
</html>










