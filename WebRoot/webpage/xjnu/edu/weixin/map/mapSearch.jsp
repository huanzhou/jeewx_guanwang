﻿<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>地图搜索</title>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport">
	<meta content="telephone=no" name="format-detection">
	<meta content="email=no" name="format-detection">

	<link href="${webRoot}/plug-in/weixin_mall/static/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${webRoot}/plug-in/weixin_mall/static/style/wxsc.css" rel="stylesheet">
    <link href="${webRoot}/plug-in/weixin_mall/static/style/style.css" rel="stylesheet">
	<script src="${webRoot}/plug-in/weixin_mall/static/jquery/jquery-2.0.3.min.js" type="text/javascript"></script>	
	<script src="${webRoot}/plug-in/weixin_mall/static/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	<script src="${webRoot}/plug-in/weixin_mall/static/handlebars/handlebars-v1.3.0.js" type="text/javascript"></script>
	<script src="${webRoot}/plug-in/weixin_mall/static/script/map1.js?vdfdss2323123454254" type="text/javascript"></script>
	<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
	
	<script>
		var map ;
		var buiddingsArray  = new Array();
		var center = new qq.maps.LatLng( ${builddingLat} , ${builddingLng} );
		//var schoolId = ${schoolId} ;
		var latlngBounds = null ;
		var zoom = 13 ;
		//var builddingCatalogList = {"classList":[ { "id": "53e33542f8295b2e57db3c13", "className": "Paige Wagner", "catalogList": [ { "id": 0, "catalogName": "Kelly Mcgee" }, { "id": 1, "catalogName": "Johanna Parrish" }, { "id": 2, "catalogName": "Davis Santos" }, { "id": 3, "catalogName": "Lawrence Figueroa" }, { "id": 4, "catalogName": "Amanda Mclean" }, { "id": 5, "catalogName": "Wright Snider" }, { "id": 6, "catalogName": "Fitzpatrick Reeves" }, { "id": 7, "catalogName": "Georgette Pratt" }, { "id": 8, "catalogName": "Hooper Harper" } ] }, { "id": "53e335423a70e5b8a28d8060", "className": "Margery Gill", "catalogList": [ { "id": 0, "catalogName": "Britt Oliver" }, { "id": 1, "catalogName": "Flowers Cabrera" }, { "id": 2, "catalogName": "Angelina Tucker" }, { "id": 3, "catalogName": "Price Ellis" }, { "id": 4, "catalogName": "Underwood Parks" } ] }, { "id": "53e3354218aab87822d1c889", "className": "Holmes Burks", "catalogList": [ { "id": 0, "catalogName": "Traci Bryant" }, { "id": 1, "catalogName": "Mcbride Finch" }, { "id": 2, "catalogName": "Elma Woods" }, { "id": 3, "catalogName": "Swanson Whitfield" }, { "id": 4, "catalogName": "Charles Bowman" }, { "id": 5, "catalogName": "Cole Howe" }, { "id": 6, "catalogName": "Hart Donaldson" }, { "id": 7, "catalogName": "Lori Miller" } ] }, { "id": "53e33542304bc42b8526f36e", "className": "Dodson Henry", "catalogList": [ { "id": 0, "catalogName": "Kenya Barrett" }, { "id": 1, "catalogName": "Cannon Bishop" }, { "id": 2, "catalogName": "Justine Hunt" }, { "id": 3, "catalogName": "Wendi Heath" }, { "id": 4, "catalogName": "Caldwell Mcdowell" }, { "id": 5, "catalogName": "Tyson Hurst" }, { "id": 6, "catalogName": "Frank Sherman" }, { "id": 7, "catalogName": "Shana Odom" } ] }, { "id": "53e3354274968d0782ff8a53", "className": "Hardy Holland", "catalogList": [ { "id": 0, "catalogName": "Haney Rodriquez" }, { "id": 1, "catalogName": "Nanette Kelly" }, { "id": 2, "catalogName": "Tabatha Ramirez" }, { "id": 3, "catalogName": "Barrett Mullen" }, { "id": 4, "catalogName": "Carlson Caldwell" }, { "id": 5, "catalogName": "Lenora Mcclain" }, { "id": 6, "catalogName": "Newman Brooks" }, { "id": 7, "catalogName": "Nadia Greene" } ] }, { "id": "53e335422e982ab1844b144e", "className": "Erickson Mack", "catalogList": [ { "id": 0, "catalogName": "Lang Moreno" }, { "id": 1, "catalogName": "Jacklyn Dorsey" }, { "id": 2, "catalogName": "Burch Jensen" }, { "id": 3, "catalogName": "Foley Webb" }, { "id": 4, "catalogName": "Chandler Swanson" }, { "id": 5, "catalogName": "Mitchell Le" }, { "id": 6, "catalogName": "Marissa Lawrence" } ] }, { "id": "53e33542a68eda667ed8994d", "className": "Marla Howell", "catalogList": [ { "id": 0, "catalogName": "Hill Benson" }, { "id": 1, "catalogName": "Genevieve Little" }, { "id": 2, "catalogName": "Jaclyn Mayo" }, { "id": 3, "catalogName": "Alexandra Gay" }, { "id": 4, "catalogName": "Ladonna Merritt" }, { "id": 5, "catalogName": "Colleen Orr" }, { "id": 6, "catalogName": "Oneill Duncan" }, { "id": 7, "catalogName": "Gay Parker" } ] }, { "id": "53e335421d5ba37c27044cbc", "className": "Linda Oneal", "catalogList": [ { "id": 0, "catalogName": "Goodwin Battle" }, { "id": 1, "catalogName": "Jeanie Berger" }, { "id": 2, "catalogName": "Holly Sexton" } ] } ] };
		var builddingCatalogList = ${classListJson} ;
		 function onSearchClick( srcElement )
		 {
		 	deleteMarkers();
			$('#catalog_title_button').html($(srcElement).html());
			var options = {
				dataUrl : '${webRoot}/mapSearchController.do?mapSearch', 
				methodType : 'post', 
				requestData : {open_user_id : $.getParam('open_user_id') , catalogId : $(srcElement).attr('id')},
				templateUrl : '${webRoot}/plug-in/weixin_mall/static/template/placeInfo.htm' ,
				componentSelector :  "#ulId" ,
				renderFun :function(item , i , source ) {
								loadBuilddingArray(item , i , source );
							} ,
							
				completeFun :function() {
								 if(latlngBounds == null)
								{
									map.setCenter(center);
									map.setZoom(zoom);
								}
								else
								{
									map.fitBounds(latlngBounds);
								}
							}
			  
			};
			$.renderComponentByAjax(options);
			
		 }
		 
		function showConfirm(build , e )
		{
			var r=confirm("确定修改？");
			if (r==true)
			{
			
				$.ajax({
					url: '${webRoot}/mapSearchController.do?save',
					type: 'post',
					data:  {id:build.id , weidu : e.latLng.getLat() , jindu: e.latLng.getLng()} ,
					dataType: 'json'
				}).done(function( data ) {
					alert(data.msg);
				});
				
			}
		}
		  
		function deleteMarkers() {
			if (buiddingsArray) {
				for (i in buiddingsArray) {
					buiddingsArray[i].marker.setMap(null);
					buiddingsArray[i].descriptionHtml = '';
				}
				buiddingsArray.length = 0;
			}
			latlngBounds = null;
		}
		 
		function loadBuilddingArray(item , i , source )
		{

			var buildding ={};
			buildding.id = item.id ;
			var template = Handlebars.compile( source );
			var html = template( item );
			buildding.descriptionHtml = html ;
			var position = new qq.maps.LatLng(item.weidu,item.jindu);
			
			buildding.marker= new qq.maps.Marker({
			  position: position,
			  draggable: true,
			  map: map
			});
			if( latlngBounds == null )
			{
				latlngBounds = new qq.maps.LatLngBounds(buildding.marker.getPosition(), buildding.marker.getPosition());
			}
			else 
			{
				latlngBounds.extend(buildding.marker.getPosition());
			}
			
			
			qq.maps.event.addListener(buildding.marker, 'click', function() {
			var infoWin = new qq.maps.InfoWindow({
				map: map
			});
			  infoWin.open();
			  infoWin.setContent( buildding.descriptionHtml );
			  infoWin.setPosition(position);
			});

			qq.maps.event.addListener(buildding.marker, 'dragend', function(e) {
			  //showConfirm(buildding , e)
			});
			buiddingsArray.push(buildding) ;
			
			
			

		}
		
		 function init()
		 {
			 var options = {
					templateUrl : '${webRoot}/plug-in/weixin_mall/static/template/locationItem.htm' ,
					componentSelector :  "#ulId" ,
					convertFun :function( item ) {
									var itemTemplate = {
										itemId : item.id ,
										itemText : item.catalogName ,
										itemOnclick : 'onSearchClick( this )'
									}
									return itemTemplate;
								},
					process:function( elem ) {
							var settings = this ;
							$.each( builddingCatalogList.obj , function( i , singleClass ) {
								if($(elem).attr('id') == singleClass.id)	
								{
									//$.extend( this , {data : singleClass.catalogList} );
									settings.data = singleClass.tbBuilddingCatalogs ;
									$('#class_title_button').html($(elem).html());
									$('#catalog_title_button').html('&nbsp;&nbsp; ');
									
								}
							});		
					}
				};
			$('.classItem').refreshChildDropdowns(options);
			
			map = new qq.maps.Map(document.getElementById('map_container'),{
				center: center,
				zoom: zoom
			});
			
			var infoWin = new qq.maps.InfoWindow({
				map: map
			});
				
		 }
		 
	</script>
      
