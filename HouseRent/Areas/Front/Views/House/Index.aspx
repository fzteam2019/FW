<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<Houses.Model.House>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="maincontent">
<div class="list-content" id="list-content">

    <%
    int index = 0;
    foreach (var item in Model)
    {
    %>
    <div class="zu-itemmod" link="https://fz.zu.anjuke.com/fangyuan/1311021141" _soj="Filter_1&amp;hfilter=filterlist">
    <a data-company=""
        class="img"
        data-sign="true"
        href="Front/House/Detail"
        title="<%= item.Title %>"
        target="_blank"
        hidefocus="true">
        <img class="thumbnail"
                src="https://pic1.ajkimg.com/display/9a39bb9ea42ad5c4ef19b0a140e6d1ef/220x164.jpg"
                alt="<%= item.Title %>"
                width="180"
                height="135"
        >
        <i class="v-small"></i>
    </a>
    <div class="zu-info">
        <h3>
            <a target="_blank"
                title="<%= item.Title %>"
                href="javascript:void(0)" onclick="location.href='<%=Url.Action("Detail","House",new { houseId=item.HouseId })%>'"><%= item.Title %></a>
                                        </h3>
        <p class="details-item tag">
            1室1厅<span>|</span><%=item.Floorage %>平米<span>|</span>中层(共31层)                                                                    <i class="iconfont jjr-icon">&#xE147;</i>杨超                                                            </p>
        <address class="details-item">
            <a target="_blank" href="https://fz.anjuke.com/community/view/1067756">浮村新城二区</a>&nbsp;&nbsp;
            晋安-新店 南平东路58号                            </address>
        <p class="details-item bot-tag">
                <span class="cls-1">整租</span>
                <span class="cls-2">朝南</span>
                <span class="cls-3">有电梯</span>
                <span class="cls-4">1号线</span>
        </p>
    </div>
                        
    <div class="zu-side">
        <p><strong><%=item.Price %></strong> 元/月</p>
    </div>

        
    </div>
    <%
                index++;
            } %>

        
        <%=Html.Pager(Model) %>


    <div class="item-info"></div>
    <div class="item-info"></div>
</div>
</div>

<style>
    .maincontent .list-content {
        float: left;
        width: 900px;
        z-index: 0;
        zoom: 1;
        position: relative;
    }

    .maincontent .list-content .zu-itemmod {
        position: relative;
        height: 135px;
        cursor: pointer;
        padding: 20px;
        border-bottom: 1px dashed #e6e6e6;
        background-color: #fff;
    }

    .maincontent .list-content .zu-itemmod .img {
        float: left;
        width: 180px;
        height: 135px;
        position: relative;
    }

    .maincontent .list-content .zu-itemmod .zu-info {
        float: left;
        padding-left: 20px;
        width: 528px;
        overflow: hidden;
        font-size: 14px;
        color: #797979;
    }

    .maincontent .list-content .zu-itemmod .zu-info .details-item {
        width: 440px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 30px;
        line-height: 30px;
    }

    .maincontent .list-content .zu-itemmod .zu-info .details-item {
        width: 440px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 30px;
        line-height: 30px;
    }

    .maincontent .list-content .zu-itemmod .zu-info .details-item {
        width: 440px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 30px;
        line-height: 30px;
    }

    .maincontent .list-content .zu-itemmod .jx-sign {
        position: absolute;
        right: 20px;
        top: 29px;
        width: 32px;
        height: 16px;
        line-height: 16px;
        font-size: 12px;
        color: #e1e1e1;
        border: 1px solid #e1e1e1;
        border-radius: 4px;
        text-align: center;
    }
</style>

</asp:Content>
