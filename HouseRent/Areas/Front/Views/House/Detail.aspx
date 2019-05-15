<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="../../../../Css/detail.css" />
    <link rel="stylesheet" type="text/css" href="../../../../Css/index.css" />
    <link rel="stylesheet" type="text/css" href="../../../../Css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../../../../Css/Comment.css" />

    <div id="js_banner" class="fx_banner">
	<ul id="js_banner_img" class="fx_banner_img clear">

        <% var imagesStr = ((Houses.Model.DetailItem)Model).HouseInfo.Images;
           if (imagesStr!=null && imagesStr.Length>0){
               string[] images = imagesStr.Split(';');
               foreach(string image in images){
                   if(image!=""){
        %>            
                        <li>
                            <div class="fx_banner_inner fx_grid_c1">
                                <div class="child" data-z="2" style="left:0;top:0;"><img src="<%= '/'+image %>" style="width:900px;height:100%" alt=""></div>
                            </div>
                        </li>
        <%
                   }
               }
           }
           else
           {
               %>
               <li>
                    <div class="fx_banner_inner fx_grid_c1">
                        <div class="child" data-z="2" style="left:0;top:0;"><img src="/Images/安居客600x450c.jpg" alt=""></div>
                    </div>
                </li>
    <%
           }
        %>

<%--		<li style="background:#cfd0ef">
			<div class="fx_banner_inner fx_grid_c1">
				<div class="child child0" data-z="1"><img src="/Images/0.jpg" alt="misfit shine"></div>
				<div class="child" data-z="2" style="left:0;top:0;"><img src="/Images/0_1.png" alt=""></div>
				<div class="child" data-z="3" style="left:450px;top:0;"><img src="/Images/0_2.png" alt=""></div>
			</div>
			<a href="#" class="fx_banner_link"><span class="hide">去购买</span></a>
		</li>
		<li style="background:#fe5769">
			<div class="fx_banner_inner fx_grid_c1">
				<div class="child child0" data-z="1"><img src="/Images/1.jpg" alt="latin"></div>
				<div class="child" data-z="2" style="left:0;top:0;"><img src="/Images/1_1.png" alt=""></div>
				<div class="child" data-z="3" style="left:450px;top:0;"><img src="/Images/1_2.png" alt=""></div>
			</div>
			<a href="#" class="fx_banner_link"><span class="hide">去购买</span></a>
		</li>
		<li style="background:#a3e3ff">
			<div class="fx_banner_inner fx_grid_c1">
				<div class="child child0" data-z="1"><img src="/Images/2.jpg" alt="sony"></div>
				<div class="child" data-z="2" style="left:0;top:0;"><img src="/Images/2_1.png" alt=""></div>
				<div class="child" data-z="3" style="left:450px;top:0;"><img src="/Images/2_2.png" alt=""></div>
			</div>
			<a href="#" class="fx_banner_link"><span class="hide">去购买</span></a>
		</li>
		<li style="background:#f3eed4">
			<div class="fx_banner_inner fx_grid_c1">
				<div class="child child0" data-z="1"><img src="/Images/3.jpg" alt="洁灵卡"></div>
				<div class="child" data-z="2" style="left:0;top:0;"><img src="/Images/3_1.png" alt=""></div>
				<div class="child" data-z="3" style="left:450px;top:0;"><img src="/Images/3_2.png" alt=""></div>
			</div>
			<a href="#" class="fx_banner_link"><span class="hide">去购买</span></a>
		</li>
		<li style="background:#87c2e3">
			<div class="fx_banner_inner fx_grid_c1">
				<div class="child child0" data-z="1"><img src="/Images/4.jpg" alt="海尔天樽"></div>
				<div class="child" data-z="2" style="left:0;top:0;"><img src="/Images/4_1.png" alt=""></div>
				<div class="child" data-z="3" style="left:450px;top:0;"><img src="/Images/4_2.png" alt=""></div>
			</div>
			<a href="#" class="fx_banner_link"><span class="hide">去购买</span></a>
		</li>--%>



	</ul>
	<div class="fx_banner_common fx_grid_c1">
		<a ytag="30000" id="js_banner_pre" href="javascript:;" class="fx_banner_pre"></a>
		<a ytag="30010" id="js_banner_next" href="javascript:;" class="fx_banner_next"></a>
	</div>
</div>
    <!-- js_banner -->