<style type="text/css">
	.menu {position:fixed; height:40px; bottom:25px; left:10px;}
	.menu .nav ul {display:none; margin:4px 0 0 0; padding: 10px 10px 6px 47px; float:left; background:#FFF; height:42px; border-radius:22px; box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.03); overflow:hidden;}
	.menu .nav li {border-left:1px solid #e7e7e7; padding:0 8px; float:left; line-height:22px; list-style:none;color:#34495e}
	.menu .nav li a:hover,a:visited{color:#34495e;text-decoration:none;}
	.menu .logo {width:50px; height:50px;border-radius:50%; border:2px solid #FFF; position:relative; background:url(static/images/07.jpg) no-repeat #41c281;position:absolute;box-shadow:0px 0px 8px rgba(0, 0, 0, 0.3); background-size:46px 46px;}
</style>

	</head>




<body style="color: rgb(52, 73, 94); background: rgb(236, 240, 241);"  onload="init()">
<div class="container">


<div class="paixu">


<div class="btn-group pull-right" >
  <button type="button" id="catalog_title_button"  class="btn btn-o2o btn-sm" style="width:110px;" id="ssname"> &nbsp;&nbsp; </button>
  <button type="button" class="btn btn-o2o  btn-sm dropdown-toggle" data-toggle="dropdown" style="height:30px;">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu" role="menu" id="ulId">
	<c:forEach items="${defautsCatalogList}" var="defautsCatalogItem">
		<li><a class = "catalogItem" href="#" onclick="onSearchClick(this)" id='${defautsCatalogItem.id}' >${defautsCatalogItem.catalogName}</a></li>
		<li class="divider"></li> 
	</c:forEach> 	 
  </ul>     
</div>

    <div class="btn-group pull-right" style="margin-right:10px;">
  <button id="class_title_button" type="button" class="btn btn-o2o3 btn-sm" style="width:110px;">${classList[0].className}</button>
  <button type="button" class="btn btn-o2o3 btn-sm dropdown-toggle" data-toggle="dropdown" style="height:30px;">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu" role="menu">
	<c:forEach items="${classList}" var="classItem">
		<li><a class = "classItem" href="#" id='${classItem.id}' >${classItem.className}</a></li>
		<li class="divider"></li> 
	</c:forEach>
  </ul>
</div>




       </div>
	   <div style="width:100%;height:90%" id="map_container"></div>
       
</body></html>