<%@ page import="yuan.ssm.common.constant.ManagerConstant" %>
<%@ page import="yuan.ssm.vo.UserVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 16-4-5
  Time: 下午12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserVo userVo= (UserVo) session.getAttribute(ManagerConstant.MANAGER_USER_NAME); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>新闻推荐-后台管理系统</title>
  <meta name="author" content="DeathGhost" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!--[if lt IE 9]>
  <script src="js/html5.js"></script>
  <![endif]-->
  <script src="js/jquery.js"></script>
  <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script>
    (function($){
      $(window).load(function(){

        $("a[rel='load-content']").click(function(e){
          e.preventDefault();
          var url=$(this).attr("href");
          $.get(url,function(data){
            $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
            //scroll-to appended content
            $(".content").mCustomScrollbar("scrollTo","h2:last");
          });
        });

        $(".content").delegate("a[href='top']","click",function(e){
          e.preventDefault();
          $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
        });

      });
    })(jQuery);
  </script>
</head>
<body>
<!--header-->
<header>
  <h1><img src="images/admin_logo.png"/></h1>
  <!-- 初始化 ：　管理员信息-->
  <ul class="rt_nav">
    <li><a href="/CustomerIndex.action" target="_blank" class="website_icon">站点首页</a></li>
    <li><a href="#" class="admin_icon"><%=userVo.getNick()%></a></li>
    <li><a href="#" class="set_icon">个人中心</a></li>
    <li><a href="/manager/managerLoginOut.action" class="quit_icon">安全退出</a></li>
  </ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
  <h2><a href="#">首页</a></h2>
  <ul>
    <li>
      <dl>
        <dt>用户信息</dt>
        <!--当前链接则添加class:active-->
        <dd><a href="/manager/managerUserPage.action" class="active">用户列表</a></dd>
        <dd><a href="#">用户兴趣</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>新闻信息</dt>
        <dd><a href="#">新闻列表</a></dd>
        <dd><a href="#">分类管理</a></dd>
        <dd><a href="#">来源管理</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>评论信息</dt>
        <dd><a href="#">评论管理</a></dd>
        <dd><a href="#">点赞管理</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>Api设计</dt>
        <dd><a href="#">管理员接口</a></dd>
        <dd><a href="#">用户接口</a></dd>
        <dd><a href="#">其他接口</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>关于</dt>
        <dd><a href="#">站点介绍</a></dd>
        <dd><a href="#">关于我</a></dd>
      </dl>
    </li>

    <li>
      <p class="btm_infor">© Yuan 版权所有</p>
    </li>
  </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
  <div class="rt_content">

    <section>
      <div class="page_title">
        <h2 class="fl">用户管理</h2>
        <a class="fr top_rt_btn">新增用户</a>
      </div>
      <table class="table" style="text-align:center">
        <tr>
          <th>序号</th>
          <th>头像</th>
          <th>账号</th>
          <th>昵称</th>
          <th>性别</th>
          <th>身份</th>
          <th>操作</th>
        </tr>
        <c:forEach items="${userVos}" var="userVo">
          <tr>
            <td>${userVo.id}</td>
            <td><img src="${userVo.head}" style="max-width: 50px;max-height: 50px;"></td>
            <td>${userVo.unum}</td>
            <td>${userVo.nick}</td>
            <td>${userVo.sex==0?"男":"女"}</td>
            <td>${userVo.status==0?"普通用户":"管理员"}</td>
            <td>
              <a href="#">表内链接</a>
              <a href="#" class="inner_btn">表内按钮</a>
            </td>
          </tr>
        </c:forEach>
      </table>
      <aside class="paging">
        <a>第一页</a>
        <a>1</a>
        <a>2</a>
        <a>3</a>
        <a>…</a>
        <a>1004</a>
        <a>最后一页</a>
      </aside>
    </section>



  </div>
</section>
</body>
</html>
