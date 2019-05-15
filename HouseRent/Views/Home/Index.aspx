<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FrontSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


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
    <div style ="width: 450px;float: right;margin-top: 40px;">
        <div id="age_chart" style="width: 450px;height:400px;"></div>
        <div id="publish_chart" style="width: 450px;height:400px;"></div>
    </div>
    <div id="house" style="width:450px;margin-top:40px;">
        <h4 style="font-weight: 600;padding-left:10px;">房屋信息</h4>
        <ul class="list-unstyled">
        </ul>
        <span style="font-size:14px;float:right;margin-right:40px;"><a href="/Front/House/Index" target="_blank">更多>></a></span>
        </div>
    <link href="../../Script/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../../Script/jquery.min.js"></script>
    <script src="../../Script/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="../../Script/echarts.min.js"></script>
    <script >
        $(function () {
            $.get('/Home/GetPageList', function (data) {
                var dom = $("#house ul");
                data = JSON.parse(data.data);
                data.forEach(function (item, index) {
                    dom.append($("<li><a href='/Front/House/Detail?houseId=" + item.HouseId + "' target='_blank'>" + item.Title + "<span>" + item.PublishTime + "</span></a></li>"))
                });
            });
            $.get('/Home/GetChartData', function (data) {
                if (!!data) {
                    if (!!data.barData) {
                        var dataArry = [];
                        var nameArray = [];
                        data.barData.forEach(function (item, index) {
                            dataArry.push(item.total);
                            nameArray.push(item.name);
                        });
                        option.series[0].data = dataArry;
                        option.xAxis[0].data = nameArray;
                    }
                    if (!!data.publishData) {
                        var dataArry = [];
                        var nameArray = [];
                        data.publishData.forEach(function (item, index) {
                            dataArry.push(item.total);
                            nameArray.push(String(item.date));
                        });
                        option2.series[0].data = dataArry;
                        option2.xAxis.data = nameArray;
                    }
                }
                ageChart.setOption(option);
                publishChart.setOption(option2);
            });
            // 年龄柱状图===================start
            var ageChart = echarts.init(document.getElementById('age_chart'));
            option = {
                title: {
                    text: '租房年龄分布'                    
                },
                color: ['#3398DB'],
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        data: [],
                        axisTick: {
                            alignWithLabel: true
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '人数',
                        type: 'bar',
                        barWidth: '60%',
                        data: []
                    }

                ]
            };
            
            // 年龄柱状图===================end

            //房屋发布趋势图==================start
            var publishChart = echarts.init(document.getElementById('publish_chart'));
            option2 = {
                title: {
                    text: '当月房屋发布趋势'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['发布数量']
                },

                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: []
                },
                yAxis: {
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    }
                },
                series: [
                    {
                        name: '数量',
                        type: 'line',
                        data: []

                    }
                ]
            };
           
            //房屋发布趋势图==================end
        });
    </script>
    <style>
        li {
            width: 100%;
            height: 50px;
            line-height: 50px;
            font-size: 16px;
        }
        li:hover {
            background-color:#c7c6c6;
        }
        a {
            color:#3e454c;
        }
        a:hover {
            text-decoration:none;
            color:#337ab7;
        }
        a:link {
            text-decoration:none;
        }
        ul li span {
            margin-left: 42px;
        }
    </style>
</asp:Content>
