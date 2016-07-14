<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
'************************************
' Powered by ThemePluginEditor 1.1
' zsx http://www.zsxsoft.com
'************************************
%>
<% Option Explicit %>
<% 'On Error Resume Next %>
<% Response.Charset="UTF-8" %>
<!-- #include file="..\..\..\c_option.asp" -->
<!-- #include file="..\..\..\..\zb_system\function\c_function.asp" -->
<!-- #include file="..\..\..\..\zb_system\function\c_system_lib.asp" -->
<!-- #include file="..\..\..\..\zb_system\function\c_system_base.asp" -->
<!-- #include file="..\..\..\..\zb_system\function\c_system_event.asp" -->
<!-- #include file="..\..\..\..\zb_system\function\c_system_manage.asp" -->
<!-- #include file="..\..\..\..\zb_system\function\c_system_plugin.asp" -->
<!-- #include file="..\..\..\plugin\p_config.asp" -->

<%

Call System_Initialize()
'检查非法链接
Call CheckReference("")
'检查权限
If BlogUser.Level>1 Then Call ShowError(6)

BlogTitle="主题配置"
%>
<!--#include file="..\..\..\..\zb_system\admin\admin_header.asp"-->
<script type="text/javascript">
function copydata(This){
	if(navigator.userAgent.search(/ie/i)>-1){
		window.clipboardData.setData("text",$(This).attr("bindtag"));
		alert("复制成功！");
	}
	else{
		prompt("您的浏览器不支持复制，请按下CTRL+C手动复制！",$(This).attr("bindtag"));
	}	
}
</script>
<!--#include file="..\..\..\..\zb_system\admin\admin_top.asp"-->
        <div id="divMain">
          <div id="ShowBlogHint">
            <%Call GetBlogHint()%>
          </div>
          <div class="divHeader"><%=BlogTitle%></div>
          <div class="SubMenu"></div>
          <div id="divMain2"> 
          <form action="save.asp" method="post" enctype="multipart/form-data">
          <table width="100%" border="1" width="100%" class="tableBorder">
            <tr>
              <th scope="col" height="32" width="150px">配置项</th>
              <th scope="col">配置内容</th>
              <th scope="col" width="500px">调用代码</th>

            </tr>
			<tr>
  <th scope="row"> 博客首页公告</th>
  <td><textarea name="include_Announcement.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\Announcement.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_INCLUDE_ANNOUNCEMENT#&gt;<input style="float:right" name="copybutton_Announcement.html" id="copybutton_Announcement.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_ANNOUNCEMENT#&gt;" onclick="copydata(this)"/></td>
</tr>

<tr>
  <th scope="row">文章页广告 尺寸300px*250px</th>
  <td><textarea name="include_article_ad.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\article_ad.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_INCLUDE_ARTICLE_AD#&gt;<input style="float:right" name="copybutton_article_ad.html" id="copybutton_article_ad.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_ARTICLE_AD#&gt;" onclick="copydata(this)"/></td>
</tr>

<tr>
  <th scope="row">评论窗口背景文字图片</th>
  <td><input name="include_comment-text-lusongsong.gif" type="file"/></td>
  <td><!--&lt;#TEMPLATE_INCLUDE_COMMENT-TEXT-LUSONGSONG#&gt;-->comment-text-lusongsong.gif<input style="float:right" name="copybutton_comment-text-lusongsong.gif" id="copybutton_comment-text-lusongsong.gif" value="复制" type="button" bindtag="&lt;#ZC_BLOG_HOST#&gt;zb_users/theme/LuSongSong/include/comment-text-lusongsong.gif" onclick="copydata(this)"/></td>

</tr>

<tr>
  <th scope="row">评论框广告 尺寸650px*60px</th>
  <td><textarea name="include_comment_ad.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\comment_ad.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_INCLUDE_COMMENT_AD#&gt;<input style="float:right" name="copybutton_comment_ad.html" id="copybutton_comment_ad.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_COMMENT_AD#&gt;" onclick="copydata(this)"/></td>
</tr>

<tr>
  <th scope="row">网页底部右侧简介等连接</th>
  <td><textarea name="include_footer_txt.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\footer_txt.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_INCLUDE_FOOTER_TXT#&gt;<input style="float:right" name="copybutton_footer_txt.html" id="copybutton_footer_txt.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_FOOTER_TXT#&gt;" onclick="copydata(this)"/></td>
</tr>

<tr>
  <th scope="row">博客Logo 尺寸229px*75px</th>
  <td><input name="include_logo.png" type="file"/></td>
  <td><!--&lt;#TEMPLATE_INCLUDE_LOGO#&gt;-->logo.png<input style="float:right" name="copybutton_logo.png" id="copybutton_logo.png" value="复制" type="button" bindtag="&lt;#ZC_BLOG_HOST#&gt;zb_users/theme/LuSongSong/include/logo.png" onclick="copydata(this)"/></td>

</tr>

<tr>
  <th scope="row">手机平板导航菜单</th>
  <td><textarea name="include_mnavbar.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\mnavbar.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_include_mnavbar#&gt;<input style="float:right" name="copybutton_mnavbar.html" id="copybutton_mnavbar.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_MNAVBAR#&gt;" onclick="copydata(this)"/></td>
</tr>

<tr>
  <th scope="row">隐藏评论后出现的说明文字</th>
  <td><textarea name="include_shenming.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\shenming.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_INCLUDE_SHENMING#&gt;<input style="float:right" name="copybutton_shenming.html" id="copybutton_shenming.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_SHENMING#&gt;" onclick="copydata(this)"/></td>
</tr>

<tr>
  <th scope="row">顶部横幅广告 尺寸700px*100px</th>
  <td><textarea name="include_top_ad.html" style="width:98%"><%=LoadFromFile(BlogPath & "zb_users\theme\LuSongSong\include\top_ad.html","utf-8")%></textarea></td>
  <td>&lt;#TEMPLATE_INCLUDE_TOP_AD#&gt;<input style="float:right" name="copybutton_top_ad.html" id="copybutton_top_ad.html" value="复制" type="button" bindtag="&lt;#TEMPLATE_INCLUDE_TOP_AD#&gt;" onclick="copydata(this)"/></td>
</tr>


          </table>
          <input name="ok" type="submit" class="button" value="提交"/>
          </form>
         <script type="text/javascript">ActiveTopMenu("aLuSongSongManage");</script> 
          </div>
        </div>
        <!--#include file="..\..\..\..\zb_system\admin\admin_footer.asp"-->

<%Call System_Terminate()%>
