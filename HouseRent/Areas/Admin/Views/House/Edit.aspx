<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Houses.Model.House>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    发布房屋信息
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="dialog">
        <div class="tit">
            <span class="norTile">新房屋信息发布</span>
            <span class="currTit">填写房屋信息</span>
        </div>
        <div class="box">
            <%Html.BeginForm();%>
                <%= Html.HiddenFor(m => m.HouseId)%>
            <p>
                <span style="width: 80px; text-align: right; display: inline-block">标题：</span>
                <%=Html.TextBoxFor(m=>m.Title) %>
                <span style="color: red"><%=Html.ValidationMessageFor(m=>m.Title) %></span>
            </p>
            <p>
                <span style="width: 80px; text-align: right; display: inline-block">户型：</span>
                <%=Html.EditorFor(m=>m.HouseType) %>
                <span style="color: red"><%=Html.ValidationMessageFor(m=>m.HouseType.Id) %></span>
            </p>
            <p>
                <span style="width: 80px; text-align: right; display: inline-block">面积：</span>
                <%=Html.EditorFor(m=>m.Floorage) %>
                <span style="color: red"><%=Html.ValidationMessageFor(m=>m.Floorage) %></span>
            </p>
            <p>
                <span style="width: 80px; text-align: right; display: inline-block">价格：</span>
                <%=Html.EditorFor(m=>m.Price) %>
                <span style="color: red"><%=Html.ValidationMessageFor(m=>m.Price) %></span>
            </p>
            <p>
                <span style="width: 80px; text-align: right; display: inline-block">位置：</span>
                <%=Html.EditorFor(m=>m.Street.District) %>&nbsp;区&nbsp;
                <span style="color: red">
                    <%=Html.ValidationMessageFor(m=>m.Street.District.Id) %>
                </span>
                <%=Html.EditorFor(m=>m.Street) %>&nbsp;街
                <span style="color: red">
                    <%=Html.ValidationMessageFor(m=>m.Street.Id) %>
                </span>
            </p>
            <p>
                <span style="width: 80px; text-align: right; display: inline-block">联系方式：</span>
                <%=Html.EditorFor(m=>m.Contract) %>
                <span style="color: red"><%=Html.ValidationMessageFor(m=>m.Contract) %></span>
            </p>
            <p>
                <span style="width: 80px; text-align: right; display:inline-block ">详细信息：</span>
                <%=Html.TextAreaFor (m=>m.Description) %>
                <span style="color: red"><%=Html.ValidationMessageFor(m=>m.Description) %></span>
            </p>
            <%--<p>
                <%=Html.InputFor(m=>m.Images) %><input type="button" value="上传" onclick="Upload()">
            </p>--%>
            <%= Html.HiddenFor(m => m.Images)%>
            <span>房屋图片：</span> <ul id="imageList">

            </ul>
            <input type="button" value="添加图片" onclick="OpenWordsDialog()" />
           
           
            <p style="height: 36px; width: 125px; margin: 30px 0 0 140px;">
                <input type="submit" value="立即发布" class="buttons" />
            </p>

            <%Html.EndForm(); %>

           
        </div>
    </div>


    <!-- 遮罩层 -->
<div class="mask">

</div>
<!-- 求租留言  -->
<div class="upload_dialog" style="display:none">
    <div class="title">求租留言</div>
    <div>
         <%--<%  Html.BeginForm("Upload", "House", FormMethod.Post, new { enctype = "multipart/form-data" }); %>
            <input type="file" name="imgUpload" multiple="multiple" accept="image/x-png,image/gif,image/jpeg,image/bmp" />
            <input type="submit" value="上传" />
        <% Html.EndForm(); %>--%>

         <form id="myForm">
                <%--<p class="img_P"><img id="previewPic" name="previewPic" /></p>--%>
                <p><input type="file" id="imgUpload" name="imgUpload" multiple="multiple" accept="image/x-png,image/gif,image/jpeg,image/bmp" />
                <button id="imageUploadBtn" type="button" value="上传">上传</button></p>
            </form> 
    </div>
</div>
    <script src="../../../../Script/webuploader/webuploader.min.js"></script>
    <script src="../../../../Script/ajaxfileupload.js"></script>"
    <script type="text/javascript">
        $().ready(function () {
            $("#Street_District_Id").change(function () {
                var id = $(this).val();
                if (id > 0) {
                    $.getJSON("<%=Url.Action("GetStreet","House")%>", {
                        'id': id
                    }, function (data) {
                        $("#Street_Id").find("option").remove();
                        $("#Street_Id").append($("<option value=''>--请选择--</option>"));
                        $.each(data, function (i, item) {
                            $("#Street_Id").append($("<option></option>").val(item["Id"]).text(item["Name"]));
                        });
                    });

                }
            });

            $('#imageUploadBtn').on('click', function () {
                $.ajaxFileUpload({
                    secureuri: false, //是否需要安全协议，一般设置为false
                    url: '<%=Url.Action("Upload","House") %>',
                    fileElementId: 'imgUpload', //文件上传域的ID
                    dataType:'text',
                    success: function (resultData, success) {
                        if (resultData != null && resultData.length > 0) {
                            var images = resultData.split(';');
                            var appendStr = "";
                            for (var i = 0; i < images.length; i++) {
                                if(images[i]!="")
                                    appendStr += "<li><a href='~" + images[i] + "' target='_blank'>"+ images[i]+"</a><sapn>删除<span></li>";
                            }

                            if (appendStr != "") {
                                $("#imageList").html($("#imageList").html() + appendStr);
                                
                                $("#Images").attr("value", $("#Images").attr("value") + resultData);
                            }
                        }

                        CloseWordsDialog();
                    }
                })
            });
        });

        function Upload() {
            $.ajax({
                url: '<%=Url.Action("Upload","House") %>',
                type: 'POST',
                async: false,
                dataType: 'text',
                data: formFile, //
                success: function (resultData) {

                    //$(".dialogDiv").hide();
                    //if (resultData == "No") {
                    //    ShowFailTip("操作失败，请您重试！");
                    //} else if (resultData == "AA") {
                    //    $.jBox.tip('管理员不能操作', 'error');
                    //} else {
                    //    var data = $(resultData);

                    //}
                    if (resultData != null && resultData.length > 0) {
                        var images = resultData.split(';');
                        var appendStr = "";
                        for (var image in images) {
                            appendStr += "<li><a href='" + image + "' /><sapn>删除<span></li>";
                        }
                        if (appendStr != "") {
                            $("#imageList").innerHtml = appendStr;
                        }
                    }
                    var ii = 0;
                }
            });
        }

        var uploader = new WebUploader.Uploader({
            swf: '../../../../Script/webuploader/Uploader.swf'

            // 其他配置项
        });

        uploader.on('fileQueued', function (file) {
            // do some things.
        });


        function OpenWordsDialog() {
            $(".mask").show();
            $(".upload_dialog").show();
        }

        function CloseWordsDialog() {
            $(".mask").hide();
            $(".upload_dialog").hide();
        }
    </script>
    <style>
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
    .upload_dialog{
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
