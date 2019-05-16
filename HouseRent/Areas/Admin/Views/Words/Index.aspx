<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList<Houses.Model.Words>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    房屋求租留言
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table class="house-list">
    <%
        int index = 0;
        foreach (var item in Model)
        {
            %>
    <tr <%if(index%2==0) {%>class="odd"<%} %>>
        <td class="house-thumb">
            <dl>
                <dd>求租留言：</dd>
                <dd><%=item.Content %></dd>
                <%--<dd></dd>--%>
            </dl>
        </td>
        <td class="house-type">
            <label class="ui-green">
                <%--<input type="button" value="<%= string.IsNullOrEmpty(item.Answer) ? "回复":"修改" %>" onclick="location.href='<%=Url.Action("Edit","Words",new {area="Admin", id=item.Id })%>    '"/>--%>
                <input type="button" value="<%= string.IsNullOrEmpty(item.Answer) ? "回复":"修改" %>" onclick="OpenReplyDialog('<%=item.Id %>')"/>
            </label>
        </td>
        <%--<td class="house-price">
            <label class="ui-green">
                <input type="button" value="删除" onclick="Del(<%=item.HouseId%>)"/>
            </label>
        </td>--%>
    </tr>
    <%
            index++;
        } %>
</table>
<%=Html.Pager(Model) %>


    <!-- 遮罩层 -->
<div class="mask">

</div>
<!-- 求租留言  -->
<div class="reply_dialog" style="display:none">
    <div class="title">求租留言</div>
    <span style="display:none" id="currWordId"></span>
    <div>
        <form id="myForm">
            <span>回复内容：</span>
            <input type="text" id="replyContent"></input>
            <%--<input type="button" value="提交" onclick="<%=Url.Action("Edit","Words",new {area="Admin", wordId="" })%> "/>--%>
            <input type="button" value="提交" onclick="ReplySubmit()"/>

            <input type="button" value="取消" onclick="CloseReplyDialog()" />
        </form> 
    </div>
</div>



    <script type="text/javascript">


        var currWordId = ''

        function Del(id){
            if( confirm("确定要删除这条记录吗？")){
                location.href='<%=Url.Action("Delete", "House")%>'+"/"+id;
            }
        }

        function ReplySubmit(){
            var reply = document.getElementById('replyContent').value;
                $.ajax({
                    url: '<%=Url.Action("Edit","Words",new {area="Admin"}) %>',
                type: 'POST',
                async: false,
                dataType: 'text',
                data: {wordId:this.currWordId,reply:reply}, //
                success: function (resultData) {
                    CloseReplyDialog();
                    window.location = document.location.href;
                    
                    }
                });


            //this.location.href = <%=Url.Action("Edit","Words",new {area="Admin"})%> + this.currWordId ; 
        }


        function CloseReplyDialog(){
            currWordId = '';
            $(".mask").hide();
            $(".reply_dialog").hide();
        }


        function OpenReplyDialog(wordId){
            currWordId = wordId;
            $(".mask").show();
            $(".reply_dialog").show();

            $.ajax({
                url: '<%=Url.Action("GetWord","Words",new {area="Admin"}) %>',
                    type: 'POST',
                    async: false,
                    dataType: 'text',
                    data: {wordId:this.currWordId}, //
                    success: function (resultData) {
                        document.getElementById('replyContent').value = resultData;
                    }
                });
        }

    </script>
    <style>
        img{
            width:100px;
            height:75px;
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
    .reply_dialog{
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