<div class="mod-title bottomed">
    <h3 id="houseInfo" class="title nav-scroll">房屋信息</h3>
    <div class="right-info"><span id="houseCode">房屋编码：921837610343424，</span>发布时间：2019年04月19日</div>
</div>
<ul class="house-info-zufang cf">
    <li class="full-line cf">
                    <span class="price"><em>1000</em>元/月</span>
            <span class="type">付1押2</span>
                        <a href="javascript:void(0);" data-track="pc_zfdy_zjzs_click" class="full-link link lookPriceTrend">查看租金走势</a>
            <!-- 在折线图的脚本里判断了价格走势的的隐藏 -->
                        </li>
    <li class="house-info-item l-width">
        <span class="type">户型：</span>
        <span class="info"><%=((Houses.Model.DetailItem)Model).HouseInfo.HouseType.Name%></span>
    </li>
    <li class="house-info-item">
        <span class="type">面积：</span>
        <span class="info"><%=((Houses.Model.DetailItem)Model).HouseInfo.Floorage%></span>
    </li>
    <li class="house-info-item">
        <span class="type">朝向：</span>
        <span class="info">朝南</span>
    </li>
    <li class="house-info-item l-width">
        <span class="type">楼层：</span>
        <span class="info">中层(共31层)</span>
    </li>
    <li class="house-info-item">
        <span class="type">装修：</span>
        <span class="info">精装修</span>
    </li>
    <li class="house-info-item">
        <span class="type">类型：</span>
        <span class="info">普通住宅</span>
    </li>
    <li class="house-info-item l-width">
        <span class="type">小区：</span>
        <a href="https://fz.anjuke.com/community/view/1067756" class="link" target="_blank" _soj="propview">浮村新城二区</a>
                    &nbsp;(<a href="https://fz.zu.anjuke.com/fangyuan/jinana/" class="link" target="_blank" _soj="propview">晋安</a> <a href="https://fz.zu.anjuke.com/fangyuan/xindian/" class="link" target="_blank" _soj="propview">新店</a>)
    </li>
</ul>

<div class="mod-title bottomed">
    <h3 class="title" data-trace="{'pc_zfdy_xqwd_show':1}">求租留言</h3>
    <%--<a href="http://pages.anjuke.com/expert/ask.html?from=pc_fydy_xqwd_wrhcxzzl" class="mod-title-link" target="_blank" _soj="pc_zfdy_xqwd"><i class="iconfont"></i>如何出现在这</a>
    <a href="https://fz.anjuke.com/community/qa/834045" class="mod-title-link mod-title-right" target="_blank" _soj="pc_zfdy_xqwd">更多问答&gt;</a>--%>
</div>
<div class="comm-qa">

    <ul class="comm-qa-list">
        <%int index = 0;
          if (((Houses.Model.DetailItem)Model).Words != null)
          {
              foreach (var word in ((Houses.Model.DetailItem)Model).Words)
              { %>
        <li>
            <a href="javascript:void(0)" class="comm-qa-item clearfix" data-soj="pc_fydy_xqwd_wt" onselectstart="return false" target="_blank">
                <dl class="qa-item-q clearfix">
                    <dt><span>留言</span></dt>
                    <dd class="qa-item-txt"><%=word.Content%></dd>
                    <dd class="qa-time"><%=word.PublishTime%></dd>
                </dl>
                <dl class="qa-item-a clearfix">
                    <!-- <dt><span>回答</span></dt> -->
                    <dd><span class="qa-brokername" data-url="https://maitianfangchan4.anjuke.com/gongsi-jjr-6043638/">
                            卢忠慧：</span>不行，还没有出证</dd>
                    <%--<dd class="qa-item-linkto">我补充&gt;</dd>--%>
                </dl>
            </a>
        </li>
        <%}
          }%>
       
    </ul>

    <%--<div class="comm-qa-title2"><i class="iconfont"></i>待回答</div>
    <ul class="comm-qa-unanswer">
        <li><a class="clearfix" href="https://www.anjuke.com/qa/v25030350" target="_blank" data-soj="pc_fydy_xqwd_qhd"><p class="">【浮村新城二区】 小区房本下来了吗？</p>
        <em>2019-02-20</em><span class="">去回答&gt;</span></a></li>
        <li><a class="clearfix" href="https://www.anjuke.com/qa/v25700275" target="_blank" data-soj="pc_fydy_xqwd_qhd"><p class="">【浮村新城二区】 停车方便吗？一个停车费多少？</p>
        <em>2019-03-23</em><span class="">去回答&gt;</span></a></li>
    </ul>--%>
    <div class="comm-btn-group clearfix">
        <a href="javascript:void(0)" class="comm-qa-askbtn" target="_blank" data-soj="pc_fydy_xqwd_wytw" onclick="OpenWordsDialog()">我要提问</a>
        <%--<a href="https://fz.anjuke.com/ask/all/" class="comm-qa-ansbtn" target="_blank" data-soj="pc_fydy_xqwd_wyhd">我要回答</a>--%>
    </div>

