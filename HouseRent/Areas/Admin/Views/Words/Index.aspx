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
                    <input type="button" value="<%= string.IsNullOrEmpty(item.Answer) ? "回复":"修改" %>" onclick="location.href='<%=Url.Action("Edit","Words",new {area="Admin", id=item.Id })%>    '"/>
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
    <script type="text/javascript">
        function Del(id){
            if( confirm("确定要删除这条记录吗？")){
                location.href='<%=Url.Action("Delete", "House")%>'+"/"+id;
            }
        }
    </script>
    <style>
        img{
            width:100px;
            height:75px;
        }
    </style>

</asp:Content>



