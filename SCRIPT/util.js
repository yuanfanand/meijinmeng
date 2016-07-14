//手机导航栏下拉菜单
$(function(){

	$(".menu-icon").click(function(){
		var ul=$(".menu");
		if(ul.css("display")=="none"){
			ul.slideDown();
		}else{
			ul.slideUp();
		}
	});
	
	$(".menu-icon").click(function(){
		var _name = $(this).attr("name");
		if( $("[name="+_name+"]").length > 1 ){
			$("[name="+_name+"]").removeClass("select");
			$(this).addClass("select");
		} else {
			if( $(this).hasClass("select") ){
				$(this).removeClass("select");
			} else {
				$(this).addClass("select");
			}
		}
	});
	
	$(".nav li").click(function(){
		var li=$(this).text();
		$(".menu-icon").html(li);
		$(".menu").hide();
		/*$(".menu").css({background:'#C33333'});*/
		$("div").removeClass("select") ;   
	});
});

//top+comment
lastScrollY=0;
function heartBeat(){
var diffY;
if (document.documentElement && document.documentElement.scrollTop)
diffY = document.documentElement.scrollTop;
else if (document.body)
diffY = document.body.scrollTop
else
{/*Netscape stuff*/}
percent=.1*(diffY-lastScrollY);
if(percent>0)percent=Math.ceil(percent);
else percent=Math.floor(percent);
document.getElementById("full").style.top=parseInt(document.getElementById("full").style.top)+percent+"px";
lastScrollY=lastScrollY+percent;
if(diffY > 200){document.getElementById("full").style.display = "block"}
else{
document.getElementById("full").style.display = "none"}
}
suspendcode="<div id=\"topend\"><div id=\"full\" style='display:none; width:15px; height:57px; POSITION:absolute; left:50%; top:460px; margin-left:200px;  z-index:100; text-align:center;'><a href='#'><img src='http://meijinmeng.cn/1/zb_users/THEME/LuSongSong/style/images/btn_top.gif' /></a><br><br><a href='#comment'><img src='http://meijinmeng.cn/1/zb_users/THEME/LuSongSong/style/images/btn_comment.gif' /></a></div></div>"
document.write(suspendcode);
window.setInterval("heartBeat()",1);
function switchImage(imageId, imageUrl, linkId, linkUrl, preview, title, alt) {
	if(imageId && imageUrl) {
		var image = $(imageId);
		image.src = imageUrl;

		if(title) {
			image.title = title;
		}
		if(alt) {
			image.alt = alt;
		}
	}

	if(linkId && linkUrl) {
		var link = $(linkId);
		link.href = linkUrl;
	}
}

//侧栏跟随
(function(){
	$("#divMoveSide dt").html("<div><ul>"+$("#divMoveSide dt ul").html()+"</ul></div>")
	var oDiv=$("#divMoveSide div")[0];
	var H=0,iE6;
	var Y=oDiv;
	while(Y){H+=Y.offsetTop;Y=Y.offsetParent};
	iE6=window.ActiveXObject&&!window.XMLHttpRequest;
	if(!iE6){
		window.onscroll=function()
		{
			var s=document.body.scrollTop||document.documentElement.scrollTop;
			if(s>H){oDiv.className="div1 div2";if(iE6){oDiv.style.top=(s-H)+"px";}}
			else{oDiv.className="div1";}	
		};
	}

})();
//pinlun list Tabs
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
var menu=document.getElementById(name+i);
var con=document.getElementById("con"+name+i);
menu.className=i==cursel?"current":"";
con.style.display=i==cursel?"block":"none";
}
}