</div>


<div class="mod-title bottomed">
    <h3 class="title" data-trace="">评价列表</h3>
</div>
<div>
    <ul>

        <% index = 0;
          if (((Houses.Model.DetailItem)Model).Comments != null)
          {
              foreach (var comment in ((Houses.Model.DetailItem)Model).Comments)
              { %>
        <li>
            <a href="javascript:void(0)" class="comm-qa-item clearfix" data-soj="pc_fydy_xqwd_wt" onselectstart="return false" target="_blank">
                <dl class="qa-item-q clearfix">
                    <dt><span>留言</span></dt>
                    <dd class="qa-item-txt"><%=comment.Content%></dd>
                    <dd class="qa-item-txt"><%=comment.Score%></dd>
                    <dd class="qa-time"><%=comment.CommentTime%></dd>
                </dl>
                <dl class="qa-item-a clearfix">
                    <!-- <dt><span>回答</span></dt> -->
                    <dd><span class="qa-brokername" data-url="https://maitianfangchan4.anjuke.com/gongsi-jjr-6043638/">
                            卢忠慧：</span>不行，还没有出证</dd>
                    <%--<dd class="qa-item-linkto">我补充&gt;</dd>--%>
                </dl>
            </a>
        </li>
        <%}
          }%>

    </ul>
    <div class="comm-btn-group clearfix">
        <a href="javascript:void(0);" class="comm-qa-askbtn" onclick="OpenCommentDialog()">我要评价</a>
    </div>
</div>

<!-- 遮罩层 -->
<div class="mask">

</div>
<!-- 求租留言  -->
<div class="words_dialog" >
    <div class="title">求租留言</div>
    <div>
        <form>
            <label>留言</label>
            <input type="text" id="content"/>
            <input type="button" value="提交" onclick="SaveWords()" />
            <input type="button" onclick="CloseWordsDialog()" value="取消" />
        </form>
    </div>
</div>

<!-- 评价弹窗框 -->
<form>
    <div class="comment_dialog">
        <div class="comment">
            <%--<div class="comment-level"></div>--%>
            <div class="comment-text-area">
                <%--<div class="text-area-star">
                    <label><input type="radio" name="star" value="1"/><span>一星</span></label>
                    <label><input type="radio" name="star" value="2"/><span>二星</span></label>
                    <label><input type="radio" name="star" value="3"/><span>三星</span></label>
                    <label><input type="radio" name="star" value="4"/><span>四星</span></label>
                    <label class="red"><input type="radio" checked name="star" value="5"/><span>五星</span></label>
                </div>--%>
                <div id="star">
		            <%--<span>评论打分</span>--%>
		            <ul>
			            <li><a href="javascript:;">-2</a></li>
			            <li><a href="javascript:;">-1</a></li>
			            <li><a href="javascript:;">0</a></li>
			            <li><a href="javascript:;">1</a></li>
			            <li><a href="javascript:;">2</a></li>
		            </ul>
		            <span></span>
		            <p></p>
	            </div>
                <div><textarea class="text-area text-area-input" id="content_comment" name="content">请输入评论内容......</textarea></div>
                <%--<div class="text-area-input-length">您还可输入<span>20</span>个字</div>--%>
                <div class="text-area-bottom"><a href="javascript:void(0);" onclick="CloseCommentDialog()">取消</a></div>
                <div class="text-area-bottom"><a href="javascript:void(0);" onclick="SaveComment()">提交评价</a></div>
            </div>  
        </div>
    </div>
</form>

