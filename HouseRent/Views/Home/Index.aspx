<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
首页
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>   
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="../../Images/Images_House/67f56189-a800-49c8-8199-d42ffb6dba1e.jpg" alt="First slide">
        </div>
        <div class="item">
            <img src="../../Images/Images_House/29c9d241-d3b7-4334-bafc-224d77cc3666.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img src="../../Images/Images_House/8c140c5c-3735-4af3-8e3f-e93769bd82b3.jpg" alt="Third slide">
        </div>
    </div>
   <!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
    <link href="../../Script/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../../Script/jquery.min.js"></script>
    <script src="../../Script/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
</asp:Content>
