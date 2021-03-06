﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>用户管理</title>
</head>
<body>
    <div class="page-header wrap" style="width: 50%;margin: 0 auto;">
      <div class="logo">
            <img src="<%=Url.Content("~/Images/logo.png") %>"/>
        </div>
    </div>
    <div>
        <button type="button" style="margin-top: 20px;margin-left: 70%;" class="btn btn-info btn-sm" onclick="Add()">添加</button> 
        <div id="list" style="width: 60%;margin: 0 auto;margin-top: 50px;">
        </div>
        <ul class="pager" style="float: right;width: 60%;">
            <li><a href="#" onclick="PrePage();">上一页</a></li>
            <li><a href="#" onclick="NextPage();">下一页</a></li>
        </ul>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					    &times;
				    </button>
				    <h4 class="modal-title" id="myModalLabel">
					    用户编辑
				    </h4>
			    </div>
			    <div class="modal-body">
				    <form class="form-horizontal" role="form" style="padding-left:100px;">
	                    <div class="form-group">
		                    <label for="firstname" class="col-sm-3 control-label">登录名称</label>
		                    <div class="col-sm-5">
			                    <input type="text" class="form-control" id="login_name" 
				                       placeholder="请输入">
		                    </div>
	                    </div>
	                    <div class="form-group">
		                    <label for="lastname" class="col-sm-3 control-label">用户名称</label>
		                    <div class="col-sm-5">
			                    <input type="text" class="form-control" id="user_name" 
				                       placeholder="请输入">
		                    </div>
	                    </div>
                        <div class="form-group">
		                    <label for="lastname" class="col-sm-3 control-label">密码</label>
		                    <div class="col-sm-5">
			                    <input type="text" class="form-control" id="password" 
				                       placeholder="请输入">
		                    </div>
	                    </div>
                        <div class="form-group">
		                    <label for="lastname" class="col-sm-3 control-label">确认密码</label>
		                    <div class="col-sm-5">
			                    <input type="text" class="form-control" id="password_c" 
				                       placeholder="请输入">
		                    </div>
	                    </div>
                        <div class="form-group">
		                    <label for="lastname" class="col-sm-3 control-label">TelePhone</label>
		                    <div class="col-sm-5">
			                    <input type="text" class="form-control" id="telephone" 
				                       placeholder="请输入">
		                    </div>
	                    </div>
	                    <div class="form-group">
                            <label for="lastname" class="col-sm-3 control-label">用户角色</label>
		                    <div class="col-sm-5">
			                   <select class="form-control" id="rule_type" >
                                    <option value="0">游客</option>
                                    <option value="1">管理员</option>
                                    <option value="2">房东</option>          
                                </select>

		                    </div>
	                    </div>
                    </form>
			    </div>
			    <div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
				    </button>
				    <button type="button" onclick="Commit();" class="btn btn-primary">
					    确认修改
				    </button>
			    </div>
		    </div><!-- /.modal-content -->
	    </div><!-- /.modal -->
    </div>
    <link href="../../Script/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../../Script/jquery.min.js"></script>
    <script src="../../Script/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script>

        var GLOBAL_DATA = {};
        GLOBAL_DATA.total = 10;
        GLOBAL_DATA.currentPage = 1;
        GLOBAL_DATA.pageSize = 10;
        GLOBAL_DATA.editObject = '';
        GLOBAL_DATA.DialogType = 1;
        var RULE_TYPE = {0:"游客",1:"管理员",2:"房东"};
        $(function () {
            GetData();
        });
        function GetData() {
            var params = {};
            params.currentPage = GLOBAL_DATA.currentPage;
            params.pageSize = GLOBAL_DATA.pageSize;
            $("#list").empty();
            $.post("/Account/GetUserList",params, function (data) {
                var el = $(' <table class="table"> </table>');
                el.append(" <tr><th>登录ID</th><th>登录名称</th><th>用户名称D</th><th>TelePhone</th><th>角色</th><th>操作</th></tr>");
                data.forEach(function (item, index) {
                    var tr = $('<tr></tr>');
                    tr.append($('<td>' + item.LoginId + '</td>'))
                    tr.append($('<td>' + item.LoginName + '</td>'))
                    tr.append($('<td>' + item.UserName + '</td>'))
                    tr.append($('<td>' + item.Telephone + '</td>'))
                    tr.append($('<td>' + RULE_TYPE[item.RuleType] + '</td>'))
                    tr.append($('<td><button class="padding0 btn btn-primary" type="button" onclick="Edit(\'' + item.LoginId + '\')">编辑</button><button class="padding0 btn btn-danger" type="button" onclick="Del(\'' + item.LoginId + '\')">删除</button></td>'))
                    el.append(tr);
                });
                $("#list").append(el);
            });
        }

        function NextPage() {
            var totalPage = GetPageTotal();
            if (totalPage == GLOBAL_DATA.currentPage) {
                alert("无下一页");
                return false;
            } else {
                GLOBAL_DATA.currentPage = GLOBAL_DATA.currentPage + 1;
                GetData();
            }
        }

        function PrePage() {
            if (GLOBAL_DATA.currentPage == 1) {
                alert("当前已是第一页");
                return false;
            } else {
                GLOBAL_DATA.currentPage = GLOBAL_DATA.currentPage - 1;
                GetData();
            }
        }

        function GetPageTotal() {
            var pageCount =parseInt(GLOBAL_DATA.total / GLOBAL_DATA.pageSize);
            var temp = GLOBAL_DATA.total % GLOBAL_DATA.pageSize;
            if(temp > 0){
                pageCount += 1;
            }
            return pageCount;
        }

        function Edit(val) {
            GLOBAL_DATA.DialogType = 1;
            GLOBAL_DATA.editObject = val;
            $.get("/Account/GetUser?id="+val, function (data) {
                $('#login_name').val(data.LoginName);
                $('#user_name').val(data.UserName);
                $('#password').val(data.Password);
                $('#password_c').val(data.Password);
                $('#telephone').val(data.Telephone);
                $("#rule_type").val(data.RuleType);
            });
            $('#myModal').modal('show')
        }

        function Del(val) {
            $.get("/Account/DeleteUser?id=" + val, function (data) {
                GLOBAL_DATA.currentPage = 1;
                GetData();
                alert("删除成功！");
            });
        }

        function Commit() {
            if ($('#password').val() != $('#password_c').val()) {
                alert("两次密码不一致！");
                return false;
            } else {                
                var params = {}
                params.LoginId = GLOBAL_DATA.editObject;
                params.LoginName = $('#login_name').val();
                params.UserName = $('#user_name').val();
                params.Password = $('#password').val();
                params.Telephone = $('#telephone').val();
                params.RuleType = $("#rule_type").val();
                params.OperationTpye = GLOBAL_DATA.DialogType;
                $.post("/Account/Update", params, function (data) {
                    GLOBAL_DATA.currentPage = 1;
                    GetData();                    
                    $('#myModal').modal('hide');
                    alert("操作成功！");
                });                
            }
        }

        function Add() {
            GLOBAL_DATA.DialogType = 2;
            $('#login_name').val("");
            $('#user_name').val("");
            $('#password').val("");
            $('#password_c').val("");
            $('#telephone').val("");
            $("#rule_type").val("0");
            $('#myModal').modal('show');
        }

    </script>
    <style>
        .padding0 {
            padding: 0px 5px 0px 5px;
            font-size:10px;
            margin-right:3px;
        }
    </style>
</body>
</html>