<script src="../../../../Script/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../../../../Script/tab.js"></script>
<script type="text/javascript">
    $(function () {
        //var $window = $(window), window_width = $window.width();
        $('#js_banner, #js_banner_img li').width(900);
        new $.Tab({
            target: $('#js_banner_img li'),
            effect: 'slide3d',
            animateTime: 1000,
            stay: 3500,
            autoPlay: true,
            merge: true,
            prevBtn: $('#js_banner_pre'),
            nextBtn: $('#js_banner_next')
        });


        
    });


    window.onload = function () {

        var oStar = document.getElementById("star");
        var aLi = oStar.getElementsByTagName("li");
        var oUl = oStar.getElementsByTagName("ul")[0];
        var oSpan = oStar.getElementsByTagName("span")[0];
        var oP = oStar.getElementsByTagName("p")[0];
        var i = iStar = 0;
        var iScore = -8;
        var aMsg = [
                    "很不满意|差得太离谱，与卖家描述的严重不符，非常不满",
                    "不满意|部分有破损，与卖家描述的不符，不满意",
                    "一般|质量一般，没有卖家描述的那么好",
                    "满意|质量不错，与卖家描述的基本一致，还是挺满意的",
                    "非常满意|质量非常好，与卖家描述的完全一致，非常满意"
        ]

        for (i = 1; i <= aLi.length; i++) {
            aLi[i - 1].index = i;

            //鼠标移过显示分数
            aLi[i - 1].onmouseover = function () {
                fnPoint(this.index);
                //浮动层显示
                oP.style.display = "block";
                //计算浮动层位置
                oP.style.left = oUl.offsetLeft + this.index * this.offsetWidth - 104 + "px";
                //匹配浮动层文字内容
                oP.innerHTML = "<em><b>" + (this.innerText) + "</b> 分 " + aMsg[this.index - 1].match(/(.+)\|/)[1] + "</em>" + aMsg[this.index - 1].match(/\|(.+)/)[1]
            };

            //鼠标离开后恢复上次评分
            aLi[i - 1].onmouseout = function () {
                fnPoint();
                //关闭浮动层
                oP.style.display = "none"
            };

            //点击后进行评分处理
            aLi[i - 1].onclick = function () {
                iStar = this.index;
                oP.style.display = "none";
                oSpan.innerHTML = "<strong>" + (this.innerText) + " 分</strong> (" + aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
            }
        }

        //评分处理
        function fnPoint(iArg) {
            //分数赋值
            iScore = iArg || iStar;
            for (i = 0; i < aLi.length; i++) aLi[i].className = i < iScore ? "on" : "";
        }

    };


    function CheckUser() {
        
    }


    function OpenWordsDialog() {
        $(".mask").show();
        $(".words_dialog").show();
    }

    function CloseWordsDialog() {
        $(".mask").hide();
        $(".words_dialog").hide();
    }

    function SaveWords() {
        var content = $("#content").val();
        var houseId = GetUrlParam("houseId");
        $.ajax({
            url: "AddWords",
            type: 'POST',
            async: false,
            dataType: 'text',
            data: { content: content, userid: 1, houseid: houseId }, //
            success: function (resultData) {

                //$(".dialogDiv").hide();
                //if (resultData == "No") {
                //    ShowFailTip("操作失败，请您重试！");
                //} else if (resultData == "AA") {
                //    $.jBox.tip('管理员不能操作', 'error');
                //} else {
                //    var data = $(resultData);

                //}

                CloseWordsDialog();
                window.location = document.location.href;
            }
        });

    }


    function OpenCommentDialog() {
        $(".mask").show();
        $(".comment_dialog").show();
    }

    function CloseCommentDialog() {
        $(".mask").hide();
        $(".comment_dialog").hide();
    }

    function SaveComment() {
        var content = $("#content_comment").val();
        var score = '';
        if ($("div[id='star']>p>em>b") != null && $("div[id='star']>span>strong") != undefined) {
            score = $("div[id='star']>span>strong").text();
            score = score.replace("分", "").replace(" ", "");
        }
        if (score == '') {
            alert("分数不能为空");
            return;
        }
        if (content == '' || content == '请输入评论内容......') {
            alert("评论不能为空");
            return;
        }
        var houseId = GetUrlParam("houseId");
        $.ajax({
            url: "AddComment",
            type: 'POST',
            async: false,
            dataType: 'text',
            data: { content: content, score:score, userid: 1, houseid: houseId }, //
            success: function (resultData) {

                CloseWordsDialog();
                window.location = document.location.href;
            }
        });
    }

    function GetUrlParam(paraName) {
        var url = document.location.toString();
        var arrObj = url.split("?");
        if (arrObj.length > 1) {
            var arrPara = arrObj[1].split("&");
            var arr;

            for (var i = 0; i < arrPara.length; i++) {
                arr = arrPara[i].split("=");

                if (arr != null && arr[0] == paraName) {
                    return arr[1];
                }
            }
            return "";
        }
        else {
            return "";
        }
    }
