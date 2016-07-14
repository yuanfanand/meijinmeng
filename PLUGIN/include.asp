<%
'************************************
' Powered by ThemePluginEditor 1.1
' zsx http://www.zsxsoft.com
'************************************
Dim LuSongSong_theme(1)
LuSongSong_theme(0)=Array(" 博客首页公告","文章页广告 尺寸300px*250px","评论窗口背景文字图片","评论框广告 尺寸650px*60px","网页底部右侧简介等连接","博客Logo 尺寸229px*75px","手机平板导航菜单","隐藏评论后出现的说明文字","顶部横幅广告 尺寸700px*100px","文章页侧栏跟随特效")
LuSongSong_theme(1)=Array("Announcement.html","article_ad.html","comment-text-lusongsong.gif","comment_ad.html","footer_txt.html","logo.png","mnavbar.html","shenming.html","top_ad.html","Follow.html")

Call RegisterPlugin("LuSongSong","ActivePlugin_LuSongSong")

Function ActivePlugin_LuSongSong()
	'如果插件需要include代码，则直接在这里加。
    Call Add_Response_Plugin("Response_Plugin_Admin_Top",MakeTopMenu(1,"主题配置",BlogHost & "/zb_users/theme/LuSongSong/plugin/editor.asp","aLuSongSongManage",""))
	'这里加文件管理
	If CheckPluginState("FileManage") Then
		Call Add_Action_Plugin("Action_Plugin_FileManage_ExportInformation_NotFound","LuSongSong_exportdetail(""{path}"",""{f}"")")
	End If
    '这里是给后台加管理按钮
    If BlogVersion<=121028 Then Call Add_Response_Plugin("Response_Plugin_ThemeMng_SubMenu","<script type='text/javascript'>$(document).ready(function(){$(""#theme-LuSongSong .theme-name"").append('<input class=""button"" style=""float:right;margin:0;padding-left:10px;padding-right:10px;"" type=""button"" value=""配置"" onclick=""location.href=\'"&BlogHost&"/zb_users/theme/LuSongSong/plugin/editor.asp\'"">')})</script>")
End Function

Function LuSongSong_exportdetail(p,f)
	On Error Resume Next
	dim z,k,l,i
	z=LCase(f)
	k=LCase(p)
	l=lcase(blogpath)
	k=IIf(Right(k,1)="\",Left(k,Len(k)-1),k)
	l=IIf(Right(l,1)="\",Left(l,Len(l)-1),l)
	if k=l & "\zb_users\theme\LuSongSong\include" Then
		For i=0 To Ubound(LuSongSong_theme(1))
			If LuSongSong_theme(1)(i)=z Then LuSongSong_exportdetail=LuSongSong_theme(0)(i)
		Next
	End If
End Function
%>