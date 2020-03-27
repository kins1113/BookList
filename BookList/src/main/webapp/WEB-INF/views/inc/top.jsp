<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html class="no-js" lang="en">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Typerite</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/vendor.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/assets/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/assets/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/assets/images/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/resources/assets/site.webmanifest">
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	window.onload = function(){
			//카테고리 정보 가지고 오는 것
			$.ajax({
				url:"<c:url value='/inc/selectCategorie.do'/>",
				type:"post",
				dataType:"json",
				success : function(data){        
					var liArr= "";				
					$.each(data , function(idx, val) {
						//alert(idx +"   "+val.cateName);
						var li ="<li><a href=/BookList/homeList.do?cateNo="+val.cateNo+">"+val.cateName+"</a></li>"
						liArr= liArr+li;
					});
					$("#categorieUl").append(liArr);
					
				},error:function(xhr, status, error){
					alert(status+" : "+error);
				}
			});//ajax
		};
	</script>
<style>
#font-color{color:#9c9a96;}
</style>
</head>
<body>
  <!-- preloader
    ================================================== -->
    <div id="preloader">
        <div id="loader" class="dots-fade">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <div id="top" class="s-wrap site-wrapper">

        <!-- site header
        ================================================== -->
        <header class="s-header">

            <div class="header__top">
                <div class="header__logo">
                    <a class="site-logo" href="${pageContext.request.contextPath}/index.do">
                        <span>HomeList</span>
                    </a>
                </div>

                <div class="header__search">
    
                    <form role="search" method="get" class="header__search-form" action="#">
                        <label>
                            <span class="hide-content">Search for:</span>
                            <input type="search" class="header__search-field" placeholder="Type Keywords" value="" name="s" title="Search for:" autocomplete="off">
                        </label>
                        <input type="submit" class="header__search-submit" value="Search">
                    </form>
        
                    <a href="#0" title="Close Search" class="header__search-close">Close</a>
        
                </div>  <!-- end header__search -->

                <!-- toggles -->
                <a href="#0" class="header__search-trigger"></a>
                <a href="#0" class="header__menu-toggle"><span>Menu</span></a>

            </div> <!-- end header__top -->

            <nav class="header__nav-wrap">

                <ul class="header__nav">
                    <li class="current"><a href="${pageContext.request.contextPath}/index.do" title="">Home</a></li>
                    <li class="has-children">
                    	<a href="#0" title="">Add</a>
                        <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/add/addList.do">+List</a></li>
                        <li><a href="${pageContext.request.contextPath}/add/selectCategorie.do">+Categorie</a></li>
                        <li><a href="${pageContext.request.contextPath}/add/addUser.do">+User</a></li>
                        </ul>
                    </li>
                    <li class="has-children">
                        <a href="#0" title="" id="topCategories">Categories</a>
                        <ul class="sub-menu" id="categorieUl">
                        </ul>
                    </li>
                      <li class="current"><a  href="${pageContext.request.contextPath}/homeList.do" title="">HomeList</a></li>
                    <!-- <li class="has-children">
                        <a href="#0" title="">Blog Posts</a>
                        <ul class="sub-menu">
                        <li><a href="single-video.html">Video Post</a></li>
                        <li><a href="single-audio.html">Audio Post</a></li>
                        <li><a href="single-gallery.html">Gallery Post</a></li>
                        <li><a href="single-standard.html">Standard Post</a></li>
                        </ul>
                    </li>
                    <li><a href="styles.html" title="">Styles</a></li>
                    <li><a href="page-about.html" title="">About</a></li>
                    <li><a href="page-contact.html" title="">Contact</a></li> -->
                </ul> <!-- end header__nav -->

                <ul class="header__social">
                    <li class="ss-facebook">
                        <a href="https://facebook.com/">
                            <span class="screen-reader-text">Facebook</span>
                        </a>
                    </li>
                    <li class="ss-twitter">
                        <a href="#0">
                            <span class="screen-reader-text">Twitter</span>
                        </a>
                    </li>
                    <li class="ss-dribbble">
                        <a href="#0">
                            <span class="screen-reader-text">Dribbble</span>
                        </a>
                    </li>
                    <li class="ss-pinterest">
                        <a href="#0">
                            <span class="screen-reader-text">Behance</span>
                        </a>
                    </li>
                </ul>

            </nav> <!-- end header__nav-wrap -->

            

        </header> <!-- end s-header -->