</script>

<style>
    /*body {
        font: 12px/22px Verdana, Geneva, sans-serif;
        color: #333333;
        background: url(../Images/bodyback.jpg) repeat;
    }*/

    ul{
        list-style:none;
    }

    .bottomed {
        border-bottom: 1px solid #e6e6e6;
    }

    .mod-title {
        padding-top: 37px;
        line-height: 46px;
        font-size: 20px;
        color: #333;
        width: 100%;
    }

    .mod-title .title {
        display: inline-block;
        vertical-align: middle;
        color: #333;
    }

    .mod-title .right-info {
        font-size: 13px;
        line-height: 53px;
        color: #999;
        float: right;
    }

    a {
        color: #666;
        text-decoration: none;
        outline: none;
    }


    div {
        display: block;
    }

    .house-info-zufang {
        margin-bottom: -4px;
        font-size: 14px;
        color: #333;
        position: relative;
        height: 114px;
    }

    .cf {
        zoom: 1;
    }

    .cf:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }

    .house-info-zufang .full-line {
        display: block;
        margin-top: 9px;
        line-height: 30px;
        width:100%;
    }

    .house-info-zufang .full-line .price {
        float: left;
        color: #e54b00;
        margin-right: 5px;
        line-height: 24px;
    }

    .house-info-zufang .full-line .full-link {
        margin-left: 8px;
    }

    .house-info-zufang .type {
        color: #999;
    }

    .house-info-zufang a {
        color: #2666b2;
        cursor: pointer;
    }

    .house-info-zufang a:visited {
        color: #1f64b2;
    }

    .house-info-zufang .house-info-item {
        float: left;
        width: 235px;
        line-height: 28px;
    }

    .house-info-zufang .house-info-item .l-width {
        width: 410px;
    }

    .comm-qa .comm-qa-list li {
        width: 100%;
        position: relative;
        margin-top: 20px;
    }

    .comm-qa .comm-qa-list li a {
        display: block;
        width: 730px;
        color: #333;
    }

    .comm-qa .comm-qa-list .qa-item-q {
        height: 24px;
    }

    .comm-qa .comm-qa-list dl {
        margin-left: 55px;
    }

    .comm-qa .comm-qa-list .qa-item-q dt {
        margin-top: 3px;
    }

    .comm-qa .comm-qa-list dl dt {
        float: left;
        margin-left: -54px;
        width: 40px;
        height: 100%;
    }

    .comm-qa-list .qa-item-q dt span {
        background-color: #f60;
    }

    .comm-qa-list dl dt span {
        display: inline-block;
        color: #fff;
        width: 40px;
        height: 18px;
        line-height: 18px;
        text-align: center;
    }

    .comm-qa-list li a:hover {
        text-decoration: none;
        color: inherit;
        cursor: pointer;
    }

    .comm-qa-list .qa-item-q .qa-item-txt {
        float: left;
        max-width: 595px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    .comm-qa-list .qa-item-q .qa-time {
        margin-left: 10px;
        font-size: 12px;
        color: #666;
        float: left;
        font-weight: 400;
    }

    .comm-qa .comm-btn-group {
        margin-top: 20px;
    }

    .clearfix {
        display: block;
    }

    .clearfix:after {
        content: '.';
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }

    .comm-qa .comm-btn-group a {
        float: left;
        width: 110px;
        height: 36px;
        text-align: center;
        font-size: 14px;
        color: #fff;
        line-height: 36px;
        border-radius: 4px;
        background: #62ab00;
        margin-right: 10px;
    }

    /*遮罩层*/
    .mask{
        filter:alpha(opacity=30);
        -moz-opacity:0.3;
        opacity:0.3;
        background-color:#000;
        width:100%;
        height:100%;
        z-index:1000;
        position: absolute;
        left:0;
        top:0;
        display:none;
        overflow: hidden;
    }

    /*留言框*/
    .words_dialog,.comment_dialog {
        border:solid 10px #898989;
        background:#fff;
        padding:10px;
        width:780px;
        z-index:1001; 
        position: absolute; 
        display:none;
        top:50%; 
        left:50%;
        margin:-200px 0 0 -400px;
    }



</style>
</asp:Content>
